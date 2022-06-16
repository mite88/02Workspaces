/*
블럭 단위 주석
*/

# 라인 단위 주석 

/*
HeidiSQL(하이디SQL)에서 쿼리를 실행하는 방법
1. F9 : 현재 문서의 쿼리 전체를 실행한다. 
2. Ctrl + F9 : 블럭으로 지정한 쿼리만 실행한다. 
	만약 쿼리의 절반정도만 선택한다면 에러가 발생하게 된다. 
3. Ctrl + Shift + F9 : 현재 쿼리를 실행한다. 
	단, 마지막에 기술한 세미콜론 안으로 커서를 옮긴후 실행해야한다.
*/

/*****
데이터 타입(자료형)의 종류
1.숫자형
******/
CREATE TABLE tb_int ( 
	idx INT PRIMARY KEY AUTO_INCREMENT, 
	
	num1 TINYINT UNSIGNED NOT NULL,
	num2 SMALLINT NOT NULL,
	num3 MEDIUMINT DEFAULT '100',
	num4 BIGINT ,
	
	fnum1 FLOAT(10,5) NOT NULL,
	fnum2 DOUBLE(20,10) 
);
/*
AUTO_INCREMENT : 테이블 생성시 자동증가 컬럼으로 지정할때 사용하는 제약조건.
	오라클은 테이블과 별도로 시퀀스를 생성하지만 MySQL의 경우 테이블의 특정
	컬럼에 자동증가를 지정한다. 

UNSIGNED : 숫자 컬럼인 경우 주로 -100~100과 같이 음수와 양수의 범위를 사용하게
	되는데, 양수만 사용하고 싶을때 unsigned를 지정한다. 이 경우 음수의 범위만큼
	양수의 범위가 2배로 늘어나게 된다. 즉 0~200으로 지정된다.

숫자컬럼을 실수로 지정하는 경우
	FLOAT(10,5) => 전체자리수 10, 소수이하 자리수 5
		즉 xxxxx.xxxxx 와 같이 표현된다. 	
*/
#테이블의 구조 확인
DESC tb_int; 

#레코드 확인하기
SELECT * FROM tb_int;

/*
자동증가 컬럼인 idx는 insert에서 생략한다. 그러면 시퀀스와 같이 
중복되지 않는 자동증가값이 입력된다. 
*/
INSERT INTO tb_int (num1, num2, num3, num4, fnum1, fnum2)
	VALUES (123, 12345, 1234567, 1234567890, 
			12345.12345, 1234567890.1234567891);
SELECT * FROM tb_int;

/*
자동증가 컬럼에 임의의 값을 삽입할수 있으나, 사용하지 않는것을 권장한다. 
*/
INSERT INTO tb_int (idx, num1, num2, num3, num4, fnum1, fnum2)
	VALUES (10, 123, 12345, 1234567, 1234567890, 
			12345.12345, 1234567890.1234567891);
SELECT * FROM tb_int;

#idx컬럼은 PK로 지정되었으므로 빈값은 삽입할 수 없다. 에러발생됨.
INSERT INTO tb_int (idx, num1, num2, num3, num4, fnum1, fnum2)
	VALUES ('', 123, 12345, 1234567, 1234567890, 
			12345.12345, 1234567890.1234567891);
			

/********
2.날짜형
*********/
CREATE TABLE tb_date (
	idx INT PRIMARY KEY AUTO_INCREMENT,
	
	date1 DATE NOT NULL,
	date2 DATETIME DEFAULT CURRENT_TIMESTAMP
);
DESC tb_date;
/*
CURRENT_TIMESTAMP : 테이블 생성시 날짜타입의 컬럼에 디폴트값으로 
	사용하는 함수로 현재날짜를 입력해준다. 
	
now() : insert쿼리에서 날짜타입의 컬럼에 현재날짜를 입력할때 사용하는 함수.

*/
INSERT INTO tb_date (DATE1, DATE2) VALUES ('2022-06-14', NOW());
INSERT INTO tb_date (DATE1) VALUES ('2022-12-25');

SELECT * FROM tb_date;



/**********
3. 문자형
**********/
CREATE TABLE tb_string (
	idx INT PRIMARY KEY AUTO_INCREMENT,
	
	str1 VARCHAR(30) NOT NULL,
	str2 TEXT 
);
DESC tb_string;
/*
오라클에서는 문자열의 길이에 상관없이 varchar2(n) 타입을 사용하지만
MySQL에서는 짧은글인 경우 varchar(n), 긴글인 경우 text를 주로 사용한다. 
*/
INSERT INTO tb_string (str1, str2) VALUES ('나는 짧은글', '나는 엄청 긴글');
SELECT * FROM tb_string;


/**********
4. 특수형
**********/
/*
enum : 정해진 항목중에서 하나만 선택가능함
set : 정해진 항목 중 여러개를 선택할 수 있음. 콤마로 구분해서 선택.
*/
CREATE TABLE tb_spec (
	idx INT AUTO_INCREMENT, 
	
	spec1 ENUM('M','W','T'),
	spec2 SET('A','B','C','D'),
	
	PRIMARY KEY (idx)
);
DESC tb_spec;
#설정된 값 중 선택해서 입력하므로 정상적으로 입력된다. 
INSERT INTO tb_spec (spec1, spec2) VALUES ('W', 'A,B,C');
#spec1은 null을 허용하는 컬럼이므로 제외해도 문제없이 입력된다. 
INSERT INTO tb_spec (spec2) VALUES ('D,C');
#설정된 값이 아니면 입력되지 않는다. 따라서 에러발생됨.
INSERT INTO tb_spec (spec1, spec2) VALUES ('A', 'A,F,C');

SELECT * FROM tb_spec;

#앞에서 본것과 같이 DML문은 오라클과 동일하다. 
SELECT * FROM tb_string;

INSERT INTO tb_string (str1, str2) VALUES ('오라클이랑..', '동일하네요^^*');
SELECT * FROM tb_string;

UPDATE tb_string SET str1='내용수정됨' WHERE idx=1;
SELECT * FROM tb_string;

DELETE from tb_string WHERE idx=1;
SELECT * FROM tb_string;


/***************
python 실습을 위한 테이블 생성
****************/
/*
JSP실습시 오라클에서 생성한 테이블 쿼리문
CREATE TABLE board(
	num number NOT NULL,
	title varchar2(200) NOT NULL,
	content varchar2(2000) NOT NULL,
	id varchar2(10) NOT NULL,
	postdate date default sysdate NOT NULL,
	visitcount number(6),
	PRIMARY KEY (num)
);
*/
CREATE TABLE board(
	num INT NOT NULL AUTO_INCREMENT ,
	title VARCHAR(200) NOT NULL,
	content TEXT NOT NULL,
	id VARCHAR(10) NOT NULL,
	postdate DATETIME default CURRENT_TIMESTAMP NOT NULL,
	visitcount MEDIUMINT,
	PRIMARY KEY (num)
);
DESC board;

/*
오라클에서는 시퀀스가 있으므로 PK컬럼에 사용한다. 
날짜 입력시에는 sysdate를 사용한다. 

오라클의 insert문 => 
insert into board  (num, title, content, id, postdate, visitcount) 
	values (seq_board_num.nextval, '제목1입니다', '내용1입니다', 'musthave', sysdate, 0);
*/

insert into board  (title, content, id, postdate, visitcount) 
	values ('제목1입니다', '내용1입니다', 'musthave', NOW(), 0);	
insert into board  (title, content, id, postdate, visitcount) 
	values ('제목2입니다', '내용2입니다', 'musthave', NOW(), 0);
insert into board  (title, content, id, postdate, visitcount) 
	values ('제목3입니다', '내용3입니다', 'musthave', NOW(), 0);
insert into board  (title, content, id, postdate, visitcount) 
	values ('제목4입니다', '내용4입니다', 'musthave', NOW(), 0);
insert into board  (title, content, id, postdate, visitcount) 
	values ('제목5입니다', '내용5입니다', 'musthave', NOW(), 0);       

SELECT * FROM board;



/**********
서블릿으로 게시판 만들기
***********/
# 모델2 방식의 파일첨부형 게시판 테이블 생성
create table mvcboard (
	idx INT PRIMARY KEY AUTO_INCREMENT , 
	name VARCHAR (50) not null, 
	title VARCHAR (200) not null, 
	content TEXT  not null, 
	postdate DATETIME  default CURRENT_TIMESTAMP  not null, 
	ofile VARCHAR (200), 
	sfile VARCHAR (30), 
	downcount MEDIUMINT  default 0 not null, 
	pass VARCHAR (50) not null, 
	visitcount INT  default 0 not null
);
# 테이블 구조 확인하기
DESC mvcboard;
# 테이블 삭제하기
DROP TABLE mvcboard;

--더미 데이터 입력
insert into mvcboard (name, title, content, pass)
    values ( '김유신', '자료실 제목1 입니다.','내용','1234');
insert into mvcboard (name, title, content, pass)
    values ( '장보고', '자료실 제목2 입니다.','내용','1234');
insert into mvcboard (name, title, content, pass)
    values ( '이순신', '자료실 제목3 입니다.','내용','1234');
insert into mvcboard (name, title, content, pass)
    values ( '강감찬', '자료실 제목4 입니다.','내용','1234');
insert into mvcboard (name, title, content, pass)
    values ( '대조영', '자료실 제목5 입니다.','내용','1234');
    
# 레코드 확인하기
SELECT * FROM mvcboard;

#게시물 수 카운트 하기
SELECT COUNT(*) FROM mvcboard;
SELECT COUNT(*) FROM mvcboard WHERE title LIKE '%제목2%';

#게시물 목록 출력하기
#게시물은 항상 입력된 시간의 내림차순으로 정렬한다. 
SELECT * FROM mvcboard ORDER BY idx DESC;
#게시물 페이징 처리하기
#1페이지의 게시물
SELECT * FROM mvcboard ORDER BY idx DESC LIMIT 0, 2;
#2페이지의 게시물
SELECT * FROM mvcboard ORDER BY idx DESC LIMIT 2, 2;





			