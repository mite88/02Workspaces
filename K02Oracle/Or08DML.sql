--DML(Data Manipulation Language)

/*
입력:insert
*/

create table tb_sample(
    dept_no number(10),
    dept_name VARCHAR2(20),
    dept_loc varchar2(15),
    dept_manager varchar2(30)
);

desc tb_sample;

-- 입력1
INSERT INTO 
    tb_sample (dept_no, dept_name, dept_loc, dept_manager) 
    VALUES (10, '기획실', '서울','나연');
-- 입력2
INSERT INTO tb_sample VALUES (20, '전산팀', '수원','쯔위');
INSERT INTO tb_sample VALUES (30, '영업팀', '대구','모모');
INSERT INTO tb_sample VALUES (40, '인사팀', '부산','지효');

select * from tb_sample;


/*
commit
: 지금까지의 작업(트랜잭션)을 그대로 유지시키는 명령어

rollback
: 모든 레코드를 마지막 커밋이후의 상태로 되돌림
*/
commit;

INSERT INTO tb_sample VALUES (50, '굼융팀', '제주','아이린');
select * from tb_sample;
--커밋이후 데이터를 입력했는데 실수를 해서 롤백시켜 입력안한걸로 하기위해 씀
ROLLBACK; 

select * from tb_sample;

/*
수정:update
*/

-- 부서번호가 40번인 레코드의 지역을미국으로 변경
update tb_sample set dept_loc ='미국' where dept_no=40;

--지역이 서울인 레코드의 매니져명을 '박진영'으로 수정
update tb_sample set dept_manager='박진영' where dept_loc='서울';

--모든레코드를 대상으로 지역을 '가산디지털' 로 변경
--where절없으면 전체가 변경됨
update tb_sample set dept_loc ='가산디지털';

select * from tb_sample;


/*
삭제: delete
*/
--부서번호가 10번인 레코드삭제
delete from tb_sample where dept_no=10;
delete from tb_sample;

select * from tb_sample;

ROLLBACK; 

select * from tb_sample;