package com.contact;

import java.sql.Timestamp;
import java.util.Date;

public class ContactDTO {
	//멤버변수
		private int idx; 			//일련번호
		private int type;               //게시판타입
		private String name;			// 작성자명
		private String title;			//제목
		private String content;			//내용
		private java.sql.Date postdate;	//작성일
		private String ofile;			//원본파일명
		private String sfile;			//서버에 저장된 파일명
		private int downcount;			//다운로드 횟수
		private String pass;			//비밀번호
		private int visitcount;			//게시물 조회수
		/**
		 * @return the idx
		 */
		public int getIdx() {
			return idx;
		}
		/**
		 * @return the type
		 */
		public int getType() {
			return type;
		}
		/**
		 * @return the name
		 */
		public String getName() {
			return name;
		}
		/**
		 * @return the title
		 */
		public String getTitle() {
			return title;
		}
		/**
		 * @return the content
		 */
		public String getContent() {
			return content;
		}
		/**
		 * @return the postdate
		 */
		public java.sql.Date getPostdate() {
			return postdate;
		}
		/**
		 * @return the ofile
		 */
		public String getOfile() {
			return ofile;
		}
		/**
		 * @return the sfile
		 */
		public String getSfile() {
			return sfile;
		}
		/**
		 * @return the downcount
		 */
		public int getDowncount() {
			return downcount;
		}
		/**
		 * @return the pass
		 */
		public String getPass() {
			return pass;
		}
		/**
		 * @return the visitcount
		 */
		public int getVisitcount() {
			return visitcount;
		}
		/**
		 * @param idx the idx to set
		 */
		public void setIdx(int idx) {
			this.idx = idx;
		}
		/**
		 * @param type the type to set
		 */
		public void setType(int type) {
			this.type = type;
		}
		/**
		 * @param name the name to set
		 */
		public void setName(String name) {
			this.name = name;
		}
		/**
		 * @param title the title to set
		 */
		public void setTitle(String title) {
			this.title = title;
		}
		/**
		 * @param content the content to set
		 */
		public void setContent(String content) {
			this.content = content;
		}
		/**
		 * @param postdate the postdate to set
		 */
		public void setPostdate(java.sql.Date postdate) {
			this.postdate = postdate;
		}
		/**
		 * @param ofile the ofile to set
		 */
		public void setOfile(String ofile) {
			this.ofile = ofile;
		}
		/**
		 * @param sfile the sfile to set
		 */
		public void setSfile(String sfile) {
			this.sfile = sfile;
		}
		/**
		 * @param downcount the downcount to set
		 */
		public void setDowncount(int downcount) {
			this.downcount = downcount;
		}
		/**
		 * @param pass the pass to set
		 */
		public void setPass(String pass) {
			this.pass = pass;
		}
		/**
		 * @param visitcount the visitcount to set
		 */
		public void setVisitcount(int visitcount) {
			this.visitcount = visitcount;
		}
		
		
		
}