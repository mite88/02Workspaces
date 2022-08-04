package com.ds.seat.vo;

import java.io.Serializable;
import java.sql.Date;

//공연예약정보 테이블
public class Seat_Show_Reservation implements Serializable{


	private static final long serialVersionUID = 1L;
	
	private int ssr_no=0; //고유번호
	private int ssr_price=0; //가격
	private String ssr_seat=null; //좌석번호
	private String ssr_payset=null;//결제완료여부(N,Y)
	private Date ssr_date=null;//예약일
	private int m_no=0; //회원 고유번호
	private Long show_no=0L; //공연정보 고유번호
	
	public Seat_Show_Reservation() {
		super();
	}
	
	public Seat_Show_Reservation(int ssr_no, int ssr_price, String ssr_seat, String ssr_payset, Date ssr_date, int m_no,
			Long show_no) {
		super();
		this.ssr_no = ssr_no;
		this.ssr_price = ssr_price;
		this.ssr_seat = ssr_seat;
		this.ssr_payset = ssr_payset;
		this.ssr_date = ssr_date;
		this.m_no = m_no;
		this.show_no = show_no;
	}



	public int getSsr_no() {
		return ssr_no;
	}



	public void setSsr_no(int ssr_no) {
		this.ssr_no = ssr_no;
	}



	public int getSsr_price() {
		return ssr_price;
	}



	public void setSsr_price(int ssr_price) {
		this.ssr_price = ssr_price;
	}



	public String getSsr_seat() {
		return ssr_seat;
	}



	public void setSsr_seat(String ssr_seat) {
		this.ssr_seat = ssr_seat;
	}



	public String getSsr_payset() {
		return ssr_payset;
	}



	public void setSsr_payset(String ssr_payset) {
		this.ssr_payset = ssr_payset;
	}



	public Date getSsr_date() {
		return ssr_date;
	}



	public void setSsr_date(Date ssr_date) {
		this.ssr_date = ssr_date;
	}



	public int getM_no() {
		return m_no;
	}



	public void setM_no(int m_no) {
		this.m_no = m_no;
	}



	public Long getShow_no() {
		return show_no;
	}



	public void setShow_no(Long show_no) {
		this.show_no = show_no;
	}



	@Override
	public String toString() {
		return "Seat_Show_Reservation [ssr_no=" + ssr_no + ", ssr_price=" + ssr_price + ", ssr_seat=" + ssr_seat
				+ ", ssr_payset=" + ssr_payset + ", ssr_date=" + ssr_date + ", m_no=" + m_no + ", show_no=" + show_no
				+ "]";
	}
	
	
	
	

}
