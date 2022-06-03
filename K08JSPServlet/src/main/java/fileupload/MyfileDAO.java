package fileupload;

import java.util.*;

import common.DBConnPool;

//DB커넥션풀을 통한 연결
public class MyfileDAO extends DBConnPool{
	
	//파일 및 게시물 입력
	public int insertFile(MyfileDTO dto) {
		int applyResult = 0;
		try {
			String query = "insert into myfile( "
					+ "idx, name, title, cate, ofile, sfile) "
					+ "values( "
					+ "seq_board_num.nextval, ?, ?, ?, ?, ?)";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getCate());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			
			applyResult = psmt.executeUpdate();
		} catch (Exception e) {
			System.out.println("insert 중 예외 발생");
			e.printStackTrace();
		}
		
		return applyResult;
	}
	
	//레코드를 일련번호를 기준으로 내림차순 정렬
	public List<MyfileDTO> myFileList(){
		List<MyfileDTO> fileList = new Vector<MyfileDTO>();
		
		
		try {
			String query = "select * from myfile order by idx desc";
			
			psmt = con.prepareStatement(query);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				MyfileDTO dto = new MyfileDTO();
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setCate(rs.getString(4));
				dto.setOfile(rs.getString(5));
				dto.setSfile(rs.getString(6));
				dto.setPostdate(rs.getString(7));
				
				//DTO객체를 List컬렉션에 추가
				fileList.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("select 중 예외 발생");
			e.printStackTrace();
		}
		
		return fileList;
	}
	
}