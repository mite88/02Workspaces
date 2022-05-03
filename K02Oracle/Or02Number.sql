/*
숫자(수학)관련함수
숫자데이터를 처리하기위한 숫자관련함수들....
테이블생성시 number타입으로 선언된 컬럼에 저장된 데이터 대상
*/
/*
DUAL테이블
한 행으로 결과 출력하기 위해 제공된느 테이블로 오라클에서 자동생성된느 임시 테이블
varchar2(1)로 정의된 dummy 단 하나의 컬럼으로 구성
*/
select * from dual;
select 1+2 from dual;

--abs : 절대값
select abs(12000) from dual;
select abs(-9000) from dual;
select abs(salary) "급여의절대값" from employees;

--trunc() : 소수점+자리수
/*
select trunc(컬럼 혹은 값, 소수이하자리수) from dual ;
두번째인자가
양수일때 : 주어진 숫자만큼 소수점을 표현
없을때 : 정수부만 표현. 즉 소수점 아래부분은 버려짐
음수일때 : 정수부를 숫자만큼 자르고 나머지를 0으로 채움
*/
select trunc(12345.123456, 2) from dual;
select trunc(12345.123456) from dual;
select trunc(12345.123456, -2) from dual; --백단위 절삭

/*
[시나리오]
사원테이블에서 영업사원이 1000불에 대한 커미션을계산하여
급여에 합한 결괄로 출력하는 쿼리문 작성
급여 : 1000, 보너스율:0.1 => 1000+(1000*0.1) =1100
*/
select first_name, last_name, salary, commission_pct,
trunc(salary+(1000*commission_pct)) as "TotalSalary" from employees
where  job_id like 'SA_%';
--commission_pct is not null;

-- 커미션을소수점 1자리까지만 ...
select first_name, last_name, salary, TRUNC(commission_pct, 1),
trunc(salary+(1000*TRUNC(commission_pct, 1))) as "TotalSalary" from employees
where  job_id like 'SA_%';


/*
[연습문제]
사원테이블에서 보너스율이 있는 사원만 출력한 후 보너스율을 소수점1자리로 표현
컬럼 : 이름, 급여 , 보너스율
*/
select first_name "이름", salary "급여", trunc(commission_pct, 1) "보너스율"
 from employees
 where commission_pct is not null;

/*
ceil() : 소수점이하 올림 
floor() - 소수점 이하 버림
round(값, 자리수) - 소수점 이하반올림
두번째인자가
- 있을때 : 숫자만큼 소수점이 표현되므로 그 다음수가 5이상이면 올림, 5미만이면 버림.
- 없을때 : 소수점 첫번째자리가 5이상이면 올림, 5미만이면 버림.
*/

select ceil(32.8) from dual; --33
select ceil(32.2) from dual; --33

select floor(32.8) from dual; --32
select floor(32.2) from dual; --32

select round(0.123),round(0.543)  from dual; --0,1
select round(0.1234567, 6),round(2.345612, 4)  from dual;--0.123457, 2.3456

--power() : 거듭제곱
select mod(99,4) from dual;
--mod() : 나머지
select power(2,10) from dual;
--sqrt() - 제곱근(루트)
select sqrt(49) from dual;