package mybatis;

import java.util.ArrayList;

import lombok.Data;
@Data
public class ParameterDTO {

	private String num;//사용자 아이디
	private String searchField;//검색할 필드명
	private ArrayList<String> searchTxt;//검색어
	private int start;
	private int end;
	
}
