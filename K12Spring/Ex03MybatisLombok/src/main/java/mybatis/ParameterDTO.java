package mybatis;

public class ParameterDTO {

	//멤버변수1
	private String user_id;//사용자 아이디
	private String board_idx;//게시물 일련번호
	
	
	//멤버변수2 : 게시판 Ver02에서 검색기능을 위해 추가한다.
	//검색어 처리를 위한 멤버변수
	private String searchField;//검색할 필드명
	private String searchTxt;//검색어
	
	//게시물의 시작, 종료 구간 설정값
	//select구간을 위한 멤버변수
	private int start;//select의 시작
	private int end;//끝
	
	//생성자는 추가하지 않고, getter/setter메서드 생성
	public String getSearchField() {
		return searchField;
	}
	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}
	public String getSearchTxt() {
		return searchTxt;
	}
	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(String board_idx) {
		this.board_idx = board_idx;
	}
}
