package com.books;

import java.sql.Timestamp;

public class BooksDTO {
	private long number;
	private String title;
	private Timestamp start;
	private Timestamp end;
	private String message;
	private int office_num; 
	
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
	 * @return the office_num
	 */
	public int getOffice_num() {
		return office_num;
	}
	/**
	 * @param office_num the office_num to set
	 */
	public void setOffice_num(int office_num) {
		this.office_num = office_num;
	}
	
	@Override
	public String toString() {
		String msg = number+"/"+title+"/"+start+"/"+end+"/"+message+"/"+office_num;
		return msg;
	}
	
}