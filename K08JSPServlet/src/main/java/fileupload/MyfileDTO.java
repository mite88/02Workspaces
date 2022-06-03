package fileupload;

public class MyfileDTO{
	
	private String idx; //일련번호
	private String name;  //작성자명
	private String title; //제목
	private String cate;  //카테고리
	private String ofile; //원본파일
	private String sfile;  //저장파일
	private String postdate; //저장일
	/**
	 * @return the idx
	 */
	public String getIdx() {
		return idx;
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
	 * @return the cate
	 */
	public String getCate() {
		return cate;
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
	 * @return the postdate
	 */
	public String getPostdate() {
		return postdate;
	}
	/**
	 * @param idx the idx to set
	 */
	public void setIdx(String idx) {
		this.idx = idx;
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
	 * @param cate the cate to set
	 */
	public void setCate(String cate) {
		this.cate = cate;
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
	 * @param postdate the postdate to set
	 */
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
}