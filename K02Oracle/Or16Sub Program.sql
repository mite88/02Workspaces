/*
프로시저(Stored Procedure)
- 일련의 쿼리를 마치 하나의 함수처럼 실행하기 위한 쿼리의 집합
- 프로시저는 Return문이 없는 대신 out 파라메타를 통해 값을 반환
- 프로시저의 장점
    1. 매우좋은 성능을 가짐
    2. 보안성을 높일수 있음
    3. 다양한 처리가 가능함
    4. 네트워크의 부하를 줄일 수 있음
    
Create [Or Replace] Procedure 프로시저명 [(
	매개변수 In 자료형, 매개변수 Out 자료형
)]
Is [변수선언]
Begin
	실행문장
End;

*/

set SERVEROUTPUT ON;

--예제1] 100번 사원의 급여를 가져와서 출력하는 프로시저 생성
--  틀리는것을 대비하여  or replace로 수정처리
create or replace procedure pcd_emp_salary
is
    v_salary employees.salary%type; --변수선업
begin
    select salary into v_salary 
    from employees 
    where employee_id=100;
    
    DBMS_OUTPUT.PUT_LINE('사원번호100의 급여는:'|| v_salary ||'입니다');
end;
/
--데이터사정
select * from user_source where name like upper('%pcd_emp_salary%');

--실행
EXECUTE pcd_emp_salary;


--예제2] IN파라미터 사용하여 프로시저 생성
create PROCEDURE pcd_in_param_salary
    --파라미터
    (param_name in employees.first_name%type)
is
    valSalary number(10);
begin
    select salary into valSalary 
    from employees where first_name = param_name;
    
    DBMS_OUTPUT.PUT_LINE(param_name||'의 급여는 '||valSalary||' 입니다.');
end;
/

EXECUTE pcd_in_param_salary('Bruce');
EXECUTE pcd_in_param_salary('Neena');

--예제3] OUT파라미터 사용하여 프로시저 생성

create PROCEDURE pcd_out_param_salary
    --파라미터
    (
        param_name in varchar2,
        param_salary out employees.salary%type
    )
is
begin
    select salary into param_salary 
    from employees where first_name = param_name;
    
end;
/

var v_salary varchar2(30);

EXECUTE pcd_out_param_salary('Matthew', :v_salary);

print v_salary;

/*
시나리오] 
사원번호와 급여를 매개변수로 전달받아 해당사원의 급여를 수정하고, 
실제 수정된 행의 갯수를 반환받아서 출력하는 프로시저를 작성하시오
*/
--복사후 시작
create table zcopy_employees as
select * from employees;

create or replace procedure pcd_update_salary
    (
        p_empid in number,
        p_salary in number,
        rCount out number
    )
is
begin
    update zcopy_employees 
    set salary = p_salary 
    where employee_id = p_empid;
    
    if SQL%notfound then
         DBMS_OUTPUT.PUT_LINE(p_empid||'은(는) 없는사원입니다.');
    else
         DBMS_OUTPUT.PUT_LINE(sql%rowcount||'명의 자료 수정');
         
         rCount := sql%rowcount;
    end if;
    
    commit;
end;
/

var r_count number;

select first_name, salary from zcopy_employees
where employee_id=100;


/*
함수(Function)

- 사용자가 PL/SQL문을 사용하여 오라클에서 제공하는 
  내장함 수와 같은 기능을 정의
- 함수는 In파라메타만 사용할 수 있고 반드시 반환될 
  값의 데이터 형을 Return문에 명시
- 프로시저는 여러개의 결과값을 얻어올수 있지만, 
  함수는 반드시 하나의 값을 반환
  
Create [Or Replace] Function 함수명 [(
	매개변수1 [In] 자료형,
	매개변수2 In 자료형
)]
Return 자료형
Is
	[변수선언]
Begin
	함수 실행 문장.....;
End;
*/

/*
2개의 정수를 전달받아서 두 정수사이의 모든수를 더해서 
결과를 반환하는 함수를 정의하시오.
실행예) 2, 7 -> 2+3+4+5+6+7 = ??

*/
create or replace function calSumBetween
    (num1 in number, num2 number) 
    
return 
    number 
is
    sumNum number; 
begin
    sumNum := 0;

    for i in num1 .. num2 loop
        sumNum := sumNum + i; 
    end loop;
    
    return sumNum;
end;
/
--쿼리문일부사용
select calSumBetween(1,10) from dual;

--바인드변수로 디버깅용
var hapText varchar2(30);
EXECUTE :hapText := calSumBetween(1,100);
print hapText;


/*
퀴즈] 주민번호를 전달받아서 성별을 판단하는 함수를 정의하시오.
999999-1000000 -> '남자' 반환
999999-2000000 -> '여자' 반환
단, 2000년 이후 출생자는 3이 남자, 4가 여자임.
*/

create or replace function findGender
(
    str in varchar2
)
return
    VARCHAR2
is
    str_result varchar2(2);
begin
    --select substr(str, 8, 1) into genderTxt from dual;  

    if substr(str, 8, 1)= '1' then
        str_result := '남자';
    elsif substr(str, 8, 1) = '2' then
        str_result := '여자';
     
    elsif substr(str, 8, 1)= '3' then
        str_result := '남자';
    elsif substr(str, 8, 1) = '4' then
        str_result := '여자';   
    end if;
    
    return str_result;
end;
/

select findGender('999999-3000000') from dual; 

/*
시나리오] 
사원의이름(first_name)을 매개변수로 전달받아서 
부서명(department_name)을 반환하는 함수를 작성하시오.
함수명 : func_deptName
*/
select 
first_name, last_name, department_id, department_name
from employees 
inner join departments
using(department_id) 
where employees.first_name='Nancy';


create or replace function func_deptname
(param_name varchar2)
return
    varchar2
is
    return_depatname departments.department_name%type;
begin
    select 
    department_name into return_depatname
    from employees 
    inner join departments
    using(department_id) 
    where employees.first_name=param_name;
    
    return return_depatname;
end;
/

select func_deptname('Nancy') from dual;

/*
트리거(Trigger)

- 자동으로 실행되는 프로시저의 한 종류로서 직접 실행은 불가능하다.
- 하나의 테이블에 최대 3개의 트리거를 적용할 수 있다.
- 트리거가 많을수록 성능저하를 초래할 가능성이 높아지므로 
  사용에 주의해야 한다.
- 트리거 몸체안에서는 commit; rollback; 이 불가능하다.
- :new(변경후), :old(변경전) 과 같은 임시테이블은 행단위 
  트리거에서만 사용이 가능하다
  
Create Trigger 트리거명
	타이밍[Before|After] 이벤트[Insert|Update|Delete]
	On 트리거를 적용할 테이블명
	[For Each Row]
	[When 트리거조건]
Declare
	변수선언
Begin
	트리거몸체
End;
  
*/

--실습을 위해 아래의 테이블을 복사해보자
create table trigger_dept_original 
as
select * from departments; 

create table trigger_dept_backup 
as
select * from departments where 1=0;

/*
예제1] trig_dept_backup
시나리오] 테이블에 새로운 데이터가 입력되면 
해당 데이터를 백업테이블에 저장하는
트리거를 작성해보자
*/

DROP TRIGGER trig_dept_backup; 

create or replace TRIGGER trig_dept_backup
    AFTER  
    INSERT
    ON trigger_dept_original 
    FOR EACH ROW 
BEGIN
     IF INSERTING THEN  
        dbms_output.put_line('insert 트리거 발생됨');
        
         INSERT INTO trigger_dept_backup VALUES( 
            :new.department_id,
            :new.department_name,
            :new.manager_id,
            :new.location_id
        );
     END IF;
END;
/

insert into trigger_dept_original
	values (101, '코스모61기', 10, 100);
select * from trigger_dept_original;
select * from trigger_dept_backup;

--예제2] trig_dept_delete

create or replace trigger trig_dept_delete
    after
    delete
    on trigger_dept_original
    for each row
begin
    dbms_output.put_line('delete 트리거 발생됨');
    
    if deleting then
        delete from trigger_dept_backup 
        where department_id = :old.department_id;
    end if;
end;
/

delete from trigger_dept_original where department_id=101;

select * from trigger_dept_original;
select * from trigger_dept_backup;


--예제3] trigger_update_test
create or replace trigger trig_dept_update
    after
    update
    on trigger_dept_original 
    for each row 
begin
    if updating then
       INSERT INTO trigger_dept_backup VALUES( 
            :old.department_id,
            :old.department_name,
            :old.manager_id,
            :old.location_id
        );
     END IF;
END;
/

select * from trigger_dept_original;
select * from trigger_dept_backup;

update trigger_dept_original set department_name='6개 업데이트' 
where department_id >=10 and department_id<=50;

--생성2 : 문장단위로 발생 
create or replace trigger trig_dept_update
    after
    update
    on trigger_dept_original 
    -- 이런식으로 하면 행의 갯수와는 상관없이 한번만 트리거됨
    --for each row 
begin
    if updating then
       INSERT INTO trigger_dept_backup VALUES( 
            /*:old.department_id,
            :old.department_name,
            :old.manager_id,
            :old.location_id
            */
            999, to_char(sysdate, 'yyyy-mm-dd hh24:mi:ss'), 99, 99
        );
     END IF;
END;
/