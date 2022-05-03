/*
서브쿼리(Sub Query)
쿼리문안에 또 다른 쿼리문이 들어가는 형태의 select문

--서브쿼리의 결과가.....
단일행 연산자  := , >, >=, <, <=, != 
복수행 연산자 : IN, NOT IN, ALL, ANY 

--단일행 서브쿼리
	select * from 테이블명 where 컬럼=(
            select 컬럼 from 테이블명 where 조건
    );
--복수행 서브쿼리
	select * from 테이블명 where 컬럼 in (
            select 컬럼 from 테이블명 where 조건
    );
*/

--단일행연산자 : 결과가 1개
/*
사원테이블에서 전체사원의평균급여보다 낮은 급여 받는 사원추출
항목:사원번호, 이름, 이메일, 연락처, 급여
*/
select 
    employee_id, first_name, email, phone_number, salary
from employees where salary < (
    select avg(salary) from employees --결과가 1개임
);

/*
전체 사원중 급여가 가장 적은 사원명과 급여출력
항목 :이름1, 이름2, 이메일 급여
*/

select 
    first_name, last_name, email, salary 
from employees where salary=(
    select min(salary) from employees
);


/*
평균급여보다 많은 급여를 받는 사원들의 명단조회
출력:이름1, 이름2, 담당업무명(jobs테이블 join), 급여
*/

--select * from employees inner join jobs using(job_id);

select 
    first_name, last_name, job_title, salary
from employees inner join jobs 
using(job_id) 
--on jobs.job_id = employees.job_id 
where salary > (
    select avg(salary) from employees
);

-- 복수형연산자 in
/*
담당업무별 가장높은 급여를 받는 사원의 명단
목록 : 사원아이디, 이름, 담당업무아이디, 급여
*/
--select job_id, max(salary) from employees group by job_id;

select 
    employee_id, first_name, job_id, salary
    --서브쿼리에 쓰인컬럼을 조건문에 적는다(컬럼1, 컬럼2,....)
from employees where (job_id,salary) in(
    --담당업무별 가장높은 급여
    select job_id, max(salary) from employees group by job_id
);

/*
복수행 연산자 any : 하나이상 일치하면참
복수행 연산자 all : 모든값이 일치하면 참
*/

/*
전체사원중에 부서번호가 20인 사원들의 급여보다 높은급여를받는 직원들 추출
-any
*/
select salary, first_name
from employees 
where salary > any(
    select salary from employees
    where department_id=20
);
--복수행연산자 any사용시 or조건으로 결과가 나옴

/*
전체사원중에 부서번호가 20인 사원들의 급여보다 높은급여를받는 직원들 추출
-all
*/
select salary, first_name
from employees 
where salary > all(
    select salary from employees
    where department_id=20
);
--복수행연산자 all사용시 and조건으로 결과가 나옴


/*
Top쿼리
조회된 결과에서 구간을 정해레코드로 가져올때 사용함

RowNum
- 가상의 컬럼
- select에서의 테이블의 일런번호
예)top3, 페이징등
*/

select first_name, ROWNUM from employees;
select first_name, ROWNUM from employees order by first_name;

-- ㅇㅁㅇ;;; 게시판처럼 first_name기준으로 10개 단위로 나누어보자
select first_name, rownum rNum from
        (select * from employees order by first_name asc);


select * from (
    select Tb.*, rownum rNum from
        (select * from employees order by first_name asc) Tb
)
where rNum between 1 and 10;
