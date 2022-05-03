--1. pr_dept테이블생성
CREATE TABLE pr_dept(
    dno NUMBER(2), 
    dname varchar2(20), 
    loc varchar2(35)
);

--2. pr_emp테이블 생성
CREATE TABLE pr_emp(
    eno NUMBER(4), 
    ename varchar2(10), 
    job varchar2(30), 
    regist_date date 
);

--3. pr_emp 테이블의 ename 컬럼을 varchar2(50) 로 수정하시오.
alter table pr_emp MODIFY ename varchar2(50);

--4. 1번에서 생성한 pr_dept 테이블에서 dname 칼럼을 삭제하시오.
alter table pr_dept drop COLUMN dname;

--5. “pr_emp” 테이블의 job 컬럼을 varchar2(50) 으로 수정하시오.
alter table pr_emp MODIFY job varchar2(50);

/*확인용임*/
desc pr_dept;
desc pr_emp;


--1.pr_emp테이블 데이터삽입
insert into pr_emp VALUES(1, '엄태웅', '어른 승민',  '1975-11-21');
insert into pr_emp VALUES(2 ,'이제훈', '대학생 승민', '1978-07-23');
insert into pr_emp VALUES(3, '한가인', '어른 서연', '1982-10-24');
insert into pr_emp VALUES(4, '배수지', '대학생 서연', '1988-05-21');

--2.to_date함수를 이용해서 현재날짜 기준으로 7일전날짜 입력
--SELECT to_char(SYSDATE-7, 'yyyy-mm-dd') FROM dual;
insert into pr_emp VALUES(5, '조정석', '납뜩이', to_char(SYSDATE-7, 'yyyy-mm-dd'));

--3. pr_emp 테이블의 eno가 짝수인 레코드를 찾아서 job 컬럼의 내용을 다음과 같이 변경하시오.
update pr_emp
    set job = job||'(짝수)'
where mod(eno,2) =0;

commit;
--4. pr_emp 테이블에서 job 이 대학생인 레코드를 찾아 이름만 삭제하시오. 
--레코드는 삭제되면 안됩니다.
--* 이름을  없는걸로 수정(??)

update pr_emp
    set ename ='' 
where job like '%대학생%';

--5.  pr_emp 테이블에서 등록일이 10월인 모든 레코드를 삭제하시오.
delete from pr_emp 
where to_char(regist_date, 'mm') ='10';


---6,7번은 어 우리가 배운내용이 아니라서 …
--일단 6번의 경우는 복사하는쿼리를  조금만변경하시면 풀릴겁니다

/*
6.  pr_emp 테이블을 복사해서 pr_emp_clone 테이블을 생성하되 다음 조건에 따르시오. 
조건1 : 기존의 컬럼명을 idx, name, nickname, regidate 와같이 변경해서 복사한다. 
조건2 : 레코드까지 모두 복사한다. 
*/

CREATE TABLE pr_emp_clone (idx, name, nickname, regidate)  AS 
select eno , ename, job, regist_date from pr_emp;

--7. 6번에서 복사한 pr_emp_clone 테이블명을 pr_emp_rename 으로 변경하시오.
ALTER table pr_emp_clone rename to pr_emp_rename; 
--전 알고는 있는 내용이긴한데….우리이거배웠던가요? ㅠㅠ 다른방법이있나?

--8. pr_emp_rename 테이블을 삭제하시오
drop table pr_emp_rename;

/*확인용임*/
select * from pr_dept;
select * from pr_emp;
select * from pr_emp_clone;
select * from pr_emp_rename;
