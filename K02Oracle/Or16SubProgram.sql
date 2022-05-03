/************
파일명 : Or16SubProgram.sql
서브프로그램
설명 : 저장프로시져, 함수 그리고 프로시져의 일종인 트리거를 학습
***************/

/*
서브프로그램(Sub Program)
-PL/SQL에서는 프로시져와 함수라는 두가지 유형의 서브프로그램이있다.
-Select를 포함해서 다른 DML문을 이용하여 프로그래밍적인 요소를 통해
사용가능하다. 
-트리거는 프로시져의 일종으로 특정 테이블에 레코드의 변화가 있을경우
자동으로 실행된다. 
*/

/*
1.저장프로시저(Stroed Procedure)
-프로시저는 return문이 없는 대신 out 파라미터를 통해 값을 반환한다. 
-보안성을 높일 수 있고 네트워크의 부하를 줄일 수 있다. 
형식] create [or replace] procedure 프로시저명
      [(매개변수 in 자료형, 매개변수 out 자료형)]
      is [변수선언]
      begin
        실행문장;
      end;
※ 파라미터 설정시 자료형만 명시하고, 크기는 명시하지 않는다.       
*/

/*
시나리오] 100번 사원의 급여를 select하여 출력하는 저장프로시저를 생성하시오.
*/
create or replace procedure pcd_emp_salary
is
    --변수선언 : 사원테이블의 급여 컬럼을 참조하는 참조변수
    v_salary employees.salary%type;
begin
    --100번 사원의 급여를 변수에 할당한다. 이때 into절을 사용한다. 
    select salary into v_salary from employees where employee_id=100;
    dbms_output.put_line('사원번호 100의 급여는 '||v_salary||'입니다');
end;
/
--데이터사전에서 확인(저장시 대문자로 변환된다)
select * from user_source where name like upper('%pcd_emp_salary%');

--첫 실행이라면 최초로 한번 실행해야한다. 결과를 화면에 출력한다.  
set serveroutput on;

--프로시저의 실행은 호스트환경에서 execute명령을 이용한다. 
execute pcd_emp_salary;

/*
In파라미터를 사용한 프로시저 생성

시나리오] 사원의 이름을 매개변수로 받아서 사원테이블에서 레코드를 조회한후
해당사원의 급여를 출력하는 프로시저를 생성 후 실행하시오.
해당 문제는 in파라미터를 받은후 처리한다.
사원이름(first_name) : Bruce, Neena
*/
--프로시저 생성시 In파라미터를 설정한다. 사원테이블의 사원명 컬럼을 참조한다. 
create or replace procedure pcd_in_param_salary
    (param_name in employees.first_name%type) 
is
    /*  
    PL/SQL에서는 declare에 변수를 선언하지만, 프로시저에서는 is절에 
    선언한다. 변수는 필요없는경우 선언하지 않을수도 있다. 
    */ 
    valSalary number(10);  
begin    
    /*
    인파라미터로 전달된 사원명을 조건으로 급여를 구한 후 변수에 할당한다. 
    */
    select salary into valSalary
    from employees where first_name = param_name;
        
    dbms_output.put_line(param_name||'의 급여는 '|| valSalary ||' 입니다');
end;
/ 
--사원의 이름을 파라미터로 전달하여 프로시저 호출
execute pcd_in_param_salary('Bruce');
execute pcd_in_param_salary('Neena');



/*
Out 파라미터를 사용하여 프로시저 생성

시나리오] 위 문제와 동일하게 사원명을 매개변수로 전달받아서 급여를 조회하는
프로시저를 생성하시오. 단, 급여는 out파라미터를 사용하여 반환후 출력하시오
*/
create or replace procedure pcd_out_param_salary
(        
    param_name in varchar2, 
    param_salary out employees.salary%type
) /* 두가지 형식의 파라미터를 정의한다. 일반변수, 참조변수를 각각 사용했다. */
is 
    /*
    select한 결과를 out 파라미터에 저장할 것이므로 별도의 변수가 
    필요없어 is절은 비워둔다. 이와같이 생략 가능하다. 
    */
begin  
    /*
    In파라미터는 where절의 조건으로 사용하고 
    select한 결과는 into절에서 Out파라미터에 저장한다. 
    */
    select salary into param_salary
    from employees where first_name = param_name;
end;
/ 
--호스트환경에서 바인드변수를 선언한다. 
var v_salary varchar2(30); --var 혹은 variable 둘다 사용할 수 있다. 
--프로시저 호출시 각각의 파라미터를 전달한다. 특히 바인드 변수는 :을 붙여야한다.
--Out파라미터인 param_salary에 저장된 값이 바인드변수 v_salary로 전달된다. 
execute pcd_out_param_salary('Matthew', :v_salary); 
--프로시저 실행 후 out파라미터를 통해 전달된 값을 출력한다. 
print v_salary;


-------------------------------------------------------------------------
--실습을 위해 employees테이블을 레코드까지 전체 복사한다. 
create table zcopy_employees
as 
select * from employees;
--복사되었는지 확인하기
select * from zcopy_employees;
-------------------------------------------------------------------------


/*
시나리오] 사원번호와 급여를 매개변수로 전달받아 해당사원의 급여를 
    수정하고 실제 수정된 행의 갯수를 반환받아서 출력하는 프로시저를 
    작성하시오
*/

--in파라미터는 사원번호와, 급여를 전달함. out파라미터는 적용된 행의갯수 반환함. 
create or replace procedure pcd_update_salary 
    (
        p_empid in number,
        p_salary in number,
        rCount out number
    )
is 
    --추가적인 변수 선언이 필요없으므로 생략
begin  
    --실제 업데이트를 처리하는 쿼리문으로 In파라미터를 통해 값을 설정한다. 
    update zcopy_employees
		set salary = p_salary
		where employee_id = p_empid;
    
    /*
    sql%notfound : 쿼리실행 후 적용된 행이 없을경우 true를 반환한다. 
        found는 반대의 경우를 반환한다. 
    sql%rowcount : 쿼리실행 후 실제 적용된 행의 갯수를 반환한다. 
    */
    if SQL%notfound then
        dbms_output.put_line(p_empid ||'은(는) 없는사원임다');
    else
        dbms_output.put_line(SQL%rowcount ||'명의 자료가 수정되씸');        
        
        --실제 적용된 행의 갯수를 반환하여 out파라미터에 저장한다.  
        rCount := sql%rowcount;
    end if;
    /*
    행의 변화가 있는 쿼리를 실행할경우 반드시 commit해야 실제 테이블에 적용되어
    oracle외부에서 확인할 수 있다. 
    */    
    commit;
end;
/
--프로시저 실행을 위해 바인드변수 생성
variable r_count number;

--100번 사원의 이름과 급여 확인 : Steven, 24000
select first_name, salary from zcopy_employees where employee_id=100;

--프로시저 실행(바인드변수에는 반드시 :을 붙여야된다.)
execute pcd_update_salary(100, 30000, :r_count);

--update가 적용된 행의 갯수 확인
print r_count;

--업데이트된 내용을 확인 : Steven, 30000
select first_name, salary from zcopy_employees where employee_id=100;


/*
2.함수 
-사용자가 PL/SQL문을 사용하여 오라클에서 제공하는 내장함수와 같은 기능을
정의한것이다. 
-함수는 In파라미터만 사용할 수 있고, 반드시 반환될 값의 자료형을 명시해야한다. 
-프로시저는 여러개의 결과값을 얻어올 수 있지만, 함수는 반드시 하나의 값을
반환해야한다. 
-함수는 쿼리문의 일부분으로 사용된다. 
※ 파라미터와 반환타입을 명시할때 크기는 기술하지 않는다. 
*/

/*
시나리오] 2개의 정수를 전달받아서 두 정수사이의 모든수를 더해서 결과를
    반환하는 함수를 정의하시오.
    실행예) 2, 7 -> 2+3+4+5+6+7 = ??
*/ 
create or replace function calSumBetween (
    /* 함수는 in파라미터만 있으므로 주로 생략한다. */
    num1 in number,
    num2 number  
)
return  
    --함수는 반드시 반환값이 있으므로 반환타입을 명시해야한다.(필수) 
    number 
is  
    --반환값으로 사용할 변수 선언(선택: 필요없다면 생략할 수 있다)
    sumNum number;
begin
    sumNum := 0;
    
    --for루프문으로 숫자사이의 합을 계산한 후 반환한다. 
    for i in num1 .. num2 loop
        sumNum := sumNum + i;
    end loop;
     
    return sumNum; 
end;
/
--실행방법1 : 쿼리문의 일부로 사용한다. 
select calSumBetween(1,10) from dual;

--실행방법2 : 바인드변수를 통한 실행명령으로 주로 디버깅용으로 사용한다. 
var hapText varchar2(30);
execute :hapText := calSumBetween(1,100);
print hapText;

--데이터사전
select * from user_source where name=upper('calSumBetween');


/*
퀴즈] 주민번호를 전달받아서 성별을 판단하는 함수를 정의하시오.
999999-1000000 -> '남자' 반환
999999-2000000 -> '여자' 반환
단, 2000년 이후 출생자는 3이 남자, 4가 여자임.
함수명 : findGender()
*/
--주민번호의 성별 부분이 잘라지는지 확인
select substr('999999-1000000',8,1) from dual;-- 1 출력
select substr('999999-2000000',8,1) from dual;-- 2 출력

--해당 함수는 주민번호를 문자형태로 받아서 성별을 판단한다. 
create or replace function findGender(juminNum in varchar2)
return varchar2 /* 성별을 판단한 후 '남자' 혹은 '여자'를 반환하므로 문자형으로 선언 */
is
    --주민번호에서 성별에 해당하는 문자를 저장
    genderTxt varchar2(1);
    --성별을 저장한 후 반환할 변수
    returnVal varchar2(10);
begin
    --방법1 : substr()을 즉시 사용한다. 
    --in파라미터로 전달되는 주민번호를 통해 성별을 확인한다. 
    --genderTxt := substr(juminNum,8,1);
    
    --방법2 : 쿼리의 일부로 실행한 후 into를 통해 저장한다. 
    select substr(juminNum,8,1) into genderTxt from dual;
    
    if genderTxt='1' then
        returnVal := '남자';
    elsif genderTxt='2' then
        returnVal := '여자';
    elsif genderTxt='3' then
        returnVal := '남자';
    elsif genderTxt='4' then
        returnVal := '여자';
    end if;
    return returnVal;
end;
/
select findGender('999999-1000000') from dual; --남자 출력 
select findGender('999999-4000000') from dual; --여자 출력





/*
시나리오] 사원의이름(first_name)을 매개변수로 전달받아서 
부서명(department_name)을 반환하는 함수를 작성하시오.
    함수명 : func_deptName
*/
--1단계 : Nancy의 부서명을 출력하기 위한 inner join문 작성 
select
    first_name, last_name, department_id, department_name
from employees inner join departments using(department_id)
where first_name='Nancy';

--2단계 : 함수 작성
create or replace function func_deptName (
    param_name varchar2 --사원이름을 받기 위한 파라미터 설정
)
return
    varchar2 --부서명을 반환하므로 문자형으로 설정
is
    --부서테이블의 부서명을 참조하는 반환 목적의 변수 설정
    return_deptname departments.department_name%type;
begin
    --쿼리문 실행 후 결과를 변수에 저장한다. 
    select
        department_name into return_deptname
    from employees inner join departments using(department_id)
    where first_name=param_name;
    --결과 반환
    return return_deptname;
end;
/
select func_deptname('Nancy') from dual;--Finance 반환
select func_deptname('Diana') from dual;--IT 반환



/*
3.트리거(Trigger)
    : 자동으로 실행되는 프로시저로 직접 실행은 불가능하다. 
    주로 테이블에 입력된 레코드의 변화가 있을때 실행된다. 
*/
--트리거 실습을 위해 HR계정에서 아래 테이블을 복사한다. 
create table trigger_dept_original
as
select * from departments;--테이블의 레코드까지 모두 복사
create table trigger_dept_backup
as
select * from departments where 1=0;--테이블의 스키마(구조)만 복사

/*
시나리오] 테이블에 새로운 데이터가 입력되면 해당 데이터를 백업테이블에 저장하는
트리거를 작성해보자.
*/ 
create or replace trigger trig_dept_backup
	after /*타이밍 : after=>이벤트 발생후, before=>이벤트발생전*/ 
	insert /*이벤트 : 입력/수정/삭제와 같은 쿼리 실행시 발생됨*/
	on trigger_dept_original /*트리거를 적용할 테이블*/
	for each row  /*
        행 단위 트리거로 정의한다. 즉 하나의 행이 변화할때마다 트리거가 수행된다. 
        만약 문장(테이블)단위 트리거로 정의하고 싶다면 해당 문장을 제거하면된다. 
        이때는 쿼리를 한번 실행할때 트리거도 한번만 실행된다. 
    */
begin
    /* insert이벤트가 발생되면 true를 반환하여 if문이 실행된다. */
	if Inserting then
		dbms_output.put_line('insert 트리거 발생됨');
        /*
        새로운 레코드가 입력되었으므로 임시테이블 :new에 저장되고,
        해당 레코드를 통해 backup테이블에 입력할 수 있다. 
        이와 같은 임시테이블은 행단위 트리거에서만 사용할 수 있다. 
        */
		insert into trigger_dept_backup
		values (
			:new.department_id,
			:new.department_name,
			:new.manager_id,
			:new.location_id
		);         
	end if;
end;
/

select * from trigger_dept_original;
select * from trigger_dept_backup;

insert into trigger_dept_original values (300, '코스모112기', 10, 100);
insert into trigger_dept_original values (310, '열정의방', 20, 120);

select * from trigger_dept_original order by department_id desc;
select * from trigger_dept_backup;


drop trigger trig_dept_backup;
insert into trigger_dept_original values (320, '열정의방', 20, 120);
select * from trigger_dept_backup;
create trigger trig_dept_backup
    after/* 타이밍: after=> 이벤트 발생후, before=>이벤트발생전 */
    INSERT /* 이벤트: 입력/수정/삭제와 같은 쿼리 실행시 발생됨 */
    on trigger_dept_original /* 트리거를 적용할 테이블 */
    for each row /*
        행 단위 트리거로 정의한다. 즉 하나의 행이 변화할때마다 트리거가 수행된다.
        만약 문장(테이블)단위 트리거로 정의하고 싶다면 해당 문장을 제거하면 된다. 
        이때 쿼리를 한번 실행할때 트리거도 한번만 실행된다. 
    */
begin
    /* insert이벤트가 발생하면 true를 반환하여 if문이 실행된다. */
    if Inserting then
        dbms_output.put_line ('insert 트리거 발생됨');
        /*
        새로운 레코드가 입력되었으므로 임시테이블 :new에 저장되고,
        해당 레코드를 통해 backup 테이블에 입력할 수 있다. 
        이와같은 임시테이블은 행단위 트리거에서만 사용할 수 있다. 
        */
        insert into trigger_dept_backup
        values (
            :new.department_id,
            :new.department_name,
            :new.manager_id,
            :new.location_id
        );
    end if;
end;
/

/*
시나리오] 원본테이블에서 레코드가 삭제되면 백업테이블의 레코드도 같이
삭제되는 트리거를 작성해보자.
*/
create or replace trigger trig_dept_delete
    /* trigger_dept_original 테이블에 레코드를 삭제한 후 행단위로 
    해당 트리거를 실행한다. */
    after 
    delete 
    on trigger_dept_original
    for each row  
begin
    dbms_output.put_line('delete 트리거 발생됨');
    /*
    레코드가 삭제된 이후에 이벤트가 발생되어 트리거가 호출되므로 :old 
    임시테이블을 사용한다. 
    */  
    if deleting then
        delete from trigger_dept_backup
            where department_id = :old.department_id;
    end if;
end;
/
--300번 레코드를 삭제하면...
delete from trigger_dept_original where department_id=300;
--백업 테이블의 300번도 같이 삭제된다. 
select * from trigger_dept_original order by department_id desc;
select * from trigger_dept_backup;



/*
For each row 옵션에 따른 트리거 실행횟수 테스트

생성1 : 오리지날 테이블에 업데이트 이후 행단위로 발생되는 트리거 생성
*/
create trigger trigger_update_test
    after update
    on trigger_dept_original
    for each row 
    /* 오리지날 테이블의 레코드를 업데이트 한 이후 행단위로 실행되는 트리거로
    업데이트 된 행의 갯수만큼 트리거가 발생되어 백업테이블에 insert된다. */
begin   
    if updating then
        dbms_output.put_line ('update 트리거 발생됨');
        insert into trigger_dept_backup
        values (
            :old.department_id,
            :old.department_name,
            :old.manager_id,
            :old.location_id
        );
    end if;
end;
/
--기존 레코드 확인하기
select * from trigger_dept_original order by department_id desc;
select * from trigger_dept_backup;

--업데이트실행
update trigger_dept_original set department_name='5개업데이트'
where department_id>=10 and department_id<=50;

--앞에서 5개의 레코드를 업데이트 하므로 백업테이블에도 5개가 입력된다. 
select * from trigger_dept_original order by department_id asc;
select * from trigger_dept_backup;


--문장단위 트리거 삭제하기
drop trigger trigger_update_test;


/*
생성2 : 오리지날 테이블에 업데이트 이후 테이블(문장) 단위로 발생되는 
    트리거 생성
*/
create trigger trigger_update_test2
    after update
    on trigger_dept_original
    /** for each row **/
    /* 오리지날 테이블의 레코드를 업데이트 한 이후 테이블단위로 트리거가 실행되므로
    영향을 받은 행의 갯수에 상관없이 한번만 트리거가 실행된다. */
begin   
    if updating then
        dbms_output.put_line ('update 트리거 발생됨');
        insert into trigger_dept_backup
        values (
            /** 테이블단위 트리거에서는 임시테이블을 사용할 수 없다.
            :old.department_id,
            :old.department_name,
            :old.manager_id,
            :old.location_id 
            **/
            999, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), 99, 99
        );
    end if;
end;
/

--업데이트실행
update trigger_dept_original set department_name='5개업데이트2'
where department_id>=60 and department_id<=100;

--앞에서 5개의 레코드를 업데이트 했지만, 테이블단위 트리거는 1개만 입력된다. 
select * from trigger_dept_original order by department_id asc;
select * from trigger_dept_backup;

--테이블단위 트리거 삭제하기
drop trigger trigger_update_test2;

;

--1단계
select
    first_name, last_name, department_id, department_name
from employees inner join departments using(department_id)
where first_name='Nancy';

--2단계
create or replace function func_deptName (
    param_name varchar2
)
return
    varchar2
is
    return_deptname departments.department_name%type;
begin
    select
        department_name into return_deptname
    from employees inner join departments using(department_id)
    where first_name=param_name;
    
    return return_deptname;
end;
/

select func_deptname('Nancy') from dual;
select func_deptname('Diana') from dual;
























