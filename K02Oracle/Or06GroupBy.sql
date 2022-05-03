/*
group by 절

distinct 와 group by 절
distinct : 단순히 중복되는 레코드를 제거
group by 절 : 그룹으로 묶어 통계적인 결과를 도출할 수 있다.
*/

select DISTINCT job_id, salary from employees;

select  job_id from employees GROUP BY job_id;
-- 통계적인 결과를 도출 : 여기선 avg, count로 했음
select  job_id,avg(salary), count(*) from employees GROUP BY job_id;


/*
select
	컬럼1, 컬럼2,.......컬럼N 혹은 *(전체)
from
	테이블명
[where 
	조건1 and 조건2 or 조건N....]
[group by
	데이터 그룹화를 위한 컬럼명]
[having
	그룹에서 찾을 조건]
[order by
	데이터 정렬을 위한 컬럼과 정렬방식]
    
※쿼리의 실행순서
from -> where -> group by -> having -> select -> order by    
*/

--1. sum():합계를 구할때 사용하는 함수(숫자형만가능)
select 
    sum(salary) "sumSal1", to_char(sum(salary), '990,000') "sumSalary"
from employees;

--10번부서에 근무하는 사원들의 급여 합계
--좌측공백제거 ltrim(),  통화 'L990,000'
select 
    ltrim(to_char(sum(salary), 'L990,000')) "sumSalary"
from employees where department_id=10;

--2. count():선택된 레코드의 갯수를 카운트할때 사용하는 함수
--count(*)모든 레코드 수, 권장사항
select count(*) from employees;
--,권장사항이아님
select count(employee_id) from employees;
-- * 컬럼의 특성 및 데이터의 방해를 받지 않기 위해 count(*)을 사용하여 검색속도를높임

/*
count(all 컬럼명) : 전체 레코드 수
count(distinct 컬럼명) : 중복을 제거한 레코드 수
*/
select 
    count(job_id) "담당업무전체갯수1", 
    count(all job_id) "담당업무전체갯수2", 
    count(distinct job_id)"순수담당업무갯수"
from employees;

--3. avg():평균값을 구할때 사용하는 함수
select 
    count(*)"전체 사원수", 
    sum(salary)"급여합계", 
    to_char(sum(salary) / count(*), '$999,000') "평균급여1(직접)" ,
    trim(to_char(avg(salary),'$999,000')) "평균급여2" 
from employees;

--영업팀구하기 (나중에 join을배울거니 지금은 이렇게하겠다는 이야기 ㅇㅊㅇ)
/*
정보검색시 대소문자 공백등이 포함된 경우 모든레코드를확인한다는것은 불가하여 
일괄적인 규칙을 적용하기위해 변환해서 사용하는것이 좋음
*/
select * from departments where lower(department_name)='sales';
select * from departments where department_name=initcap('sales');
--최종단계
select * from departments where lower(department_name)=lower('SALES');

select 
    count(*)"전체 사원수", 
    sum(salary)"급여합계", 
    trim(to_char(avg(salary),'$999,000')) "평균급여2" 
from employees where department_id=80;

--4. max(), min():최대값 최소값을 찾을때 사용하는 함수
select min(salary) from employees;

--사원테이블에서 가장 낮은 급여를 받는사람?(o0o 안된다.....)
select 
    first_name||' '||last_name "name" 
from employees where salary=min(salary);

--서브쿼리를 해야한다(나아아아중에 배움)
select 
    first_name||' '||last_name "Name" ,salary
from employees where salary=(
    select min(salary) from employees
);

--5. group by 절:하나의 그룹으로 그룹화하여 묶여진 결과를 반환하는 쿼리문
--각부서별 급여합계
select 
    nvl(department_id, 0), to_char(sum(salary), '$999,000') 
from employees 
GROUP BY department_id order by sum(salary) desc;

/*
사원테이블에서 각 부서별 사원수와 평균급여
출력결과 : 부서번호(오름차순), 급여총합, 사원총합, 평균급여
*/
select 
    department_id "부서번호", 
    to_char(sum(salary), '$999,000') "급여총합",
    count(*) "사원총합" ,
    to_char(round(avg(salary)), '$999,000') "평균급여"
from employees 
GROUP BY department_id order by department_id;

--------------------------------------------------
/*
GROUP BY절은 명시된 컬럼을 그룹화 시켜주지만 
나머지는 그룹화를 시켜주지 않기 때문에 집계함수를 사용하거나 
그룹핑 대상으로 컬럼을 SELECT절과 GROUP BY절에 명시해 주어야 한다.
*/
select 
    department_id "부서번호", 
    to_char(sum(salary), '$999,000') "급여총합",
    first_name "이름"
from employees 
GROUP BY department_id, first_name order by department_id;

/*
부서아이디가 50인사원들의 직원총합, 평균급여, 급여총합
*/
select 
    department_id "부서번호", 
     count(*) "사원총합" ,
    to_char(round(avg(salary)), '$999,000') "평균급여", 
    to_char(sum(salary), '$999,000') "급여총합"
from employees where department_id=50 
GROUP BY department_id;

--6. having절:그룹과 관련된 조건을 걸고싶을때 사용,그룹의 조건을 where절에 사용시 에러가 발생
select * from employees;

--where(테이블 전체가 검색대상), having(그룹화된 데이터가 검색대상)
/*
사원테이블에서 각 부서별로 근무하고 있는 직원의 담담업무별 사원수와 평균급여
단 사원수가 10초과에만 ....
*/
select 
    department_id "부서번호", 
    job_id "직원번호", 
    count(*) "사원총합" ,
    to_char(round(avg(salary)), '$999,000') "평균급여"
from employees
group by department_id, job_id 
/*
 --물리적인 컬럼이 아니라서 where절에 쓰면 에러남
 ex)급여가 3000인 사원:물리적o
    평균 급여가 3000인 사원:물리적x(논리데이터)
*/
HAVING count(*) > 10
order by department_id;

-------------------------------------------------

/*
담당업무별 사원의 최저급여 출력
관리자가 없는 사원과 최저급여가 3000미만인 그룹제외
결과급여 내림차순 
*/

select 
    job_id "직원번호",
    min(salary)"최저급여"
from employees 
where MANAGER_ID is not null
group by job_id
having not (min(salary) < 3000) 
/*
문제엔 내림차순하라했지만 현재 select 된 
급여가 최소값이라 order by절엔 
min(salary)을 사용해야함
*/
order by min(salary) desc;

