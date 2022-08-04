package com.ds.seat.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ds.seat.vo.Seat_Member;

public interface SeatMemberDAO {

	@Select({"SELECT * FROM  SEAT_MEMBER WHERE M_ID=#{m_id} AND "
			+ "M_PW=SHA1(#{m_pw}) AND M_RETING=0 "})
	public Seat_Member seatSelectMemberLogin(Seat_Member vo); //로그인 정보
	
	@Select({"SELECT COUNT(*) FROM  SEAT_MEMBER WHERE M_ID=#{id} AND M_RETING=0 "})
	public int seatSelectMemberLoginChk(@Param("id") String id); //관리인인지 확인용
	
	@Select({"SELECT * FROM SEAT_MEMBER ORDER BY M_NO DESC"})
	public List<Seat_Member> seatSelectMemberList(); //회원리스트
	
	@Select({"SELECT COUNT(*) FROM  SEAT_MEMBER WHERE M_DATE>= "

			+ "DATE_ADD(now(), interval -7 day) "})
	public int seatSelectMemberNum(); //최근회원수
	

	@Select({"SELECT * FROM  SEAT_MEMBER WHERE M_ID=#{m_id}"})
	public Seat_Member seatSelectMemberOne(String m_id);//로그인 정보
	
	//-------------------사용자 회원부분-------------------------------------
	
	@Select({"SELECT COUNT(*) FROM SEAT_MEMBER WHERE M_ID=#{m_id}"})
	public int seatSelectMemberidNum(String m_id); //최근회원수
	
	@Insert({"INSERT INTO SEAT_MEMBER " + 
			"(M_ID, M_PW, M_NAME,  M_TEL, M_JUMIN1, " + 
			"M_EMAIL, M_ZIP, M_ADDR1, M_ADDR2, M_DATE, M_RETING) " + 
			"VALUES"
			+ "(#{m_id}, SHA1(#{m_pw}), #{m_name}, #{m_tel}, #{m_jumin1}, "
			+ "#{m_email}, #{m_zip}, #{m_addr1}, #{m_addr2}, NOW(), 1)"})
	public int seatInsertMember(Seat_Member vo);//회원가입하기
	
	
	@Select({"SELECT * FROM  SEAT_MEMBER WHERE M_ID=#{m_id} AND "
			+ "M_PW=SHA1(#{m_pw})"})
	public Seat_Member seatSelectMemberLoginUse(Seat_Member vo); //로그인 정보
	
	@Update({"UPDATE SEAT_MEMBER SET M_PW=SHA1(#{m_pw}), M_NAME=#{m_name},"
			+" M_TeL=#{m_tel}, M_JUMIN1= #{m_jumin1},"
			+" M_EMAIL=#{m_email}, M_ZIP=#{m_zip}, "
			+" M_ADDR1=#{m_addr1}, M_ADDR2=#{m_addr2} WHERE M_ID=#{m_id}"})
	public int seatUpdateMember(Seat_Member vo);
}
