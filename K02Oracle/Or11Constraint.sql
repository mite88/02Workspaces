/*
제약조건(Constraint)

Primary key(기본키) : not null+unique
Unique : 값의 중복 x(null은 제외)
Foreign key (외래키, 참조키)
Not null : null값 허용 x
Default : 입력하지 않을시 자동입력
check : 정해진값만입력
*/

-- study계정에서 ...
/*
Primary key(기본키) : not null+unique
-참조무결성유지를 위한 제약조건
-하나의 테이블에서 하나의 기본키만 생성가능
-기본키 설정시 그칼럼의 값은 중복 및 null x
-주로 레토드 하나를 특정하기위해 사용
*/

--인라인방식 : 컬럼 생성시 우측에 제약조건 기술
create table tb_primary1(
    idx number(10) PRIMARY key,
    user_id varchar2(30),
    user_name varchar2(50)
);


/*
데이터사전 (읽기전용)
데이터베이스 관리 시스템(Database Management System, 이하 DBMS)
을 효율적으로 사용하기 위해 데이터베이스에 저장된 정보를 요약
*/
select * from tab; --테이블목록

--제약조건확인
select * from user_cons_columns; 
select * from user_constraints; --자세히

-- 에러들..(Primary key(기본키) : not null+unique 이기때문에 중복된값은 들어가지 x)
insert into tb_primary1(idx, user_id,user_name) values(1,'kosmo', '코스모');

/*
오류 보고 - ORA-00001: unique constraint (STUDY.SYS_C007003) violated
*/
insert into tb_primary1(idx, user_id,user_name) values(1,'smo', '스모');

insert into tb_primary1 values(2,'white', '화이트');
/*
오류 보고 - ORA-01400: cannot insert NULL into ("STUDY"."TB_PRIMARY1"."IDX")
*/
insert into tb_primary1 values('','block', '블랙');


/*
오류 보고 - ORA-00001: unique constraint (STUDY.SYS_C007003) violated
*/
update tb_primary1 set idx=2 where user_name='코스모';



--아웃라인 방식
create table tb_primary2(
    idx number(10),
    user_id varchar2(30),
    user_name varchar2(50),
    CONSTRAINT my_pk1 PRIMARY key(user_id)
);

insert into tb_primary2 values(1,'white', '화이트1');
insert into tb_primary2 values(2,'white', '화이트2');


--테이블생성후 alter문 제약조건추가
create table tb_primary3(
    idx number(10),
    user_id varchar2(30),
    user_name varchar2(50)
);

alter table tb_primary3 add constraint tb_primary3_pk
 primary key (user_name);
 
--제약조건은 테이블을대상으로 하기에 테이블 삭제시 제약조건도 같이삭제됨
drop table tb_primary3;


/*
ORA-02260: table can have only one primary key

기본키는하나만 가능함
*/
create table tb_primary3(
    idx number(10) PRIMARY key,
    user_id varchar2(30) PRIMARY key,
    user_name varchar2(50)
);

----------------------------------------------------------

/*
Unique:값의 중복 x(null은 제외)

* unique괄호안에 여러개의 칼럼으로 제약조건을 거는 경우 
그 칼럼전체의 값이 중복이아니라면 값이 들어가게된다.
*/

create table tb_unique(
    --기본키를제외하고 같은 제약조건처럼 넣기 위해서  unique not null을 사용
    idx number(10) unique not null, 
    name varchar2(30),
    telephone varchar2(20),
    nickname varchar2(30),
    --이렇게여러칼럼을 합하여 잡으면 같은 제약조건명으로 잡힘
    UNIQUE(telephone, nickname) 
);

select * from user_constraints;

insert into tb_unique values(1,'아이린','010-1111-1111', '레드벨뱃');
--null값은 여러개가능함
insert into tb_unique values(2,'웬디','010-2222-2222', '');
insert into tb_unique values(3,'슬기','', '');

insert into tb_unique values(1,'예리','010-3333-3333', '');--에러

insert into tb_unique values(4,'정우성','010-4444-4444', '영화배우');
insert into tb_unique values(5,'이정재','010-5555-5555', '영화배우');
--에러 : UNIQUE(telephone, nickname)해서 둘다 중복인 값이있으므로 안들어감
insert into tb_unique values(6,'황정민','010-4444-4444', '영화배우');--에러

/*
Foreign key (외래키, 참조키)
*/
--인라인방식
create table tb_foreign1(
    f_idx number(10) PRIMARY KEY,
    f_name varchar2(50),
    f_id varchar2(30) CONSTRAINT tb_foreign_fk1 
    
    /*
    자식테이블인 tb_foreign1에서 부모테이블인 tb_primary2의
    user_id를 참조하는 외래키 생성
    */
    REFERENCES tb_primary2(user_id)
);

select * from user_constraints;
/*
오류 보고 -
ORA-02291: integrity constraint (STUDY.TB_FOREIGN_FK1) violated
- parent key not found
*/
insert into tb_foreign1 values(12,'홍길동','gildong');

insert into tb_foreign1 values(1,'하얀색','white');

/*
오류 보고 -
ORA-02292: integrity constraint (STUDY.TB_FOREIGN_FK1) violated 
- child record found

자식레코드에서 먼저삭제후 부모도 삭제해야함
*/
delete from tb_primary2 where user_id='white';--에러

delete from tb_foreign1 where f_id='white';
delete from tb_primary2 where user_id='white';

--아웃라인방식
create table tb_foreign2(
    f_id number primary key ,
    f_name varchar2(30),
    f_date date, 
    FOREIGN key (f_id) references tb_primary1(idx)
);


--테이블 생성 후 alter문으로 추가
create table tb_foreign3(
    idx number primary key ,
    f_name varchar2(30),
    f_idx number(10)
);

alter table tb_foreign3 add
    FOREIGN key (f_idx) references tb_primary1(idx);
    
    
--Foreign key에서 delete 옵션
/*
컬럼명 자료형 references 부모테이블 (부모테이블의 PK컬럼명) 다음에

on delete cascade
-- 부모레코드 삭제시 자식레코드까지 같이 삭제됨
on delete set null
-- 부모레코드 삭제시 자식레코드값이 null로 변경됨

ex)스팸게시물남긴 회원글 일제 삭제(자식 테이블모두 삭제되니주의바람)
*/
create table tb_primary4(
    user_id varchar2(30) primary key,
    user_name varchar2(100)
);

create table tb_forgign4(
    f_idx number(10) primary key,
    f_name varchar2(30),
    user_id varchar2(30)constraint tb_foreign4_fk 
    --on delete cascade로 부모삭제시 자식도삭제되게 해버림
    references tb_primary4 (user_id) on delete cascade
);


insert into tb_primary4 values('kosmo','코스모');
insert into tb_forgign4 values(1,'스팸1입니다','kosmo');
insert into tb_forgign4 values(2,'스팸1입니다','kosmo');
insert into tb_forgign4 values(3,'스팸1입니다','kosmo');
insert into tb_forgign4 values(4,'스팸1입니다','kosmo');
insert into tb_forgign4 values(5,'스팸1입니다','kosmo');
insert into tb_forgign4 values(6,'스팸1입니다','kosmo');
insert into tb_forgign4 values(7,'스팸1입니다','kosmo');
insert into tb_forgign4 values(8,'난...어쩌죠?','gasan');--에러

delete from tb_primary4 where user_id='kosmo'; -- 부모/자식다 삭제되어버림


create table tb_primary5(
    user_id varchar2(30) primary key,
    user_name varchar2(100)
);

create table tb_forgign5(
    f_idx number(10) primary key,
    f_name varchar2(30),
    user_id varchar2(30)constraint tb_foreign5_fk 
    --on delete set null로 부모삭제시 자식이 null됨
    references tb_primary5 (user_id) on delete set null
);

insert into tb_primary5 values('kosmo','코스모');
insert into tb_forgign5 values(1,'스팸1입니다','kosmo');
insert into tb_forgign5 values(2,'스팸1입니다','kosmo');
insert into tb_forgign5 values(3,'스팸1입니다','kosmo');
insert into tb_forgign5 values(4,'스팸1입니다','kosmo');
insert into tb_forgign5 values(5,'스팸1입니다','kosmo');
insert into tb_forgign5 values(6,'스팸1입니다','kosmo');
insert into tb_forgign5 values(7,'스팸1입니다','kosmo');

delete from tb_primary5 where user_id='kosmo';


--------------------------------------------------------
/*
Not null:null값 허용 

-지정된 칼럼에 빈값입력시 오류
-주민번호, id와 같이 반드시 입력해야하는 항목에 설정
-primary key로 설정된 컬럼은 기본적으로 해당 제약조건을 가짐
*/
create table tb_not_null(
    m_idx number(10) primary key,-- not null+unique
    m_id varchar2(20) not null,
    m_pw varchar2(30) null, --null은 사용하지않음(자동허용이되므로)
    m_name varchar2(40)
);

insert into tb_not_null values(10,'hong1','1111','홍길동');
insert into tb_not_null values(20,'hong2','1111','');
insert into tb_not_null values(30,'hong3','','');
insert into tb_not_null values(40,'','','');--에러: m_id에 not null

insert into tb_not_null (m_id, m_pw,m_name )
values('hong1','1111','홍길동'); --에러 m_idx는 primary key

--이런 스페이스키를쳐서 넣어졌다 ㅇㅊㅇ
insert into tb_not_null values(60,' ','6666','육길동');

/*
Default:입력하지 않아도자동입력
*/
create table tb_default(
    id varchar2(30) not null,
    pw varchar2(50) default 'qwer'
);

insert into tb_default values('aaaa','1234');
--pw엔 데이터를 입력하지 않았지만 자동입력을 지정해서 'qwer'이 들어감
insert into tb_default(id) values('bbbb');
insert into tb_default values('ccc','');--null이됨 ㅇㅊㅇ
insert into tb_default values('ddd',' ');
--default을 직접적으로 입력하면 기본값이 들어감 
insert into tb_default values('eee',default);


/*
Check:정해진 값만 입력할때 사용
*/

create table tb_cheak1(
    gender char(1) not null 
    constraint check_gender check(gender in('M','F'))
);

insert into tb_cheak1 values('M');
insert into tb_cheak1 values('f');--에러
insert into tb_cheak1 values('A');--에러

--범위지정
create table tb_cheak2(
    sale_count number not null 
    check(sale_count<=10)
);

insert into tb_cheak2 values(9);
insert into tb_cheak2 values(11);--에러