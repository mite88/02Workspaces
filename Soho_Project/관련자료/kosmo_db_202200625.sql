-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.8-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 kosmo_db.books 구조 내보내기
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `number` bigint(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `start` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `end` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `message` text DEFAULT NULL,
  `pay_type` varchar(50) DEFAULT 'N' COMMENT '입금여부',
  `user_id` varchar(18) NOT NULL,
  `office_num` int(10) NOT NULL DEFAULT 1,
  PRIMARY KEY (`number`),
  KEY `office_code_FK` (`office_num`) USING BTREE,
  KEY `user_id_FK` (`user_id`),
  CONSTRAINT `office_code_FK` FOREIGN KEY (`office_num`) REFERENCES `office` (`code`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_id_FK` FOREIGN KEY (`user_id`) REFERENCES `member` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='간단예약 테이블';

-- 테이블 데이터 kosmo_db.books:~4 rows (대략적) 내보내기
DELETE FROM `books`;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`number`, `title`, `start`, `end`, `message`, `pay_type`, `user_id`, `office_num`) VALUES
	(1656039901808, '테스트', '2022-06-24 13:13:46', '2022-11-17 23:59:59', 'ㅅㄷㄴㅅㄹㅇㄹㅇㄴㄹㄹ', 'Y', 'test11', 2),
	(1656040326055, '예약입니다', '2022-08-24 00:00:00', '2022-12-24 23:59:59', '111', 'N', 'admin', 3),
	(1656047954587, '예약', '2022-06-24 16:25:22', '2022-09-08 23:59:59', 'ㅅㄷㄴㅅㅇㄹㄴㅇㄹㅇㄴㄹ ㄹㄴㅇ', 'Y', 'admin', 3),
	(1656048815819, 'test', '2022-06-24 14:33:50', '2022-09-08 23:59:59', 'test', 'N', 'admin', 1);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- 테이블 kosmo_db.contact 구조 내보내기
DROP TABLE IF EXISTS `contact`;
CREATE TABLE IF NOT EXISTS `contact` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(2) NOT NULL DEFAULT 1,
  `name` varchar(50) NOT NULL,
  `title` varchar(200) NOT NULL,
  `content` varchar(2000) NOT NULL,
  `postdate` date NOT NULL DEFAULT current_timestamp(),
  `ofile` varchar(200) DEFAULT NULL,
  `sfile` varchar(30) DEFAULT NULL,
  `video_url` varchar(200) DEFAULT '' COMMENT '유튭주소',
  `downcount` int(5) NOT NULL DEFAULT 0,
  `pass` varchar(50) DEFAULT NULL,
  `visitcount` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 kosmo_db.contact:~5 rows (대략적) 내보내기
DELETE FROM `contact`;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
INSERT INTO `contact` (`idx`, `type`, `name`, `title`, `content`, `postdate`, `ofile`, `sfile`, `video_url`, `downcount`, `pass`, `visitcount`) VALUES
	(1, 1, '관리자', '공지입니다', '<P>공지입니다<BR> 안녕ㅇㅁㅇ/</p>', '2022-06-23', 'project-details-large.jpg', 'project-details-large.jpg', '', 0, '', 18),
	(2, 2, '관리자2', '공지2', '공지2', '2022-06-23', 'SAMPLE_1.MP3', '0011.MP3', '', 3, '', 26),
	(3, 2, '관리자2', '공지2', '공지2', '2022-06-23', NULL, NULL, 'https://www.youtube.com/embed/HHBsvKnCkwI', 0, '', 9),
	(4, 2, '관리자', '공지', '공지2', '2022-06-23', NULL, NULL, '', 0, '', 9),
	(5, 1, '관리자', '공지인가', '반가워요', '2022-06-23', NULL, NULL, '', 0, '', 3);
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;

-- 테이블 kosmo_db.member 구조 내보내기
DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `user_id` varchar(18) NOT NULL,
  `user_pw` varchar(20) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_phone` varchar(15) NOT NULL,
  `user_hoddy` varchar(50) NOT NULL,
  `user_job` varchar(50) NOT NULL,
  `user_info` varchar(2000) DEFAULT NULL,
  `megister_date` date NOT NULL DEFAULT current_timestamp(),
  `memberLevel` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 kosmo_db.member:~2 rows (대략적) 내보내기
DELETE FROM `member`;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`user_id`, `user_pw`, `user_name`, `user_email`, `user_phone`, `user_hoddy`, `user_job`, `user_info`, `megister_date`, `memberLevel`) VALUES
	('admin', 'admin', '관리자', 'admin@hanmail.net', '010-2222-1111', '캠핑, 영화, 독서', '교사', '안녕하세요 ㅇㅁㅇ/\r\n안녕하세요 ㅇㅁㅇ/', '2022-06-22', 'admin'),
	('test11', '1111', '테스트11', 'test11@naver.com', '010-1111-1212', '캠핑, 등산, 독서', '변호사', 'Thread를 올바르게 생성, 시작, 중단하는 방법(feat. daemon ...https://jeong-pro.tistory.com › ...\r\n2018. 2. 15. — 쓰레드를 생성하는 일반적인 방법으로 두 가지가 있다. 1. Thread 클래스를 상속받고 run()메소드를 오버라이딩해서 정의한 후 실행하는 방법. 2.\r\n누락된 검색어: 됩니다 ‎| 다음 정보가 포함되어야 합니다. 됩니다', '2022-06-22', 'vip');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 kosmo_db.office 구조 내보내기
DROP TABLE IF EXISTS `office`;
CREATE TABLE IF NOT EXISTS `office` (
  `code` int(11) NOT NULL AUTO_INCREMENT COMMENT '코드',
  `o_name` varchar(50) NOT NULL COMMENT '지점명',
  `o_bnumber` varchar(15) DEFAULT NULL COMMENT '사업자등록번호',
  `o_addr` varchar(150) DEFAULT NULL COMMENT '주소',
  `o_phone` varchar(15) NOT NULL COMMENT '회사번호',
  `o_fax` varchar(20) DEFAULT NULL COMMENT '회사팩스',
  `o_manage_name` varchar(15) NOT NULL COMMENT '매니져명',
  `o_manage_phone` varchar(15) NOT NULL COMMENT '매니져번호',
  `o_email` varchar(60) DEFAULT NULL COMMENT '회사및 매니져 이메일',
  `o_banknumber` varchar(15) NOT NULL COMMENT '계좌',
  `o_bankname` varchar(15) NOT NULL COMMENT '예금주',
  `o_img1` varchar(100) DEFAULT NULL COMMENT '회사이미지1',
  `o_img2` varchar(100) DEFAULT NULL COMMENT '회사이미지2',
  `o_content` longtext NOT NULL COMMENT '설명',
  `o_pay` longtext NOT NULL COMMENT '가격정보',
  `o_service` longtext NOT NULL COMMENT '서비스정보',
  `o_type` varchar(200) NOT NULL COMMENT '인실종류(type)',
  PRIMARY KEY (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='사무실정보';

-- 테이블 데이터 kosmo_db.office:~2 rows (대략적) 내보내기
DELETE FROM `office`;
/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` (`code`, `o_name`, `o_bnumber`, `o_addr`, `o_phone`, `o_fax`, `o_manage_name`, `o_manage_phone`, `o_email`, `o_banknumber`, `o_bankname`, `o_img1`, `o_img2`, `o_content`, `o_pay`, `o_service`, `o_type`) VALUES
	(1, '강남점', '332-87-01111', '서울특별시 강남구 대치동 921', '02-111-1111', '0502-111-1111', '매니져1', '010-1111-1111', 'manager1@test.com', '111111258320', '매니져1', '3.jpg', '1.png', '사업자등록을 위한 임대차계약 및 주소지 필요시 이용서비스입니다.\r\n역세권 10개 지점에서 사업자등록이 가능합니다.', '- 상주 고정 1인석 월 13만원 (부가세 별도)\r\n- [이벤트 특가] 1인실 20만원~, 2인실 25만원~ (부가세 별도)\r\n* 최소 계약기간 2개월부터\r\n* 무보증금 / 선납조건입니다.\r\n', '개인/법인 사업자등록\r\n우편물 수/발신 (발신시 유료)\r\n실사지원 (유료)\r\n다양한 업종 가능\r\n(의료기 판매업, 여행업, 인력파견업, 대부업 등 인허가 및 금융기관 실사 업종은 유선문의 요\r\n세무기장 지원 (파트너사)\r\n\r\n* 비상주사무실 계약시 방문하지 않고도 계약서를 받아보실 수 있습니다.\r\n* 대부분의 업종이 등록가능합니다. 인허가 필요업종의 경우 아래 연락처로 연락주세요.\r\n* 상주오피스가 필요하신 경우 아래로 연락주세요. (1~2인실 가능)', '1인실, 2인실, 6인실, 8인실'),
	(2, '용산점', '332-87-01112', '서울특별시 용산구 한강로3가 2-8', '070-1111-2345', '0502-258-8965', '용산미', '010-2323-4545', 'manager2@test.com', '121212124545', '00용산점', '1.png', '2.png', '사업자등록을 위한 임대차계약 및 주소지 필요시 이용서비스입니다.\r\n역세권 10개 지점에서 사업자등록이 가능합니다.', '- 상주 고정 1인석 월 13만원 (부가세 별도)\r\n- [이벤트 특가] 1인실 20만원~, 2인실 25만원~ (부가세 별도)\r\n* 최소 계약기간 2개월부터\r\n* 무보증금 / 선납조건입니다.\r\n', '개인/법인 사업자등록\r\n우편물 수/발신 (발신시 유료)\r\n실사지원 (유료)\r\n다양한 업종 가능\r\n(의료기 판매업, 여행업, 인력파견업, 대부업 등 인허가 및 금융기관 실사 업종은 유선문의 요\r\n세무기장 지원 (파트너사)\r\n\r\n* 비상주사무실 계약시 방문하지 않고도 계약서를 받아보실 수 있습니다.\r\n* 대부분의 업종이 등록가능합니다. 인허가 필요업종의 경우 아래 연락처로 연락주세요.\r\n* 상주오피스가 필요하신 경우 아래로 연락주세요. (1~2인실 가능)', '1인실, 2인실, 6인실, 8인실'),
	(3, '영등포구점', '332-87-01234', '서울특별시 영등포구 신길동 355-605', '070-1111-5698', '070-123-4567', '강영등', '010-2345-6789', 'zero1234@test.com', '789456123', '강영등', '1.png', '3.jpg', '사업자등록을 위한 임대차계약 및 주소지 필요시 이용서비스입니다.\r\n역세권 10개 지점에서 사업자등록이 가능합니다.', '- 상주 고정 1인석 월 13만원 (부가세 별도)\r\n- [이벤트 특가] 1인실 20만원~, 2인실 25만원~ (부가세 별도)\r\n* 최소 계약기간 2개월부터\r\n* 무보증금 / 선납조건입니다.\r\n', '개인/법인 사업자등록\r\n우편물 수/발신 (발신시 유료)\r\n실사지원 (유료)\r\n다양한 업종 가능\r\n(의료기 판매업, 여행업, 인력파견업, 대부업 등 인허가 및 금융기관 실사 업종은 유선문의 요\r\n세무기장 지원 (파트너사)\r\n\r\n* 비상주사무실 계약시 방문하지 않고도 계약서를 받아보실 수 있습니다.\r\n* 대부분의 업종이 등록가능합니다. 인허가 필요업종의 경우 아래 연락처로 연락주세요.\r\n* 상주오피스가 필요하신 경우 아래로 연락주세요. (1~2인실 가능)', '1인실, 2인실, 6인실, 8인실');
/*!40000 ALTER TABLE `office` ENABLE KEYS */;

-- 테이블 kosmo_db.tb_date 구조 내보내기
DROP TABLE IF EXISTS `tb_date`;
CREATE TABLE IF NOT EXISTS `tb_date` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `date1` date NOT NULL,
  `date2` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 kosmo_db.tb_date:~1 rows (대략적) 내보내기
DELETE FROM `tb_date`;
/*!40000 ALTER TABLE `tb_date` DISABLE KEYS */;
INSERT INTO `tb_date` (`idx`, `date1`, `date2`) VALUES
	(1, '2022-06-14', '2022-06-16 09:29:23');
/*!40000 ALTER TABLE `tb_date` ENABLE KEYS */;

-- 테이블 kosmo_db.tb_int 구조 내보내기
DROP TABLE IF EXISTS `tb_int`;
CREATE TABLE IF NOT EXISTS `tb_int` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `num1` tinyint(3) unsigned NOT NULL,
  `num2` smallint(6) NOT NULL,
  `num3` mediumint(9) DEFAULT 100,
  `num4` bigint(20) DEFAULT NULL,
  `fnum1` float(10,5) NOT NULL,
  `fnum2` double(20,10) DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 kosmo_db.tb_int:~2 rows (대략적) 내보내기
DELETE FROM `tb_int`;
/*!40000 ALTER TABLE `tb_int` DISABLE KEYS */;
INSERT INTO `tb_int` (`idx`, `num1`, `num2`, `num3`, `num4`, `fnum1`, `fnum2`) VALUES
	(1, 123, 12345, 1234567, 1234567890, 12345.12305, 1234567890.1234567000),
	(10, 123, 12345, 1234567, 1234567890, 12345.12305, 1234567890.1234567000);
/*!40000 ALTER TABLE `tb_int` ENABLE KEYS */;

-- 테이블 kosmo_db.tb_spec 구조 내보내기
DROP TABLE IF EXISTS `tb_spec`;
CREATE TABLE IF NOT EXISTS `tb_spec` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `spec1` enum('M','W','T') DEFAULT NULL,
  `spec2` set('A','B','C','D') DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 kosmo_db.tb_spec:~2 rows (대략적) 내보내기
DELETE FROM `tb_spec`;
/*!40000 ALTER TABLE `tb_spec` DISABLE KEYS */;
INSERT INTO `tb_spec` (`idx`, `spec1`, `spec2`) VALUES
	(1, 'W', 'A,B,C'),
	(2, NULL, 'C,D');
/*!40000 ALTER TABLE `tb_spec` ENABLE KEYS */;

-- 테이블 kosmo_db.tb_string 구조 내보내기
DROP TABLE IF EXISTS `tb_string`;
CREATE TABLE IF NOT EXISTS `tb_string` (
  `idx` int(11) NOT NULL AUTO_INCREMENT,
  `str1` varchar(30) NOT NULL,
  `str2` text DEFAULT NULL,
  PRIMARY KEY (`idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- 테이블 데이터 kosmo_db.tb_string:~1 rows (대략적) 내보내기
DELETE FROM `tb_string`;
/*!40000 ALTER TABLE `tb_string` DISABLE KEYS */;
INSERT INTO `tb_string` (`idx`, `str1`, `str2`) VALUES
	(2, '오라클이랑..', '동일하네요^^*');
/*!40000 ALTER TABLE `tb_string` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
