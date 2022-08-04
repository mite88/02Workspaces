package com.ds.seat.vo;

import java.io.Serializable;

public class Seat_Show implements Serializable{

	private static final long serialVersionUID = 1L;
	
	public long show_no=0;
	public String show_title=null;
	public String show_content=null;
	public String show_img1=null; 
	public String show_img2=null; 
	public String show_startdate=null;
	public String show_enddate=null;
	public int show_id=0;
	
	public Seat_Show() {
		super();
	}
	
	
	public Seat_Show(long show_no, String show_title, String show_content, String show_img1, String show_img2,
			String show_startdate, String show_enddate, int show_id) {
		super();
		this.show_no = show_no;
		this.show_title = show_title;
		this.show_content = show_content;
		this.show_img1 = show_img1;
		this.show_img2 = show_img2;
		this.show_startdate = show_startdate;
		this.show_enddate = show_enddate;
		this.show_id = show_id;
	}

	public int getShow_id() {
		return show_id;
	}

	public void setShow_id(int show_id) {
		this.show_id = show_id;
	}

	
	public String getShow_img1() {
		return show_img1;
	}
	public void setShow_img1(String show_img1) {
		this.show_img1 = show_img1;
	}
	public String getShow_img2() {
		return show_img2;
	}
	public void setShow_img2(String show_img2) {
		this.show_img2 = show_img2;
	}
	public long getShow_no() {
		return show_no;
	}
	public void setShow_no(long show_no) {
		this.show_no = show_no;
	}
	public String getShow_title() {
		return show_title;
	}
	public void setShow_title(String show_title) {
		this.show_title = show_title;
	}
	public String getShow_content() {
		return show_content;
	}
	public void setShow_content(String show_content) {
		this.show_content = show_content;
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
		return "Seat_Show [show_no=" + show_no + ", show_title=" + show_title + ", show_content=" + show_content
				+ ", show_img1=" + show_img1 + ", show_img2=" + show_img2 + ", show_startdate=" + show_startdate
				+ ", show_enddate=" + show_enddate + ", show_id=" + show_id + "]";
	}

	
	
	
}
