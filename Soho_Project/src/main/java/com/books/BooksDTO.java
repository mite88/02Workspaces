package com.books;

import java.sql.Timestamp;

public class BooksDTO {
	private long number;
	private String title;
	private Timestamp start;
	private Timestamp end;
	private String message;
	private String pay_type;
	private String user_id;
	private int office_num;
	
	private String o_name;

	/**
	 * @return the number
	 */
	public long getNumber() {
		return number;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @return the start
	 */
	public Timestamp getStart() {
		return start;
	}

	/**
	 * @return the end
	 */
	public Timestamp getEnd() {
		return end;
	}

	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}

	/**
	 * @return the pay_type
	 */
	public String getPay_type() {
		return pay_type;
	}

	/**
	 * @return the user_id
	 */
	public String getUser_id() {
		return user_id;
	}

	/**
	 * @return the office_num
	 */
	public int getOffice_num() {
		return office_num;
	}

	/**
	 * @return the o_name
	 */
	public String getO_name() {
		return o_name;
	}

	/**
	 * @param number the number to set
	 */
	public void setNumber(long number) {
		this.number = number;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @param start the start to set
	 */
	public void setStart(Timestamp start) {
		this.start = start;
	}

	/**
	 * @param end the end to set
	 */
	public void setEnd(Timestamp end) {
		this.end = end;
	}

	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}

	/**
	 * @param pay_type the pay_type to set
	 */
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}

	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	/**
	 * @param office_num the office_num to set
	 */
	public void setOffice_num(int office_num) {
		this.office_num = office_num;
	}

	/**
	 * @param o_name the office_name to set
	 */
	public void setO_name(String o_name) {
		this.o_name = o_name;
	}
	
}