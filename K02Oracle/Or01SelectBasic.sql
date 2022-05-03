/*
처음 실행해보는 질의몬(SQL문 혹운 Query문)
개발자들 사이에는 '시퀄'이라 표현하기도 함
설명:select, where 등 가장기본적인 DQL문 사용해보기
*/

/*여러줄주석*/
--한줄주석

/*
select 문 : 테이블에 저장된 레코드조회 
select 컬럼명1,컬럼명2,... [또는 *(컬럼전체)]
from 테이블명
where 조건1 and 조건2 or 조건3 ....
order by 정렬할컬럼명 asc(오름차순) [desc(내림차순)]
*/
--사원테이블에 저장된 모든 레코드를 대상으로 모든 컬럼 조회
select * from employees; -- 하나의 쿼리문이 끝나면;하기

--컬럼명 지정하여 조회 ex)사원번호, 이름, 이메일, 부서번호만 출력
select employee_id, first_name, last_name, email, department_id from employees;

--테이블의 구조
desc employees;

--컬럼이 숫자형인 경우 산술연산가능함 ex)100불이상의 직원의 급여 조회
select employee_id, first_name, last_name, salary, salary+100 from employees;
--숫자컬럼끼리도 가능
select employee_id, first_name, last_name, salary, salary+commission_pct 
from employees; --이경우 영업사원만있어서 대부분값이 null임

--AS : 테이블 또는 컬럼의별칭 부여, 영어로 하는것을 권장
select employee_id, first_name, last_name, salary, salary+100 
as "인상급여" from employees;

--AS 는 생략가능
select employee_id "사원아이디", first_name "이름", last_name "성" from employees
 where first_name='William';
 
 --대소문자 구분 : 예약어 x, 데이터(레코드) ㅇ
 seLECt employee_id "사원아이디", first_name "이름", LAST_NAME "성" from employees
 where first_name='william';
 
/*
where 문 : 조건에 맞는 레코드 출력
ex)last_name이 Smith인 레코드 출력
*/
select * from employees where last_name='Smith';

--조건이 두개 이상일때 : and,or 사용
--ex)last_name 이 Smith 이면서 급여가 8000이상인 사원
select * from employees where last_name='Smith' and salary=8000;
--숫자컬럼인경우 싱글쿼테이션을 붙어도 되긴함
select * from employees where last_name='Smith' and salary='8000';

--비교연산자를 이용한 커리문작성
select * from employees where salary< 5000;
select * from employees where hire_date>='04/01/01';

--in연산자 :or연산자와 같음, 컬럼명을 반복적으로 기술해야할때 편리함
select * from employees where salary in(4200,6400,8000);

--not연산자 : 해당조건 제외하고 레코드 추출
select * from employees where department_id <> 50;
select * from employees where not(department_id = 50);

--between and 연산자 : 구간검색
select * from employees where salary>= 4000 and  salary<=8000;
select * from employees where salary BETWEEN 4000 and 8000;

--distinct 연산자 : 중복제외
select DISTINCT job_id from employees; --담당업무의 종류명만볼때 중복생략해서 출력함

/*
like 연산자 : 포함된문자열 검색하기
_ : 한글자
% : 여러글자
*/

 --first_name이 D로 시작하는 직원
select * from employees where first_name like  'D%';
--first_name의세번째문자가 a인직원
select * from employees where first_name like '__a%'; 
--last_name이 y로 끝나는 직원
select * from employees where last_name like '%y';
--전화번호가1344가 포함된 직원
select * from employees where phone_number like '%1344%';

/*
order by 절 : 정렬
asc(오름차순,디폴트)
desc(내림차순)
*/

select * from employees order by salary asc;

select employee_id, first_name, last_name, salary, department_id
 from employees order by department_id desc, salary asc;

--is null 과 is not null : 컬럼중 null이거나 null이 아닌 레코드 가져오기
select * from employees where commission_pct is null;
select * from employees WHERE salary >=8000
 and commission_pct is not null;

 
 --#Or01SelectBasic.sql 파일 아래에 연결해서 아래 문제를 풀어주세요.
--#과제전용 > 02Oracle > 연습문제1(select기본) 폴더하위에 본인이름으로 업로드 합니다.
--해당 문제는 scott계정에 생성된 EMP 테이블을 이용합니다. hr계정의 employees테이블과 유사한 형태의 테이블입니다. 

--1. 덧셈 연산자를 이용하여 모든 사원에 대해서 $300의 급여인상을 계산한후 이름, 급여, 인상된 급여를 출력하시오.
select ename, sal, sal+300 "인상된급여" from emp;

--2. 사원의 이름, 급여, 연봉을 수입(?)이 많은것부터 작은순으로 출력하시오. 연봉은 월급에 12를 곱한후 $100을 더해서 계산하시오.
select ename, sal, sal*12+100 "연봉" from emp ORDER BY sal asc;

--3. 급여가  2000을 넘는 사원의 이름과 급여를 내림차순으로 정렬하여 출력하시오
select ename, sal from emp where sal>2000 ORDER BY sal desc;

--4. 사원번호가  7782인 사원의 이름과 부서번호를 출력하시오.
select ename, deptno from emp where empno like 7782;

--5. 급여가 2000에서 3000사이에 포함되지 않는 사원의 이름과 급여를 출력하시오.
select ename, sal from emp where  not sal>=2000 and sal<=3000 ;

--6. 입사일이 81년2월20일 부터 81년5월1일 사이인 사원의 이름, 담당업무(?), 입사일을 출력하시오.
select ename, job, hiredate from emp where hiredate>='81/02/20' and hiredate<='81/05/01';

--7. 부서번호가 20 및 30에 속한 사원의 이름과 부서번호를 출력하되 이름을 기준(내림차순)으로 출력하시오
select ename, deptno from emp where deptno in(20,30) order by ename desc;

--8. 사원의 급여가 2000에서 3000사이에 포함되고 부서번호가 20 또는 30인 사원의 이름, 급여와 부서번호를 출력하되 이름순(오름차순)으로 출력하시오
select ename, sal, deptno from emp where (sal>=2000 and sal<=3000) or (sal=20 and sal=30);

--9. 1981년도에 입사한 사원의 이름과 입사일을 출력하시오. (like 연산자와 와일드카드 사용)
select ename, hiredate from emp where hiredate like '%81%';

--10. 관리자가 없는 사원의 이름과 담당업무를 출력하시오. 
select ename, job from emp where mgr is null;

--11. 커미션을 받을수 있는 자격이 되는 사원의 이름, 급여, 커미션을 출력하되 급여 및 커미션을 기준으로 내림차순으로 정렬하여 출력하시오.
select ename, sal, comm from emp where comm is not null 
order by sal desc, comm desc;

--12. 이름의 세번째 문자가 R인 사원의 이름을 표시하시오.
select ename from emp where ename like '__R%';

--13. 이름에 A와 E를 모두 포함하고 있는 사원의 이름을 표시하시오.
select ename from emp where ename like '%A%' and ename like '%E%';

--14. 담당업무가 사무원(CLERK) 또는 영업사원(SALESMAN)이면서 급여가 $1600, $950, $1300 이 
--아닌 사원의 이름, 담당업무, 급여를 출력하시오. 
select ename, job, deptno, sal from emp where (job='CLERK' or job='SALESMAN') 
and (sal<>1600 and sal<>950 and sal<>1300);

--15. 커미션이 $500 이상인 사원의 이름과 급여 및 커미션을 출력하시오. 
select ename, sal, comm from emp where comm>=500;


