package membership;

/** 
* @PackageName   : membership 
* @FileName  : MemberDTO.java 
* @작성일       : 2022. 5. 27.  
* @작성자       : mite88
* @프로그램설명  
* DTO(Data Transfer Object)
* JSP와 Java파일간의 데이터 전달을 위한 객체로 자바빈 규약에 의해 제작
*/
public class MemberDTO {
	private String id;
	private String pass;
	private String name;
	private String regidate;
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @return the pass
	 */
	public String getPass() {
		return pass;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @return the regidate
	 */
	public String getRegidate() {
		return regidate;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @param pass the pass to set
	 */
	public void setPass(String pass) {
		this.pass = pass;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @param regidate the regidate to set
	 */
	public void setRegidate(String regidate) {
		this.regidate = regidate;
	}
	
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

}
