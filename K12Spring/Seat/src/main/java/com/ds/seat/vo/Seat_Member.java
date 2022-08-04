package com.ds.seat.vo;

import java.io.Serializable;

import javax.persistence.*;
import javax.validation.constraints.*;

import org.hibernate.annotations.Entity;
import org.hibernate.validator.constraints.*;

public class Seat_Member implements Serializable{

	private static final long serialVersionUID = 1L;

	public int m_no=0; 
	public String m_date=null; //가입일
	public int m_reting=0;  //등급 (0-관리자 1-사용자)
	
	@NotNull(message="아이디를 입력해주세요.")
	@Size(min=4, max=10, message="아이디를 4~10자로 입력해주세요.")
	@Pattern(regexp = "^[A-Za-z0-9+]*$", message = "아이디는 숫자가 포함된 영문 대소문자로 입력해 주세요")
	public String m_id=null; //아이디
	
	@NotNull(message="비번을 입력해주세요.")
	@Size(min=6, max=12, message="비밀번호를 6~12자로 입력해주세요.")
	@Pattern(regexp = "^[A-Za-z0-9!@#$%]*$", message = "비밀 번호는 6~12자리로 숫자와 특수 문자가 포함된 영문자로 입력해 주세요")
	public String m_pw=null;  //비번

	@NotNull(message="이름을 입력해주세요.")
	@Pattern(regexp="\\S{2,6}", message="이름은 2~6자로 입력해주세요.") 
	public String m_name=null;  //이름

	@NotNull(message="전화번호를 입력해주세요.")
    @Pattern(regexp="^01(?:0|1|[6-9])-(?:\\d{3}|\\d{4})-\\d{4}$", message="전화번호 양식에 맞지 않습니다 예)000-0000-0000")
	public String m_tel=null;  //전화번호

	@Min(value=6, message="생년월일을 적어주세요 예)181010")
	public int m_jumin1=0; //주민등록번호앞자리 

    @NotBlank(message = "메일을 작성해주세요.")
    @Pattern(regexp="[A-Za-z0-9._%-+]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}", message="이메일 형식이 아닙니다.")
	public String m_email=null; //이메일
	
    @NotBlank(message="주소를 검색해주세요")
	public String m_zip=null; //우편번호
	
    @NotBlank(message="공백문자를 입력할 수 없습니다.")
	public String m_addr1=null;  //기본주소

    @NotBlank(message="상세주소를 적어주세요")
	public String m_addr2=null; //상세주소
	
	public Seat_Member() {
		super();
	}
	
	public Seat_Member(int m_no, String m_id, String m_pw, String m_name, String m_tel, int m_jumin1,
			String m_email, String m_zip, String m_addr1, String m_addr2, String m_date, int m_reting) {
		super();
		this.m_no = m_no;
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_tel = m_tel;
		this.m_jumin1 = m_jumin1;
		this.m_email = m_email;
		this.m_zip = m_zip;
		this.m_addr1 = m_addr1;
		this.m_addr2 = m_addr2;
		this.m_date = m_date;
		this.m_reting = m_reting;
	}
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public int getM_jumin1() {
		return m_jumin1;
	}
	public void setM_jumin1(int m_jumin1) {
		this.m_jumin1 = m_jumin1;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_zip() {
		return m_zip;
	}
	public void setM_zip(String m_zip) {
		this.m_zip = m_zip;
	}
	public String getM_addr1() {
		return m_addr1;
	}
	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}
	public String getM_addr2() {
		return m_addr2;
	}
	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}
	public String getM_date() {
		return m_date;
	}
	public void setM_date(String m_date) {
		this.m_date = m_date;
	}
	public int getM_reting() {
		return m_reting;
	}
	public void setM_reting(int m_reting) {
		this.m_reting = m_reting;
	}
	@Override
	public String toString() {
		return "Seat_Member [m_no=" + m_no + ", m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_tel=" + m_tel + ", m_jumin1=" + m_jumin1 + ", m_email=" + m_email + ", m_zip=" + m_zip
				+ ", m_addr1=" + m_addr1 + ", m_addr2=" + m_addr2 + ", m_date=" + m_date + ", m_reting=" + m_reting
				+ "]";
	}
	
	
	
	
}
