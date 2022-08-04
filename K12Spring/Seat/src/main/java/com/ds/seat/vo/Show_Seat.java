package com.ds.seat.vo;

public class Show_Seat {
	private String ss_no=null;
	private Long show_no=0L;
	private String ss_seattype=null;
	private int ss_seatpay=0;
	private int ss_seatrow=0;
	private int ss_seatcol=0;
	private int ss_seatcount=0;
	
	public Show_Seat() {
		super();
	}

	
	public Show_Seat(String ss_no, Long show_no, String ss_seattype, int ss_seatpay, int ss_seatrow, int ss_seatcol,
			int ss_seatcount) {
		super();
		this.ss_no = ss_no;
		this.show_no = show_no;
		this.ss_seattype = ss_seattype;
		this.ss_seatpay = ss_seatpay;
		this.ss_seatrow = ss_seatrow;
		this.ss_seatcol = ss_seatcol;
		this.ss_seatcount = ss_seatcount;
	}


	public int getSs_seatcount() {
		return ss_seatcount;
	}


	public void setSs_seatcount(int ss_seatcount) {
		this.ss_seatcount = ss_seatcount;
	}


	public String getSs_no() {
		return ss_no;
	}



	public void setSs_no(String ss_no) {
		this.ss_no = ss_no;
	}



	public Long getShow_no() {
		return show_no;
	}



	public void setShow_no(Long show_no) {
		this.show_no = show_no;
	}



	public String getSs_seattype() {
		return ss_seattype;
	}



	public void setSs_seattype(String ss_seattype) {
		this.ss_seattype = ss_seattype;
	}



	public int getSs_seatpay() {
		return ss_seatpay;
	}



	public void setSs_seatpay(int ss_seatpay) {
		this.ss_seatpay = ss_seatpay;
	}



	public int getSs_seatrow() {
		return ss_seatrow;
	}



	public void setSs_seatrow(int ss_seatrow) {
		this.ss_seatrow = ss_seatrow;
	}



	public int getSs_seatcol() {
		return ss_seatcol;
	}



	public void setSs_seatcol(int ss_seatcol) {
		this.ss_seatcol = ss_seatcol;
	}



	@Override
	public String toString() {
		return "Show_Seat [ss_no=" + ss_no + ", show_no=" + show_no + ", ss_seattype=" + ss_seattype + ", ss_seatpay="
				+ ss_seatpay + ", ss_seatrow=" + ss_seatrow + ", ss_seatcol=" + ss_seatcol + ", ss_seatcount="
				+ ss_seatcount + "]";
	}

	
}
