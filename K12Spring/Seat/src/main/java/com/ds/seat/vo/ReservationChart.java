package com.ds.seat.vo;

public class ReservationChart {
	private String title=null;//공연이름
	private String show_id_name=null;//hell이름
	private String type=null;//좌석
	private int showid=0; //공연장번호
	private int seatcount=0;//전체 좌석수
	private int seatsumcount=0;//예약한 좌석수
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getShow_id_name() {
		return show_id_name;
	}
	public void setShow_id_name(String show_id_name) {
		this.show_id_name = show_id_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getShowid() {
		return showid;
	}
	public void setShowid(int showid) {
		this.showid = showid;
	}
	public int getSeatcount() {
		return seatcount;
	}
	public void setSeatcount(int seatcount) {
		this.seatcount = seatcount;
	}
	public int getSeatsumcount() {
		return seatsumcount;
	}
	public void setSeatsumcount(int seatsumcount) {
		this.seatsumcount = seatsumcount;
	}
	@Override
	public String toString() {
		return "ReservationChart [title=" + title + ", show_id_name=" + show_id_name + ", type=" + type + ", showid="
				+ showid + ", seatcount=" + seatcount + ", seatsumcount=" + seatsumcount + "]";
	}
	
	
}
