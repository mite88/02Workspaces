package model1.board;

/** 
* @PackageName   : model1.board 
* @FileName  : BoardDTO.java 
* @작성일       : 2022. 5. 27.  
* @작성자       : mite88
* @프로그램설명 : model1 게시판 DAO클래스
*/
public class BoardDTO {
	//멤버변수(board컬럼명과 동일하게 생성)
	private String num;
	private String title;
	private String content;
	private String id;
	private java.sql.Date postdate;
	private String visitcount;
	
	//추후 작성자출력을 위한 멤버변수를 생성함
	
	//getter/setter메서드
	private String name;
	/**
	 * @return the num
	 */
	public String getNum() {
		return num;
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
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @return the postdate
	 */
	public java.sql.Date getPostdate() {
		return postdate;
	}
	/**
	 * @return the visitcount
	 */
	public String getVisitcount() {
		return visitcount;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param num the num to set
	 */
	public void setNum(String num) {
		this.num = num;
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
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @param postdate the postdate to set
	 */
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	/**
	 * @param visitcount the visitcount to set
	 */
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
}
