package com.ds.seat.vo;

public class Show_Hell {

	public int show_id=0;
	public String show_id_name=null;
	
	public Show_Hell() {
		super();
	}
	
	public Show_Hell(int show_id, String show_id_name) {
		super();
		this.show_id = show_id;
		this.show_id_name = show_id_name;
	}

	public int getShow_id() {
		return show_id;
	}

	public void setShow_id(int show_id) {
		this.show_id = show_id;
	}

	public String getShow_id_name() {
		return show_id_name;
	}

	public void setShow_id_name(String show_id_name) {
		this.show_id_name = show_id_name;
	}

	@Override
	public String toString() {
		return "Show_Hell [show_id=" + show_id + ", show_id_name=" + show_id_name + "]";
	}
	
	
}
