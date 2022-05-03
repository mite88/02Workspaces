/*
PL/SQL(Procedural Language)

DB업무를 처리하기 위해 최적화된 언어
*/

--hr계정에서....

/*
-PL/SQL의 기본형식

declare
   변수선언;
begin
    실행부;
end;
/

*/

-- PL/SQL용 화면출력용(안하면 출력안됨)

set SERVEROUTPUT on;

--선언부 : 주로 변수 선언
declare 
    cnt number; --숫자타입변수선언
 --실행부 : begin~end 로직작성    
begin
    -- :=  대입연산자
    cnt :=10; --변수할당
    cnt :=cnt+1; 
    dbms_output.put_line(cnt); --println()과 같음
end;
/--호스트환경으로 빠지는용도


/*
사원테이블에서 사원번호가 120번인 사원의 이름과 연락처출력
*/

set SERVEROUTPUT on;

DECLARE
    -- 기존컬럼을 보고 길이를 지정해준다
    empName varchar2(50);
    empPhone varchar2(20);
begin
    /*
    실행부 : select 절에서 가져온 결과를 선언부에서 선언한 변수에
    1:1로 대입하여 값 저장 이때 into 사용
    */
    select concat(first_name||' ', last_name), phone_number 
    into empName, empPhone
    from employees where employee_id='120';
    
    DBMS_OUTPUT.PUT_LINE(empName||' '||empPhone);
end;
/

--------------------------------------------------------------
/*
부서번호 10번인 사원의 사원번호, 급여, 부서번호를 가져와
작성
(참조변수)
*/;
select employee_id, salary, department_id 
from employees 
where department_id='10';


DECLARE
    -- 사원테이블의 특정 컬럼의 타입,크기를 그대로 참조하는 참조변수 선언
--하나의컬럼 : 테이블명.컬럼명%type
    eid employees.employee_id%type;
    sal employees.salary%type;
    deptid employees.department_id%type;
BEGIN
    select employee_id, salary, department_id 
    into eid, sal, deptid 
    from employees 
    where department_id='10';
    
    DBMS_OUTPUT.PUT_LINE(eid||' '||sal||' '||deptid);
end;
/

/*
사원번호가 100인 사원의 레코드를 가져와
emp_row 변수에 전체 컬럼저장후 출력
단, emp_row는 사원테이블에 전체컬럼을 저장할수 있는 참조변수여야함
출력정보:사원번호, 이름, 이메일, 급여
*/

DECLARE
    -- 전체컬럼 : 테이블명%rowType
    emp_row employees%rowType;
BEGIN
    select * into emp_row
    from employees where EMPLOYEE_ID='100';  
    DBMS_OUTPUT.PUT_LINE(emp_row.EMPLOYEE_ID||' '|| 
    emp_row.FIRST_NAME||' '||emp_row.EMAIL||' '||emp_row.SALARY);
end;
/
--------------------------------------------------------------
/*
복합변수
class처럼 자료형을 몇가지 묶어서 생성하는 변수

type 복합변수명 is record (
	변수1 테이블명.컬럼명%type,
	변수2 자료형(크기),
	.... 
);
*/
select emplyee_id, concat(first_name||' ', last_name), job_id 
from employees where employee_id='100';

declare
    -- 복잡자료형선언
    type emp_3type is record(
        emp_id employees.EMPLOYEE_ID%type,
        emp_name varchar2(50),
        emp_job employees.job_id%type
    );
    record3 emp_3type;
    
begin
    select EMPLOYEE_ID, concat(FIRST_NAME||' ', LAST_NAME), JOB_ID 
    into record3 
    from employees where employee_id='100';
    
     DBMS_OUTPUT.PUT_LINE(record3.emp_id||' '||
     record3.emp_name||' '||
     record3.emp_job);
end;
/

/*
아래 절차에 따라 PL/SQL문을 작성하시오.
1.복합변수생성
- 참조테이블 : employees
- 복합변수자료형의 이름 : empTypes
        멤버1 : emp_id -> 사원번호
        멤버2 : emp_name -> 사원의전체이름(이름+성)
        멤버3 : emp_salary -> 급여
        멤버4 : emp_percent -> 보너스율
위에서 생성한 자료형을 이용하여 복합변수 rec2를 생성후 
사원번호 100번의 정보를 할당한다.

2.1의 내용을 출력한다.
3.위 내용을 완료한후 치환연산자를 사용하여 사원번호를 사용자로부터 
  입력받은 후 해당 사원의 정보를 출력할수있도록 수정하시오.
*/

/*
치환연산자 : PL/SQL에서 사용자로부터 데이터를 입력받을때 사용하는 연산자
변수앞에 &를붙임 실행시 입력창이 뜸
*/
--입력받는 명령어 : accept 변수명 [prompt '문자열']
accept inputNum prompt '사원번호 입력'; 

declare
    --4개의 멤버를 가진 복합변수자료형 선언
    type empTypes is record(
        emp_id employees.EMPLOYEE_ID%type,
        emp_name varchar2(50),
        emp_salary employees.SALARY%type,
        emp_percent employees.COMMISSION_PCT%type
    );
    --복합변수자료형을 통해 변수 생성
    rec2 empTypes;
    
    inputNum number(3) :=&inputNum;
begin
    select EMPLOYEE_ID,  concat(FIRST_NAME||' ', LAST_NAME), 
    SALARY, nvl(COMMISSION_PCT, 0)
    into rec2 
    --입력받은내용의 변수인 num1을 조건식에 넣음
    from employees where EMPLOYEE_ID=&inputNum;
    
      DBMS_OUTPUT.PUT_LINE(rec2.emp_id||' '||
     rec2.emp_name||' '||
     rec2.emp_salary||' '||
     rec2.emp_percent);
end;
/

--------------------------------------------------------------
/*
바인드변수

- 호스트 환경(PL/SQL의 블럭을 제외한 부분)에서 선언된변수
- 비 PL/SQL
- PL/SQL 내에서 전역변수처럼 사용가능

<쓰는법>
var 변수명 자료형;
또는 
variable 변수명 자료형;
*/
--호스팅환경에서 바인드변수 선언
var return_var number;

--PL/SQL
declare
begin
    --일반변수와의 구분 을위해 바인드변수앞에 :붙임
    :return_var :=999;
end;
/

--호스트환경출력용(가끔씩안될수도 있음 : cmd창에선 정상적으로됨)
print return_var;


/*
--조건문1 : if문

if 조건1 then
	조건1이 참일때 실행문;
elsif 조건2 then
	조건2가 참일때 실행문;
else
	모든 조건에 만족하지 않을때 실행문;
end if;
*/

declare
    num number;--숫자타입 변수 선언
begin
    num :=10;
    --나머지구해서 짝수/홀수 판단
    IF mod(num,2) = 0  THEN
        dbms_output.put_line(num ||'은 짝수');
      ELSE
        dbms_output.put_line(num ||'은 홀수');
      END IF;
end;
/
--치환연산자로변경
declare
     num number := &number;
begin
    --num :=10;
    --나머지구해서 짝수/홀수 판단
    IF mod(num,2) = 0  THEN
        dbms_output.put_line(num ||'은 짝수');
      ELSE
        dbms_output.put_line(num ||'은 홀수');
      END IF;
end;
/

/*
시나리오] 사원번호를 사용자로부터 입력받은 후 해당 사원이 어떤부서에서
근무하는지를 출력하는 PL/SQL문을 작성하시오. 단, if~elsif문을 사용하여
구현하시오.
*/
declare
    emp_id employees.employee_id%type := &emp_id1;
    emp_name varchar2(50);
    emp_dept employees.department_id%type;
    dept_name varchar2(30) := '부서정보없음';
begin
    select 
    employee_id,last_name, department_id 
    into emp_id, emp_name, emp_dept
    from employees
    where employee_id= emp_id;
    
    IF emp_dept = 50 THEN
        dept_name :='Shipping';
    elsif emp_dept = 60 THEN
    dept_name :='IT';
      elsif emp_dept = 70 THEN
    dept_name :='Public Relations';
      elsif emp_dept = 80 THEN
    dept_name :='Sales';
      elsif emp_dept = 90 THEN
    dept_name :='Executive';
      elsif emp_dept = 100 THEN
    dept_name :='Finance';
      END IF;
      
      dbms_output.put_line('사원번호'|| emp_id ||'의 정보');
      dbms_output.put_line('이름'|| emp_name
      ||', 부서번호 :'|| emp_name
      ||', 부서번호 :'|| emp_dept
      ||', 부서명 :'|| dept_name);
end;
/

/*
조건문2 : case문

case 변수
	when 변수값1 then '조건만족시 할당 값1'
	when 변수값2 then '조건만족시 할당 값2'
	when 변수값3 then '조건만족시 할당 값3'
end;

if문과 달리 할당할 변수를선언후 문장내에서 조건에 따라 하나의값을 할당
*/
--시나리오] 앞에서 if~elsif로 작성한 PL/SQL문을 case~when문으로 변경
declare
    emp_id employees.employee_id%type := &emp_id1;
    emp_name varchar2(50);
    emp_dept employees.department_id%type;
    dept_name varchar2(30) := '부서정보없음';
begin
    select 
    employee_id,last_name, department_id 
    into emp_id, emp_name, emp_dept
    from employees
    where employee_id= emp_id;
    
    dept_name :=
        case emp_dept
            when 50 then 'Shipping'
            when 60 then 'IT'
            when 70 then 'Public Relations'
            when 80 then 'Sales'
            when 90 then 'Executive'
            when 100 then 'Finance'
        end;
   
      dbms_output.put_line('사원번호'|| emp_id ||'의 정보');
      dbms_output.put_line('이름'|| emp_name
      ||', 부서번호 :'|| emp_name
      ||', 부서번호 :'|| emp_dept
      ||', 부서명 :'|| dept_name);
end;
/


/*
반복문1 : Basic Loop문
(do while문과 비슷함)

loop
	반복 실행문;
end loop;
*/
declare
    num number := 0;
begin
    loop
     --0~10까지 출력
     DBMS_OUTPUT.PUT_LINE (num);
     num := num + 1;
     --10까지 출력함
     exit when (num>10);
    end loop;
end;
/

/*
시나리오] 
Basic loop문으로 1부터 10까지의 정수의 합을 구하는 프로그램을 작성하시오.
*/
declare
    i number := 1; --증가변수
    sumNum number := 0; --누적변수
begin
    --PL/SQL은 복합 및 증감연산자 없음
    loop
        sumNum := sumNum + i;
        i :=i + 1;
        exit when (i>10);
    end loop;
    
    dbms_output.put_line('1~10까지의합은:'||sumNum);
end;
/

/*
반복문2 : while문

while 조건 loop
	반복 실행문;
end loop;
*/
declare
    num1 number := 0;
begin
    while num1<11 loop
        dbms_output.put_line('이번숫자는:'||num1);
        num1 := num1 + 1;
    end loop;
end;
/

/*
while loop문으로 다음과 같은 결과를 출력하시오.

*
**
***
****
*****
*/
declare
    --*를 누적해서 연결할 문자형 변수 선언
    starStr varchar2(100);
    --반복을 위한변수 선언 및 초기화
    i number := 1;
    j number := 1;
begin
    while i<5 loop
        while j<5 loop
            starStr := starStr || '*';
            --탈출조건
            exit when (j <= i);
        end loop;
        dbms_output.put_line(starStr);
        i := i + 1;
        j := 1;--j 1로 초기화
    end loop;
end;
/

declare
    i number := 1;
    sumNum number:= 0;
begin
    while i<=10 loop
        sumNum := sumNum + i;
        i := i + 1;
    end loop;
    
    dbms_output.put_line('1~10까지의합은:'||sumNum);
end;
/


/*
반복문3 : for 문 - 오름차순으로 반복
for 반복할변수 in 시작값 .. 종료값 loop
	반복 실행문;
end loop;

반복문3 : for 문 - 내림차순으로 반복

for 반복할변수 in reverse 시작값 .. 종료값 loop
	반복 실행문;
end loop;
*/

declare
begin
    for num2 in 0 .. 10 loop
        dbms_output.put_line('for문짱인듯:'||num2);
    end loop;
end;
/

declare
begin
    for num3 in reverse 0 .. 10 loop
        dbms_output.put_line('거꾸로for문짱인듯:'||num3);
    end loop;
end;
/

/*
연습문제] for loop문으로 구구단을 출력하는 프로그램을 작성하시오. 
*/

declare
    resultNum varchar2(100); --곱셈한결과인 변수
    resultStr varchar2(1000); --누적해서 저장할 변수
begin
    for dan in 2 .. 9 loop
        for sun in 1 .. 9 loop
            resultNum :=dan*sun;
           
            resultStr := resultStr ||''|| 
                dan||'*'||sun||'='||resultNum||' ';
           
        end loop;
        dbms_output.put_line(resultStr);
        resultStr := '';
    end loop;
end;
/


---------------------------------------------------------
/*
커서(Cursor)

Select 문장에서 여러행이 반환되는 경우 각 행에 접근하기 위한 반복개체

Cursor 커서명 Is
	Select 문장(Into 절이 없는 Select문)
    
    
Open Cursor명  
 쿼리를 실행하여 결과셋을 얻어온다. Cursor는 결과셋의 첫번째행에 위치 
 
 Fetch ~ Into ~  
결과셋에서 하나의 행을 읽어들이는 작업으로 
결과셋의 인출(Fetch)한 후에 Cursor는  다음행 으로 이동 

Close Cursor명 
커서 닫기로 결과셋의 자원을 반납  


*/


--시나리오] 부서테이블의 레코드를 Cursor를 통해 출력하는 PL/SQL문을 작성하시오.

declare
    --참조변수 선언
    v_dept departments%rowtype;
    --커서선언 : 부서테이블의모든 레코드조회
    cursor cur1 is
        select 
            department_id, department_name, location_id 
        from departments;
begin
    open cur1;--쿼리문의 결과셋(쿼리문 수행 후 반환되는 결과) 가져옴
    
    -- 보통 basic loop로 함
    loop
        fetch cur1 into
            v_dept.department_id,
            v_dept.department_name,
            v_dept.location_id;
            
            --탈출조건 : 인출할 행이있는지 검사
            exit when cur1%notfound;
            
            dbms_output.put_line(v_dept.department_id||' '||
            v_dept.department_name||' '||
            v_dept.location_id);
    end loop;
    
    close cur1;
end;
/

/*
시나리오] Cursor를 사용하여 사원테이블에서 커미션이 null이 아닌
사원의 사원번호, 이름, 급여를 출력하시오. 출력시에는 이름의 오름차순으로 정렬하시오.
*/

declare
    --커서 생성
    cursor curEmp is
        select employee_id, last_name, salary 
        from employees 
        where commission_pct is not null 
        order by last_name asc;
    --참조변수선언
    varEmp employees%rowType; 
begin
    open curEmp;
    
    --결과셋인출
    loop
        fetch curEmp
            into varEmp.employee_id,  varEmp.last_name, varEmp.salary;
            --탈출조건
            exit when curEmp%notFound;
            
            dbms_output.put_line( varEmp.employee_id|| ' ' ||
            varEmp.last_name|| ' ' ||
            varEmp.salary);
    end loop;
    
    close curEmp;
end;
/
------------------------------------------------------------------
/*
컬렉션(Collection)

- 배열 형태의 데이터 타입
- 같은 데이터 타입을 가진 요소들로 구성됨
- 다양한 데이터 타입을 가질 수 있는 동시에, 여러 로우(row)에 해당하는 데이터를 가질 수 있는 자료형
- 생성자를 이용해 초기화가 가능함
- 빌트인(내장) 함수와 프로시저로 구성된 컬렉션 메소드를 제공함
*/

/*
연관배열(Associative Array / Index-by Table)

- 키와 값의 쌍으로 구성된 컬렉션 (Java나 C#과 같은 언어에서 사용하는 Hash table과 동일한 개념
- 키를 Index라고 부르기 때문에 Index-by 테이블 이라고도 한다.
- varray가 요소의 인덱스를 통해 각 요소의 값에 접근하는 반면 
  Associative array는 키에 의해 값에 접근
- 키 타입은 주로 PLS_INTEGER, BINARY_INTEGER와 같은 숫자형이 사용되지만, 
  VARCHAR2과 같이 문자형도 사용가능

TYPE 연관배열_타입명 IS 
    TABLE OF 요소_값_타입 
    INDEX BY 요소_키_타입;
*/

/*
시나리오] 다음의 조건에 맞는 연관배열을 생성한 후 값을 할당하시오.
    연관배열 자료형 명 : avType, 값의자료형:문자형, 키의자료형:문자형
    key : girl, boy
    value : 트와이스, 방탄소년단
    변수명 : var_array
*/
declare
    Type avType Is
        Table of varchar2(30)
        Index By varchar2(10);
    var_array avType;
begin
    var_array('girl') := '트와이스';
    var_array('boy') := '방탄소년단';
    
    dbms_output.put_line(var_array('girl'));
    dbms_output.put_line(var_array('boy'));
end;
/

/*
시나리오] 100번 부서에 근무하는 사원의 이름을 저장하는 연관배열을 생성하시오.     
key는 숫자, value는 full_name 으로 지정하시오.
*/
--쿼리문작성
select first_name||' '||last_name from employees where department_id=100;

declare
    --결과가 하나가 아니기에 cursor 사용함
    cursor emp_cur is
        select first_name||' '||last_name from employees 
        where department_id=100;
        
    --연관배열 자료형 생성    
    Type nameAvType Is
        Table Of varchar2(30)
        Index By binary_integer;
    names_arr nameAvType;
    --자료형을 기반으로 변수 생성
    fname varchar2(50); --사원명
    idx number := 1; --index 용
begin
    open emp_cur;
    loop
        fetch emp_cur into fname;
        exit when emp_cur%NotFound;
        names_arr(idx) := fname;
        idx := idx + 1;
    end loop;
    close emp_cur;
    
    for i in 1.. names_arr.count loop
        dbms_output.put_line(names_arr(i));
    end loop;

end;
/

/*
VArray(Variable Array)

- 고정 길이(fixed number)를 가진 배열
- 선언시에 배열의 전체 크기를 명시해야 한다.
- 데이터를 참조할 때 각각의 요소들 순서대로 참조해야 한다.
- 숫자형 인덱스만 사용할 수 있다.
- 데이터 타입은 일반 테이블의 컬럼 타입으로 사용될 수 있다.(Nested Table과 동일)

TYPE Varray_타입명 IS 
    ARRAY(크기) OF 요소_값_타입;
*/
declare
    --Varray 타입 선언
    type vaType is
        array(5) of varchar2(20);
    --변수 선언
    v_arr vaType;
    cnt number := 0;
begin
    --생성자를 통한 값 초기화(3개만 할당함)
    v_arr := vaType('First','Second','Third','','');
    
    --Basic loop문을 통해 원소 출력(index는 1부터임)
    loop
        cnt := cnt +1;
        --탈출조건을 if문으로 작성함
        if cnt>5 then
            exit;
        end if;
        --index를 통해 출력
        dbms_output.put_line(v_arr(cnt));
    end loop;
    
    v_arr(3) := '우리는';
    v_arr(4) := 'JAVA';
    v_arr(5) := '개발자다';
    
    --배열출력
    for i in 1 .. 5 loop
        dbms_output.put_line(v_arr(i));
    end loop;
end;
/

--커서대신사용하는방법
declare
    --VArray 선언, 사원아이디컬럼참조하여 생성
    type vaType1 is
        array(6) of employees.employee_id%Type;
    va_one vaType1 := vaType1('','','','','','');
    cnt number := 1;
begin
   /*
   Java의 개선된 for문과 비슷하게 쿼리의 결과셋 갯수만큼 반복하는 형태로 사용
   select 절의 employee_id가 변수 i에 할당 및 추출가능
   */
    for i in( select employee_id from employees 
    where department_id=100) loop
        va_one(cnt) := i.employee_id;
        cnt := cnt +1;
    end loop;

    for j in 1 .. va_one.count loop
        dbms_output.put_line(va_one(j));
    end loop;
end;
/

/*
중첩테이블(Nested Table)

- VARRAY와 흡사한 구조를 가지고 있으나, 차이점은 크기에 제한이 없다.
- 선언시에 배열의 크기를 명시할 필요 없음.
- 데이터를 참조할 때 각각의 요소 순서를 지킬 필요 없음. (VARRAY와 반대)
- 숫자형 인덱스만 사용할 수 있다.
- 데이터 타입은 일반 테이블의 컬럼 타입으로 사용될 수 있다.(VARRAY와 동일)

TYPE 중첩테이블_타입명 IS 
    TABLE OF 요소_값_타입;
*/
declare
    --중첩테이블의 자료형 생성 후 변수 선언
    type ntType is
        table of varchar2(30);
   nt_array ntType;
begin
    --생성자를 통해 값 할당
    nt_array := ntType('첫번째','두번째','세번째','');
    
    DBMS_OUTPUT.PUT_LINE(nt_array(1));
    DBMS_OUTPUT.PUT_LINE(nt_array(2));
    DBMS_OUTPUT.PUT_LINE(nt_array(3));
    
    nt_array(4) := '네번째값 할당';
    DBMS_OUTPUT.PUT_LINE(nt_array(4));
    
     --nt_array(5) := '다섯번째값??할당??'; --에러
     
     --동적으로 생성하여 크기를변경함
     nt_array := ntType('1a','2b','3c','4d','5e','6f','7g');
     
     for i in 1 .. 7 loop
         DBMS_OUTPUT.PUT_LINE(nt_array(i));
     end loop;
end;
/

/*
시나리오] 중첩테이블과 for문을 통해 사원테이블의 
전체 레코드의 사원번호와 이름을 출력하시오.
*/
declare
    /*
    중첩테이블 자료형 선언 및 변수 선언
    
    사원테이블전체 칼럼 참조하는 참조변수 형태
    */
    type ntType is
        table of employees%rowType;
    nt_array ntType;
begin
    --생성자를 통해 초기화(크기 지정 x)
     nt_array := ntType();
     
     --사원테이블 레코드 수많큼 반복하면서 rec에 저장
     for rec in (select * from employees) loop
        nt_array.extend; --null 요소 추가
        nt_array(nt_array.last) := rec; --마지막인덱스에 데이터 넣기
     end loop;
     
     --첫번째 인덱스부터 마지막인덱스까지 돌려서 출력하기
     FOR i IN nt_array.first .. nt_array.last LOOP
        dbms_output.put_line(nt_array(i).employee_id||
        '>'||nt_array(i).first_name);
     END LOOP;
end;
/