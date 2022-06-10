package com.member;

import java.util.Date;

public class MemberDTO {
	private String user_id; //아이디 최대 18자까지, 기본키
	private String user_pw; //비밀번호 최대 20자까지
	private String user_name; //이름
	private String user_email; //이메일
	private String user_phone; //휴대폰번호
	private String user_hoddy; //관심분야 ,로 구분
	private String user_job; //직업 ,로 구분
	private String user_info; //하고싶은말(선택사항)
	private Date megister_date; //가입일
	private String memberLevel; //회원등급(admin, user)
	/**
	 * @return the user_id
	 */
	public String getUser_id() {
		return user_id;
	}
	/**
	 * @return the user_pw
	 */
	public String getUser_pw() {
		return user_pw;
	}
	/**
	 * @return the user_name
	 */
	public String getUser_name() {
		return user_name;
	}
	/**
	 * @return the user_email
	 */
	public String getUser_email() {
		return user_email;
	}
	/**
	 * @return the user_phone
	 */
	public String getUser_phone() {
		return user_phone;
	}
	/**
	 * @return the user_hoddy
	 */
	public String getUser_hoddy() {
		return user_hoddy;
	}
	/**
	 * @return the user_job
	 */
	public String getUser_job() {
		return user_job;
	}
	/**
	 * @return the user_info
	 */
	public String getUser_info() {
		return user_info;
	}
	/**
	 * @return the megister_date
	 */
	public Date getMegister_date() {
		return megister_date;
	}
	/**
	 * @return the memberLevel
	 */
	public String getMemberLevel() {
		return memberLevel;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	/**
	 * @param user_pw the user_pw to set
	 */
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	/**
	 * @param user_email the user_email to set
	 */
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	/**
	 * @param user_phone the user_phone to set
	 */
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	/**
	 * @param user_hoddy the user_hoddy to set
	 */
	public void setUser_hoddy(String user_hoddy) {
		this.user_hoddy = user_hoddy;
	}
	/**
	 * @param user_job the user_job to set
	 */
	public void setUser_job(String user_job) {
		this.user_job = user_job;
	}
	/**
	 * @param user_info the user_info to set
	 */
	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}
	/**
	 * @param megister_date the megister_date to set
	 */
	public void setMegister_date(Date megister_date) {
		this.megister_date = megister_date;
	}
	/**
	 * @param memberLevel the memberLevel to set
	 */
	public void setMemberLevel(String memberLevel) {
		this.memberLevel = memberLevel;
	}
	
	
}
