--기타함수, 형변환

--1. sysdate : 현재 시간날짜와 시간
select sysdate from dual;

--2. to_char():날짜나 숫자 -> 문자열
/*
to_char(숫자 or 날짜를 저장한 컬럼, '날짜포맷/통화포맷’)
*/
--대소문자 구분x
select to_char(sysdate, 'yyyy/mm/dd') from dual;
select to_char(sysdate, 'YY-MM-DD') from dual;

select to_char(sysdate, '오늘은 yyyy년mm월dd일 입니다') from dual; --x
--지정되지않는 형식으로 표현을 해야할땐 "(더블쿼테이션)으로 해야함
select to_char(sysdate, '"오늘은 "yyyy"년"mm"월"dd"일 입니다"') 
from dual; --ㅇ


select to_char(sysdate, 'day') from dual;
select to_char(sysdate, 'dy') from dual;
select to_char(sysdate, 'mon') from dual;
select to_char(sysdate, 'mm') from dual;
select to_char(sysdate, 'month') from dual;
select to_char(sysdate, 'yy') from dual;
select to_char(sysdate, 'dd') from dual;
select to_char(sysdate, 'ddd') from dual;

--입사일출력 : 0000년00월00일0요일
select first_name, hire_date, 
to_char(hire_date, 'yyyy"년" mm"월" dd"일" dy"요일"')
from employees;

--시간
select to_char(sysdate, 'HH24:mi:ss') from dual;

--날짜 + 시간
select to_char(sysdate, 'yyyy-mm-dd HH:mi:ss') from dual;

--숫자포맷
/*
| , | 콤마형식으로 자리수 표현 
| . | 소수점 형식으로 표현
| 0 | 숫자의 자리수를 표현. 자리수가 맞지 않을때 0으로 자리채움 
| 9 | 숫자의 자리수를 표현.자리수가 맞지 않을때 공백으로 자리채움 
| $ | 달러 표시 
| L | 현지 통화 표시. 한국은 \ 
*/
/*
0과 9의 서식지정
0을 서식으로할때 자리수가 모자르면 0으로 채워짐
9로 서식지정 시 자리수가 모자르면 공백으로 채워짐
*/
select to_char(123,'0000'), trim(to_char(123,'9999')) from dual;

--숫자 세자리마다 , 하기
--자리수가 확실히 보장되는것만 0으로하고  다른부분을 9로하면 좋음
select 
    to_char(12345,'000,000'), trim(to_char(12345,'999,999')),
    ltrim(to_char(12345,'990,000'))
from dual;

--통화지정
select to_char(1000000,'L9,999,000') from dual;

--3. to_number() : 문자형 -> 숫자형
select to_number('123') +to_number('456') from dual;

--4. to_date() : 문자열 -> 날짜
select 
to_date('2022-04-19') "날짜기본서식1", 
to_date('20220419') "날짜기본서식2", 
to_date('2022/04/19') "날짜기본서식3"
from dual;

--날짜포멧이 년-월-일 형식이 아니라면 인식이 안되서 날짜서식을 바꾸어야함

/*
다음 주어진 날짜형식의 문자열을 쿼리문으로 구성
'14-10-2021' -> 2021-10-14
'04-19-2022' -> '2022-04-19'
*/
select 
    to_date('14-10-2021', 'dd-mm-yyyy') 
from dual;

select 
    to_date('04-19-2022', 'mm-dd-yyyy')   
from dual;

/*
2020-10-14 15:30:21와 같은 형태의 문자열을 날짜로 인식
*/
select 
to_date(substr('2020-10-14 15:30:21' , 1, 10) ) 
from dual;

/*
문자열 2021-05-05의 요일은?
*/
select 
    to_char( to_date('2021-05-05') , 'day' ) 
from dual;

/*
문자열 2021년01월01일 이 무슨요일
*/
select 
    to_char(to_date('2021년01월01일', 'yyyy"년"mm"월"dd"일"') 
    , 'day' ) 
from dual;


--5. nvl() : null값을 다른 데이터로 변경
-- 이 경우 commission_pct이 null인곳은 제대로 안나옴
select salary+commission_pct from employees; 

select salary+nvl(commission_pct, 0) from employees; 

--6. decode() : java의 switch문과 비슷, 내부적인 코드값을 문자열로 변환
select * from employees;

/*
사원테이블에서 각 부서번호에 해당되는 부서명을 출력
 decode 이용
*/

select
    first_name, last_name, decode(department_id,
    10,	'Administration',
    20,	'Marketing',
    30,	'Purchasing',
    40, 'Human Resources',
    50,	'Shippin',
    60,	'IT',
    70,	'Public Relation',
    80,	'Sales',
    90,	'Executive',	
    100,'Finance',
    '부서명확인안됨' )
from employees; 

--7. case() : ava의 if~else 문과 같은 역할

/*
사원테이블에서 각 부서번호에 해당되는 부서명을 출력
 case 이용
*/
select
    first_name, last_name, department_id,
    case
        when department_id=10 then 'Administration'
        when department_id=20 then 'Marketing'
        when department_id=30 then 'Purchasing'
        when department_id=40 then 'Human Resources'
        when department_id=50 then 'Shippin'
        when department_id=60 then 'IT'
        when department_id=70 then 'Public Relation'
        when department_id=80 then 'Sales'
        when department_id=90 then 'Executive'
        when department_id=100 then 'Finance'
        else '부서명확인안됨' 
    end team_name
from employees; 


--#Or04TypeConvert.sql 파일 아래에 연결해서 아래 문제를 풀어주세요.
--#과제전용 > 02Oracle > 연습문제2(형변환함수) 폴더하위에 본인이름으로 업로드 합니다.
--#해당 문제는 scott계정에 생성된 EMP 테이블을 이용합니다.

--1. substr() 함수를 사용하여 사원들의 입사한 년도와 입사한 달만 출력하시오.
select 
    substr(hiredate, 1,2) "입사한 년도",
    substr(hiredate, 4,2) "입사한 달" 
from emp;

--2. substr()함수를 사용하여 4월에 입사한 사원을 출력하시오. 즉, 연도에 상관없이 4월에 입사한 모든사원이 출력되면 된다.
select * from emp where substr(hiredate, 4,2)=04;

--3. mod() 함수를 사용하여 사원번호가 짝수인 사람만 출력하시오.
select * from emp where mod(empno,2)=0;

--4. 입사일을 연도는 2자리(YY), 월은 숫자(MON)로 표시하고 요일은 약어(DY)로 지정하여 출력하시오.
select to_char(hiredate,'YY-MON DY') "입사일변경" from emp;

--5. 올해 며칠이 지났는지 출력하시오. 현재 날짜에서 올해 1월1일을 뺀 결과를 출력하고 
--TO_DATE()함수를 사용하여 데이터 형을 일치 시키시오. 단, 날짜의 형태는 ‘01-01-2020’ 포맷으로 사용한다.
--즉 sysdate - ‘01-01-2020’ 이와같은 연산이 가능해야한다. 
select trunc(sysdate - to_date('01-01-2022', 'dd-mm-yyyy') ) "올해로부터 며칠" from dual ;

--6. 사원들의 메니져 사번을 출력하되 상관이 없는 사원에 대해서는 NULL값 대신 0으로 출력하시오.
select nvl(mgr, 0) "매니져 사번" from emp;

--7. decode 함수로 직급에 따라 급여를 인상하여 출력하시오.
--‘CLERK’는 200, ‘SALESMAN’은 180, ‘MANAGER’은 150, ‘PRESIDENT’는 100을 인상하여 출력하시오.

select job, sal,
    decode( job,
        'CLERK', sal+200,
        'SALESMAN', sal+180,
        'MANAGER', sal+150,
        'PRESIDENT', sal+100 
    ) "인상된급여"
from emp;