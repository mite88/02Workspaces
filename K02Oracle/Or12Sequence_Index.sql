--study에서 ...

/*
시퀀스
-테이블의 컬럼(필드)에 중복되지 않는 순차적인 일련번호를 부여한다. 
-시퀀스는 테이블 생성후 별도로 만들어야 한다. 즉 시퀀스는 테이블과
    독립적으로 저장되고 생성된다. 

[시퀀스 생성구문]    
create sequence 시퀀스명
    [Increment by N]    -> 증가치설정
    [Start with N]      -> 시작값지정
    [Minvalue n | NoMinvalue]   -> 시퀀스 최소값 지정 : 디폴트1
    [Maxvalue n | NoMaxvalue]   -> 시퀀스 최대값 지정 : 디폴트1.0000E+28
    [Cycle | NoCycle] -> 최대/최소값에 도달할 경우 처음부터 다시
                        시작할지 여부를 설정(cycle로 지정하면 최대값까지
                        증가후 다시 시작값부터 재 시작됨)
    [Cache | NoCache] -> cache 메모리에 오라클서버가 시퀀스값을
                        할당하는가 여부를 지정

주의사항
1. start with 에 minvalue보다 작은값을 지정할 수 없다. 즉 start with값은
    minvalue와 같거나 커야한다. 
2. nocycle 로 설정하고 시퀀스를 계속 얻어올때 maxvalue에 지정값을 초과하면
    에러가 발생한다. 
3. primary key에 cycle옵션은 절대 지정하면 안된다. 
*/

create table tb_goods(
    g_idx number(10) PRIMARY key,
    g_name varchar2(30)
);

insert into tb_goods values(1, '초콜렛');
insert into tb_goods values(1, '새우깡');--;;;

--생성
create SEQUENCE seq_serial_num
    INCREMENT by 1 --증가치
    START WITH 100 --초기값
    MINVALUE 99  --최소값
    MAXVALUE 110 --최대값
    cycle  --최대값도달시 재시작여부
    nocache; --캐시메모리사용안함
    
select * from user_sequences;--시퀀스확인

-- nextval 한다음 currval 하자 
select seq_serial_num.currval from dual;--최초실행시엔 안됨
select seq_serial_num.nextval from dual;--실행시 다음으로 넘어감

--시퀀스를 넣어보자
insert into tb_goods values(seq_serial_num.nextval, '새우깡1');
insert into tb_goods values(seq_serial_num.nextval, '새우깡2');
insert into tb_goods values(seq_serial_num.nextval, '새우깡3');
insert into tb_goods values(seq_serial_num.nextval, '새우깡4');
insert into tb_goods values(seq_serial_num.nextval, '새우깡5');
insert into tb_goods values(seq_serial_num.nextval, '새우깡6');
insert into tb_goods values(seq_serial_num.nextval, '새우깡7');
insert into tb_goods values(seq_serial_num.nextval, '새우깡8');
insert into tb_goods values(seq_serial_num.nextval, '새우깡9');
insert into tb_goods values(seq_serial_num.nextval, '새우깡10');
insert into tb_goods values(seq_serial_num.nextval, '새우깡11');
insert into tb_goods values(seq_serial_num.nextval, '새우깡12');
/*
최대치에도달하여 cycle옵션에 의해 다시처음부터 일련번호가생성되서
무결성제약조건에 위배 
그래서 cycle 옵션을 사용하지 않아야함
*/
insert into tb_goods values(seq_serial_num.nextval, '새우깡13');

select seq_serial_num.currval from dual;

--시퀀스수정 : start with N은 안됨 ㅇㅊㅇ;;;
alter SEQUENCE seq_serial_num 
    INCREMENT by 10 
    MINVALUE 1  
    NOMAXVALUE
    nocycle 
    nocache;
    
select seq_serial_num.nextval from dual;--증가치 바뀐거확인용

--시퀀스삭제
drop SEQUENCE seq_serial_num;

--일반적인 시퀀스생성
create SEQUENCE seq_serial_num 
    INCREMENT by 1 
    START WITH 1 
    MINVALUE 1
    NOMAXVALUE 
    NoCycle  
    nocache; 
    
--------------------------------------------------------------

/*
인덱스(Index)
- 쿼리의 검색속도 향상
- 명시적(create index) / 자동적(primary key, unique)로 생성
- 컬럼에 대한 인덱스가 없을 시 테이블전체 검색
*/

--생성
create index tb_goods_name_idx on tb_goods (g_name);

--데이터사전확인 : 자동적(primary key, unique)으로 생성된 것도 나옴
select * from user_ind_columns;
--데이터사전등록시 대문자로 되기에 이런식으로 upper을써서 검색
select * from user_ind_columns where table_name=upper('tb_goods');

--굉장히 많은 레코드가 있을시(1000만건이상) 검색속도 향상됨
select * from tb_goods where g_name like '%콜%';

--삭제
drop index tb_goods_name_idx;

-- * 수정은 안되니 수정시 삭제하고 다시 생성할것

