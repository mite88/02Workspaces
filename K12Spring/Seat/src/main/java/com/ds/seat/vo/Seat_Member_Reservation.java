package com.ds.seat.vo;

import java.io.Serializable;

public class Seat_Member_Reservation implements Serializable{
	

	private static final long serialVersionUID = 1L;
	
	private int ssr_no=0;
	private int ssr_price=0;
	private String ssr_date=null;
	private String ssr_payset=null;
	private String m_name=null;
	private Long show_no=0L;
	private String show_title=null;
	private String ssr_seat=null;
	private String show_startdate=null;
	private String show_enddate=null;
	
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
	public String getSsr_date() {
		return ssr_date;
	}
	public void setSsr_date(String ssr_date) {
		this.ssr_date = ssr_date;
	}
	public String getSsr_payset() {
		return ssr_payset;
	}
	public void setSsr_payset(String ssr_payset) {
		this.ssr_payset = ssr_payset;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public Long getShow_no() {
		return show_no;
	}
	public void setShow_no(Long show_no) {
		this.show_no = show_no;
	}
	public String getShow_title() {
		return show_title;
	}
	public void setShow_title(String show_title) {
		this.show_title = show_title;
	}
	public String getSsr_seat() {
		return ssr_seat;
	}
	public void setSsr_seat(String ssr_seat) {
		this.ssr_seat = ssr_seat;
	}
	public String getShow_startdate() {
		return show_startdate;
	}
	public void setShow_startdate(String show_startdate) {
		this.show_startdate = show_startdate;
	}
	public String getShow_enddate() {
		return show_enddate;
	}
	public void setShow_enddate(String show_enddate) {
		this.show_enddate = show_enddate;
	}
	@Override
	public String toString() {
		return "Seat_Member_Reservation [ssr_no=" + ssr_no + ", ssr_price=" + ssr_price + ", ssr_date=" + ssr_date
				+ ", ssr_payset=" + ssr_payset + ", m_name=" + m_name + ", show_no=" + show_no + ", show_title="
				+ show_title + ", ssr_seat=" + ssr_seat + ", show_startdate=" + show_startdate + ", show_enddate="
				+ show_enddate + "]";
	}
	
	
	
	
}
