--사용할 쿼리
select
 employee_id, first_name, last_name,
 job_id, hire_date, department_id
from employees where job_id='ST_CLERK';

--뷰생성
create view view_employess
as
select
 employee_id, first_name, last_name,
 job_id, hire_date, department_id
from employees where job_id='ST_CLERK';

--쿼리확인
select * from view_employess;

--데이터사전에서 확인
select * from user_views;

--뷰수정(별칭)
create or replace 
view view_employess(id, fname, lname, jobid, hdate, depid)
as
select
 employee_id, first_name, last_name,
 job_id, hire_date, department_id
from employees where job_id='ST_CLERK';

/*
퀴즈] 위에서 생성한 view_employees 뷰를 아래 조건에 맞게 수정하시오
      직무아이디가 ST_MAN인 사원의 사원번호, 이름, 이메일, 매니져아이디를
      조회할 수 있도록 수정하시오.
      뷰의 컬럼명은 e_id, name, email, m_id로 지정한다. 단, 이름은 first_name과
      last_name이 연결된 형태로 출력하시오
*/

create or replace 
view view_employess(e_id, name, email, m_id)
as
select
 employee_id, first_name|| ' ' ||last_name,
 email, manager_id
from employees where job_id='ST_MAN';

select * from view_employess;


/*
퀴즈] 사원번호, 이름, 연봉을 계산하여 출력하는 뷰를 생성하시오.
컬럼의 이름은 emp_id, l_name, annual_sal로 지정하시오.
연봉계산식 -> (급여+(급여*보너스율))*12
뷰이름 : v_emp_salary
단, 연봉은 세자리마다 컴마가 삽입되어야 한다. 
*/

select
  employee_id, first_name|| ' ' ||last_name, to_char((salary+(salary*commission_pct))*12 ,'999,000')
from employees;


create or replace view v_emp_salary(emp_id, l_name, annual_sal)
as
select
  employee_id, first_name|| ' ' ||last_name, to_char((salary+(salary*nvl(commission_pct,0)))*12 ,'999,000')
from employees;


select * from v_emp_salary;

drop view v_emp_salary;

/*
조인을 통한 view 생성

사원테이블, 부서테이블, 지역테이블을 조인하여 뷰만들기

항목 : 사원번호, 전체이름, 부서번호, 부서명, 입사일자, 지역명
명칭 : v_emp_join
뷰 컬럼: empid, fullname, deptid, deptname, hdate, locname
*/

create or replace view v_emp_join(empid, fullname, deptid, deptname, hdate, locname)
 as 
select
    employee_id, first_name|| ' ' ||last_name,
    department_id, department_name,to_char(hire_date,'yyyy"년"mm"월"dd"일"'), 
    state_province|| '주 의' ||city
from employees 
inner join departments using(department_id) 
inner join locations using(location_id) ;

select * from v_emp_join;