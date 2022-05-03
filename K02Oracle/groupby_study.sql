/*
1. 전체 사원의 급여최고액, 최저액, 평균급여를 출력하시오. 
컬럼의 별칭은 아래와 같이 하고, 평균에 대해서는 정수형태로 반올림 하시오.
별칭) 급여최고액 -> MaxPay
급여최저액 -> MinPay
급여평균 -> AvgPay
*/

select 
     min(salary) "MinPay",
    max(salary) "MaxPay",  
    round(avg(salary)) "AvgPay" 
from employees;

/*
2. 각 담당업무 유형별로 급여최고액, 최저액, 총액 및 평균액을 출력하시오. 
컬럼의 별칭은 아래와 같이하고 모든 숫자는 to_char를 이용하여 
세자리마다 컴마를 찍고 정수형태로 출력하시오.

별칭) 급여최고액 -> MaxPay
급여최저액 -> MinPay
급여평균 -> AvgPay
급여총액 -> SumPay
참고) employees 테이블의 job_id컬럼을 기준으로 한다.
*/

select 
    job_id,
    to_char(min(salary), '999,000') "MinPay",
    to_char(max(salary), '999,000')"MaxPay",  
    to_char(sum(salary), '999,000')"SumPay", 
    to_char(round(avg(salary)), '999,000') "AvgPay" 
from employees group by job_id order by sum(salary);

/*
3. count() 함수를 이용하여 담당업무가 동일한 사원수를 출력하시오.
참고) employees 테이블의 job_id컬럼을 기준으로 한다.
*/
select 
    job_id,
    count(*) "직원합계" 
from employees group by job_id order by  count(*);

/*
4. 급여가 10000달러 이상인 직원들의 담당업무별 합계인원수를 출력하시오.
*/
select 
    job_id,
    count(*) "합계인원수" 
from employees where salary >=10000 group by job_id;


/*
5. 급여최고액과 최저액의 차액을 출력하시오. 
*/
select 
    max(salary)-min(salary) "최고최소급여차"
from employees;

/*
6. 각 부서에 대해 부서번호, 사원수, 부서 내의 모든 사원의 평균급여를 출력하시오. 
평균급여는 소수점 둘째자리로 반올림하시오.
*/

select 
    department_id,
    count(*),
    to_char(round(avg(salary),2),'999,000.00')
from employees group by department_id order by department_id;