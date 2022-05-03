--문자(string) 관련 함수

--concat() :  문자연결
select CONCAT('Good' , 'morning') from dual;

select 'Oriacle' || ' 11g' ||' Good' from dual;
--문자3개이상을 연결하는경우 concat()를 사용하는 대신 || 사용 권장
select CONCAT(CONCAT('Oriacle' , ' 11g'), ' Good') from dual;

/*
[시나리오]
사원테이블에서 사원이름을 연결하여 다음과 같이 출력
출력내용:first+last name, 급여, 부서번호
*/

select first_name || ' ' || last_name "name",
 salary, job_id from employees;


--initcap() :  첫문자 대문자
select initcap('hi hello 안녕') from dual;
select initcap('good/bad morning') from dual;
select initcap('naver6say*good가bye') from dual;--say는 안바뀜

/*
[시나리오]
사원테이블에서 first_name이 john인사람
*/
select * from employees where first_name=initcap('john');

--lower() : 문자소문자
--upper() : 문자대문자

select lower('GOOD'), upper('bad') from dual;

select * from employees where upper(first_name)='JOHN';
select lower(first_name), upper(last_name) from employees;

--lpad(), rpad() : 문자열의 왼족, 오른쪽에 특정기호넣을때..

select 'good', 
lpad('good', 7, '####'), RPAD('good',  7, '####') 
from dual;

select RPAD(first_name, 10 ,'*') from employees;

/*
trim() : 공백제거(중간 공백 x)

select trim(' 문자열 ') from dual;
select trim(leading ‘문자’ from '문자열') from dual;

- leading : 왼쪽에서 제거함
- trailing : 오른쪽에서 제거함
- both : 양쪽에서 제거함. 설정값이 없으면 both가 디폴트
*/
select 
    ' 공백제거테스트 ' as trim1,
    trim(' 공백제거테스트 ') as trim2, 
    --양쪽 '다' 삭제 : trim3, trim4
    trim('다' from '다람쥐가 나무를 탑니다') as trim3, 
    trim(both '다' from '다람쥐가 나무를 탑니다') as trim4, 
    --왼쪽 '다' 삭제
    trim(leading '다' from '다람쥐가 나무를 탑니다') as trim5, 
    --오른쪽 '다' 삭제
     trim(trailing '다' from '다람쥐가 나무를 탑니다') as trim6,
     --중간 '다'는 지워지지 x
     trim(trailing '다' from '다람쥐가 다리위의 나무를 탑니다') as trim7
from dual;

--문자열을 제거할수 x
select 
     trim(trailing '다람쥐' from 
     '다람쥐가 다리위의 나무를 탑니다') as trim8
from dual;

--ltrim(), rtrim() : 우측좌측 공백제거, 문자열 ㅇ
select 
    ltrim(' 좌측공백제거 ') ltrim1, 
    ltrim(' 좌측공백제거 ','좌측') ltrim2, --공백도 문자열 삭제x
    ltrim('좌측공백제거 ','좌측') ltrim3,  --삭제됨
    rtrim(' 우측공백제거','제거') ltrim4, 
    rtrim('우측공백제거','공백') ltrim5 --문자열중간에있어서 삭제 x
from dual;

--substr() : 문자열의 시작인덱스부터 길이만큼 잘라서 출력
select substr('good morning', 8 , 4) from dual;
select substr('good morning', 8 ) from dual;

select substr(first_name, 1, 4) from employees;
select rpad(substr(first_name, 1, 4) , 7 ,'*') from employees;

--substrb() : 문자열을 byte 단위로 자름
select substrb('안녕하세요', 1) from dual;

--replace() : 문자열 바꾸기
select 
   replace('good morning john', 'morning', 'evening'), 
    replace('good morning john', 'john', '')
from dual;

--trim과의 비교
select trim(' 글자1 글자2 ') from dual;--중간의 공백은 삭제x
select replace(' 글자1 글자2 ',' ', '') from dual; --중간공백도 삭제

/*
102번 사원의 레코드를 대상으로 문자열 변경해보기
*/
select 
    first_name, last_name, 
    ltrim(first_name, 'L') "좌측L제거", 
    rtrim(first_name, 'ex') "우측ex제거",
    replace(last_name, ' ','') "중간 공백제거", 
    replace(last_name, 'De','Dae') "이름변경" 
from employees where employee_id=102;

--instr() : 특정문자가 위치한 인덱스 값
select instr('good morning tom', 'n') from dual; --9
-- 11( 첫번째부터 'n'의 2번째 문자 위치)
select instr('good morning tom', 'n', 1, 2) from dual;
 --16(8번째부터 'm'의 1번째 문자 위치)
select instr('good morning tom', 'm', 8 , 1) from dual;
