/*
1. inner join 방식중 오라클방식을 사용하여 first_name 이 Janette 인
사원의 부서ID와 부서명을 출력하시오.
출력목록] 부서ID, 부서명
*/

select department_id, department_name
from employees inner join departments
using(department_id) 
 where first_name='Janette';
 
/*
2. inner join 방식중 SQL표준 방식을 사용하여 사원이름과 함께 
그 사원이 소속된 부서명과 도시명을 출력하시오
출력목록] 사원이름, 부서명, 도시명
*/

select first_name, last_name, department_name, city
from employees
inner join departments
using(department_id)
inner join locations
using(location_id) ;

/*
3. 사원의 이름(FIRST_NAME)에 'A'가 포함된 모든사원의 이름과 부서명을 출력하시오.
출력목록] 사원이름, 부서명
*/
select first_name, last_name, department_name
from employees
inner join departments
using(department_id) 
where first_name like '%A%';

/*
4. “city : Toronto / state_province : Ontario” 
에서 근무하는 모든 사원의 이름, 업무명, 부서번호 및 부서명을 출력하시오.
출력목록] 사원이름, 업무명, 부서ID, 부서명
*/
select first_name, job_title, department_id, department_name
from employees
inner join departments
using(department_id)
inner join jobs
using(job_id)
inner join locations
using(location_id)
where city='Toronto' and state_province='Ontario';

/*
5. Equi Join을 사용하여 커미션(COMMISSION_PCT)을 받는 
모든 사원의 이름, 부서명, 도시명을 출력하시오. 
출력목록] 사원이름, 부서ID, 부서명, 도시명
*/
select first_name, last_name, d.department_id, department_name
from employees e, departments d,  locations l
where e.department_id = d.department_id  
and d.location_id = l.location_id
and COMMISSION_PCT is not null; --> 0;

/*
6. inner join과 using 연산자를 사용하여 50번 부서(DEPARTMENT_ID)에 
속하는 모든 담당업무(JOB_ID)의 고유목록(distinct)을 부서의 도시명(CITY)을 
포함하여 출력하시오.
출력목록] 담당업무ID, 부서ID, 부서명, 도시명
*/

select DISTINCT job_id, department_id, department_name, city
from jobs
inner join employees
using(job_id)
inner join departments
using(department_id)
inner join locations
using(location_id)
where department_id='50';

/*
7. 담당업무ID가 FI_ACCOUNT인 사원들의 메니져는 누구인지 출력하시오. 
단, 레코드가 중복된다면 중복을 제거하시오. 
출력목록] 이름, 성, 담당업무ID, 급여
*/


select DISTINCT e2.first_name, e2.last_name, e2.job_id, e2.salary
from employees e1, employees e2 
where e1.manager_id = e2.employee_id 
and e1.job_id='FI_ACCOUNT';


/*
8. 각 부서의 메니져가 누구인지 출력하시오. 
출력결과는 부서번호를 오름차순 정렬하시오.

출력목록] 부서번호, 부서명, 이름, 성, 급여, 담당업무ID
※ departments 테이블에 각 부서의 메니져가 있습니다.
*/


SELECT 
    d.department_id, d.department_name ,
    e.last_name, e.first_name , e.salary, e.job_id
FROM departments d
inner JOIN employees e
  ON d.manager_id=e.employee_id order by d.department_id;



/*
9. 담당업무명이 Sales Manager인 사원들의 입사년도와 입사년도(hire_date)별 
평균 급여를 출력하시오. 출력시 년도를 기준으로 오름차순 정렬하시오. 
출력항목 : 입사년도, 평균급여
*/

select to_char(hire_date,'yyyy'), avg(salary) 
from employees 
left outer join jobs using(job_id) 
where job_title = 'Sales Manager'
group by to_char(hire_date,'yyyy') order by to_char(hire_date,'yyyy'); 