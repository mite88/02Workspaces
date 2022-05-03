--1. months_between(): 현재날짜와 기준날짜 사이의 개월수를 반환
--2020년 1월 1일 부터 지금까지 지난 개월수는 ? 
select 
   ceil(MONTHS_BETWEEN(SYSDATE,'20200101'))restlt1
--, trunc(MONTHS_BETWEEN(SYSDATE,'2020년01월01일')) --포맷이 안맞음
    , ceil(MONTHS_BETWEEN(SYSDATE, 
    to_date('2020년01월01일', 'yyyy"년"mm"월"dd"일"'))) restlt2
from dual;

--근속개월수계산 , 오름차순
select first_name,
    trunc(MONTHS_BETWEEN(SYSDATE,hire_date)) "근속개월수" 
from employees order by "근속개월수";--별칭으로도 컬럼을 지정할수 있어요 ㅇㅂㅇ

--2. add_months():날짜에 개월수를 더한 결과를 반환
select sysdate, add_months(sysdate, 7) "7개월후" from dual;

--3. next_day() : 현재날짜 기준으로 주어진 요일에 일주일이내 해당하는 미래의 날짜를 반환
select next_day(sysdate, '화요일') "담주화요일날짜" from dual;
-- (1:일, 2:월, 3:화, 4:수, 5:목, 6:금, 7:토)
select next_day(sysdate, 3) "담주화요일날짜" from dual;
--일주일범위이기때문에 범위가 넘어가면 일주일내 날짜로출력됨
select next_day('2022/04-20', 5) "담주목요일날짜" from dual; --2022/04/21

--4. last_day() : 해당월의 마지막 날짜를 반환
select last_day('22/04/01') "마지막날짜" from dual;
select last_day('20/02/10') "마지막날짜" from dual;

--5. 단순날짜 계산
select
    sysdate "오늘", sysdate + 1 "내일", sysdate - 1 "어제"
from dual;