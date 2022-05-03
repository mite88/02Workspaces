/*
DCL(Data Control Language)
새로운 사용자계정을 생성하고 
시스템권한을 부여할때 사용하는 SQL문
*/

/*
사용자 계정 생성 및 권한설정

최고관리자(sys,system)에 접속 후 실행해야함
생성 후 테스트는 cmd에서 진행
*/
--계정생성 및 암호
create user test_user1 IDENTIFIED by 1234;

--권한부여-접속할수 있는 권한
grant create session to test_user1;

--권한부여-테이블생성권한 
grant create table to test_user1;

-----------------------------------------------------------------

/*
테이블 스페이스

디스크공간을 소비하는 테이블과 뷰, 그리고 그밖에 다른데이터베이스
객체들이 저장되는장소

오라클 최초실행시 hr계정의 데이터를 저장하는 user라는 테이블 스페이스
가 자동으로 생성됨
*/

--조회
desc dba_tablespaces;

--공간확인
select tablespace_name, sum(bytes), max(bytes), 
to_char(sum(bytes),'9,999,999,000'), to_char(max(bytes),'9,999,999,000')
from dba_free_space group by tablespace_name;

--앞에서 생성한 test_user1 사용자의 테이블스페이스확인
select username, default_tablespace from dba_users
where username in upper('test_user1');
--system테이블 스페이스임을 확인하였으므로 그테이블의 영역을 할당할것임

--테이블스페이스 영역 할당
alter user test_user1 quota 2m on system;
/*
test_user1이 system테이블 스페이스에 테이블을 생성할수 있게
2m용량할당
*/

--2번째 사용자 추가 : 테이블스페이스를 users로 지정하여 생성함
create user test_user2 IDENTIFIED BY 1234 default tablespace users;
grant create session to test_user2; 
grant create table to test_user2;

--테이블생성시 users테이블스페이스의 대한 권한이 없어서 생성되지 x
select username, default_tablespace from dba_users
where username in upper('test_user2');

--테이블스페이스 영역 할당
alter user test_user2 quota 10m on users;

--테이블스페이스 변경
alter user test_user1 default tablespace users;

/*
이전에 system으로 테이블스페이스영역을할당하였으므로
위에서 users로 변경하면 users에 할당된것은 아니기 때문에
테이블생성 시 에러가 난다
*/

-----------------------------------------------------------

--암호변경
alter user test_user1 IDENTIFIED BY 4321;


------------------------------------------------------------
/*
ROLE
다양한 권한을 관리할수 있게 관련된 권한끼리 묶은것
*/

--role를 통해 여러권한 동시 부여하기
grant connect, resource to test_user2;

--role 생성
create role kosmo_role;

--생성한 롤 권한부여
grant create session, create table, create view to kosmo_role;

--새사용자계정 생성 후 롤을 통한 권한부여
create user test_user3 IDENTIFIED by 1234;

grant kosmo_role to test_user3;

--role삭제
drop role kosmo_role;

/*
test_user3 사용자의 role인 kosmo_role을 삭제하게되어
거기에 부여된권한이 회수(revoke)
*/

----------------------------------------------------------
-- 권한삭제
revoke create session from test_user1;

--계정삭제
drop user test_user1;