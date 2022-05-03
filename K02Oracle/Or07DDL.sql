/*
DDL(Data Definition Language)
테이블, 뷰와 같은 객체를 생성 및 변경하는 쿼리문
*/

/*
system 계정연결후 새로운사용자 계정생성을 위해 다음명령어 입력하고 
시작할것
*/
create user study IDENTIFIED by 1234; --계정생성
grant connect, resource to study; --권한부여(나중에 배움)

---study계정----------------------------------------------------
--모든계정에 존재하는 논리적인 테이블
select * from dual;
--해당계정에 생성된 테이블 목록(시스템테이블)
select * from tab;


--1. 테이블 생성
/*
create table 테이블명 (
	컬럼1 자료형 [not null],
	컬럼2 자료형 [not null],
	......
	primary key (필드명) 등 제약조건(외래키, 유니크키 등)
);
*/

create table tb_number(
    idx number(10), --정수10자리
    userid varchar2(30),--문자30byte
    passwd varchar2(50),--문자50byte
    username varchar2(30),--문자30byte
    mileage number(7,2)--정수7자리,실수2번째자리까지 표현
);


desc tb_number; -- 테이블구조(스키마)

/*
2. 테이블에 컬럼 추가하기

alter table 테이블명 add 추가할컬럼 자료형(크기) 제약조건;
*/

--기존에 추가된 테이블에서 새로운 컬럼추가 : tb_number에 email 컬럼추가
alter table tb_number add email varchar2(100);

/*
3. 테이블에 컬럼 수정하기

alter table 테이블명 modify 수정할컬럼명 자료형(크기);
*/
alter table tb_number modify email varchar2(1000);
alter table tb_number modify username varchar2(60);

/*
4. 테이블 삭제하기

컬럼삭제 : alter table 테이블명 drop column 컬럼명;
테이블삭제 : drop table 테이블명;
*/

alter table TB_NUMBER drop column MILEAGE;

CREATE TABLE EMPLOYEES(
    employee_id number(6),
    first_name varchar2(20),
    last_name varchar2(25),
    email varchar2(25),
    phone_number varchar2(20),
    hire_date date,
    job_id varchar2(10),
    salary number(8,2),
    commission_pct number(2,2),
    manager_id number(6),
    department_id number(4)
);

drop table EMPLOYEES;

--tb_number 테이블에 레코드 삽입(다음챕터에서 할예정)
insert into tb_number values
(1, 'hong', '1234', '홍길동', 'hong@naver.com');
insert into tb_number values
(2, 'yu', '9876', '유비', 'yoo@daum.net');

select * from tb_number where idx=1;

--테이블복사1:레코드까지..
--where 절이없으면 모든 레코드 복사됨
create table tb_number_copy 
as 
select * from tb_number;

--테이블복사2 : 레코드제외하고 테이블구조만 ..
create table tb_number_empty
as 
select * from tb_number where 1=0;

/*
DDL문 : 테이블을 생성 및 조작하는 쿼리문
(Data Definition Language : 데이터정의어)

테이블생성 : create table 테이블명
테이블수정(컬럼추가) : alter table 테이블명 add 컬럼명
테이블수정(컬럼수정) : alter table 테이블명 modify 컬럼명
테이블수정(컬럼삭제) : alter table 테이블명 drop 컬럼명
테이블삭제 : drop table 테이블
*/




