package com.ds.seat.vo;

public class Question_Board {

	private int qb_no=0; //글번호
	private String qb_writer=null; //글작성자
	private String qb_title=null; //글제목
	private String qb_content=null; //글작성
	private String qb_date=null; //글쓴날짜
	private int qb_ref=0; //연관된 글 묶기용
	private int qb_restep=0; //순서
	private int qb_level=0; //레벨
	private int qb_remove=0; //삭제여부 삭제-1 기본-0
	
	public Question_Board() {
		super();
	}
	
	public Question_Board(int qb_no, String qb_writer, String qb_title, String qb_content) {
		super();
		this.qb_no = qb_no;
		this.qb_writer = qb_writer;
		this.qb_title = qb_title;
		this.qb_content = qb_content;
	}



	public int getqb_remove() {
		return qb_remove;
	}



	public void setqb_remove(int qb_remove) {
		this.qb_remove = qb_remove;
	}



	public int getQb_no() {
		return qb_no;
	}



	public void setQb_no(int qb_no) {
		this.qb_no = qb_no;
	}



	public String getQb_writer() {
		return qb_writer;
	}



	public void setQb_writer(String qb_writer) {
		this.qb_writer = qb_writer;
	}



	public String getQb_title() {
		return qb_title;
	}



	public void setQb_title(String qb_title) {
		this.qb_title = qb_title;
	}



	public String getQb_content() {
		return qb_content;
	}



	public void setQb_content(String qb_content) {
		this.qb_content = qb_content;
	}



	public String getQb_date() {
		return qb_date;
	}



	public void setQb_date(String qb_date) {
		this.qb_date = qb_date;
	}



	public int getQb_ref() {
		return qb_ref;
	}



	public void setQb_ref(int qb_ref) {
		this.qb_ref = qb_ref;
	}



	public int getQb_restep() {
		return qb_restep;
	}



	public void setQb_restep(int qb_restep) {
		this.qb_restep = qb_restep;
	}



	public int getQb_level() {
		return qb_level;
	}



	public void setQb_level(int qb_level) {
		this.qb_level = qb_level;
	}



	@Override
	public String toString() {
		return "Question_Board [qb_no=" + qb_no + ", qb_writer=" + qb_writer + ", qb_title=" + qb_title
				+ ", qb_content=" + qb_content + ", qb_date=" + qb_date + ", qb_ref=" + qb_ref + ", qb_restep="
				+ qb_restep + ", qb_level=" + qb_level + ", qb_remove=" + qb_remove + "]";
	}
	
	
}
