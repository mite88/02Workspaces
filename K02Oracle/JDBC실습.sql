/*
Java에서 처음으로 JDBC프로그래밍 해보기
*/
--우선 system계정을 연결한 후 새로운 계정을 생성한다. 
CREATE USER kosmo IDENTIFIED BY 1234; 
GRANT CONNECT, RESOURCE TO kosmo;

--계정을 생성한 후 접속창에 kosmo 계정을 등록하고 해당 문서에 연결한다. 
--회원관리 테이블 : member 생성
CREATE TABLE member
(
	id VARCHAR2(30) NOT NULL,
	pass VARCHAR2(40) NOT NULL,
	name VARCHAR2(50) NOT NULL,
	regidate DATE DEFAULT SYSDATE,
	PRIMARY KEY (id)
);

--더미데이터 입력하기
insert into member (id, pass, name) values ('test', '1234', '테스트');
select * from member;

commit;

--------------------------------------------------------------------------------
select * from member;

select * from user_constraints;

--다른프로그램에선 외부에서실행한 쿼리를 인지하지 못하기에 커밋을 해야함
insert into member (id, pass, name) values ('dummy', '1234', '나는더미');
update member set pass='9x9x' where id='test';

commit;

--검색
select * from member where name like '%테스트1%'


--------------------------------------------------------------------------------

--프로시저 및 함수연동
--함수 : fillAsterik(id)
select rpad(substr('hongildong',1, 1), length('hongildong'), '*') from dual;

create 
    or replace function fillAsterik(idStr varchar2) 
    return varchar2
is
    retStr varchar2(50);
begin
    retStr :=  rpad(substr(idStr,1, 1), length(idStr), '*');
    return retStr;
end;
/

select fillAsterik('kosmo') from dual;
select fillAsterik('nakjasabal') from dual;

------------
set serveroutput on;
create or replace procedure KosmoMemberInsert(
    p_id in varchar2,
    p_pass in varchar2,
    p_name in varchar2,
    returnVal out number-- 입력성공여부..
)
is

begin
    insert into member(id, pass, name) 
    values(p_id, p_pass, p_name);
    
    --정상적 입력
    if sql%found then
        -- 성공한 행의 갯수 반환
        returnVal := sql%rowcount;
        commit;
    else
        --성공한 행 x
        returnVal := 0;
    end if;
end;
/

select * from user_source where name like upper('%kosmomem%');

--바인드변수 생성
var insert_count number;

--프로시져 실행
execute KosmoMemberInsert('pro1','p1234','프로시저1', :insert_count);
--결과확인
print insert_count;

select * from member;


------------
--member테이블에서 레코드를 삭제하는프로시져 작성
create or replace procedure KosmoMemberDelete(
    member_id in varchar2,--아이디
    returnval out varchar2 --SUCCESS/FAIL 반환
)
is--변수없어서 생략함
begin
    --쿼리문 생성
    delete from member where id = member_id;
    
    --member_id 존재하면 삭제
    if SQL%Found then
        returnVal := 'SUCCESS';
        commit;--커밋하여 상태 저장
    else
        returnVal := 'FAIL';
    end if;
    
end;
/

var delete_var varchar2(10);
execute KosmoMemberDelete('pro111', :delete_var);
print delete_var;


------------
/*
시나리오] 아이디와 패스워드를 매개변수로 전달받아서 회원인지 여부를
판단하는 프로시저를 작성하시오. 

    매개변수 : 
        In -> user_id, user_pass
        Out -> returnVal
    반환값 : 
        0 -> 회원인증실패(둘다틀림)
        1 -> 아이디는 일치하나 패스워드가 틀린경우
        2 -> 아이디/패스워드 모두 일치하여 회원인증 성공
    프로시저명 : KosmoMemberAuth
*/
create or replace procedure KosmoMemberAuth(
    user_id in varchar2,
    user_pass in varchar2,
    returnVal out number
)
is
    member_count number(1):= 0;--회원수 저장할 변수
    member_pw varchar2(50);--회원비번을 저장할 변수
begin
    --아이디 존재여부 판단 쿼리
    select count(*) into member_count 
    from member where id=user_id;
    
    --아이디가 존재할경우.
    if member_count = 1 then
        --해당아이디의 패스워드 조회 쿼리
        select pass into member_pw from member 
        where id=user_id;
        
        --패스워드가 맞으면..in파라미터로 전달된 비번과 db의 비번비교
        if member_pw = user_pass then
            returnVal := 2;
        else
            --패스워드가 틀리면
            returnVal := 1;
        end if;
    else
    --아이디가 존재하지 않을경우
        returnVal := 0;
    end if;
end;
/
variable member_auth number;

execute KosmoMemberAuth('dummy', '1234', :member_auth);
print member_auth; --2
execute KosmoMemberAuth('dummy', '1234패스워드틀림', :member_auth);
print member_auth; --1
execute KosmoMemberAuth('dummy아이디틀림', '1234패스워드틀림', :member_auth);
print member_auth; --0