package com.contact;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class ContactDAO extends DBConnPool {

	// 생성자의 super()을 통해 커넥션풀을 활성화 시켜줍시다
	public ContactDAO() {
		super();
	}

	//Contact테이블의 게시물의 갯수를 카운트 하여 반환한다.
		//목록의 페이징 처리나 게시물의 가상번호 부여에 사용한다.
		public int selectCount(Map<String, Object> map) {
			int totalCount = 0;
			String query = "SELECT COUNT(*) FROM contact ";

			if(map.get("searchWord") != null) {
				query += " WHERE " + map.get("searchField")
						+ " LIKE '%" + map.get("searchWord")+ "%' ";
				
				if(map.get("type") != null  )
				{
					query += " and TYPE="+map.get("type");
					
				}
				
			}else {
				if(map.get("type") != null  )
				{
					query += " where TYPE="+map.get("type");
					
				}
			}
			
			
			try {
				stmt = con.createStatement();
				rs = stmt.executeQuery(query);
				rs.next();
				totalCount = rs.getInt(1);
			}
			catch(Exception e) {
				System.out.println("게시물 카운트중 예외 발생");
				e.printStackTrace();
			}
			
			return totalCount;
		}
		

		/*
		모델 1 방식에서는 board테이블 및 BoardDTO클래스를 사용했지만
		모델 2 방식에서는 Contact테이블 및 ContactDTO클래스를 사용하므로
		해당 코드만 수정하면 된다.
		
		모델2 방식의 게시판 목록에 대한 페이징 처리 쿼리문 실행
		 */
		public List<ContactDTO> selectListPage(Map<String, Object> map){
			List<ContactDTO> board = new Vector<ContactDTO>();
			
			System.out.println("``"+map.get("type"));

			String query = " " 
						+ " SELECT * FROM contact ";

			if(map.get("searchWord") != null) {
				query += " WHERE " + map.get("searchField")
						+ " LIKE '%" + map.get("searchWord")+ "%' ";
				
				if(map.get("type") != null  )
				{
					query += " and TYPE="+map.get("type");
					
				}
				
			}else {
				if(map.get("type") != null  )
				{
					query += " where TYPE="+map.get("type");
					
				}
			}
			
			query += "	ORDER BY idx DESC LIMIT ?, ?";
			System.out.println("쿼리문=" + query);

			
			try {
				psmt = con.prepareStatement(query);
				//페이지 스타트, 엔드 값 얻어오기
				/*
				setString()으로 인파라미터를 설정하면 문자형이 되므로 값 양쪽에 
				싱글쿼테이션이 자동으로 삽입된다. 여기서는 정수값을 전달해야
				하므로 setInt()를 사용하고, 인수로 전달되는 변수를 정수로 변경한다.
				 */
				psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
				psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
				rs = psmt.executeQuery();
				
				while(rs.next()) {
					//테이블이 변경되었으므로 저장하는 부분은 수정이 필요함..
					ContactDTO dto = new ContactDTO();
					
					dto.setIdx(rs.getInt(1));
					dto.setType(rs.getInt(2));
					dto.setName(rs.getString(3));
					dto.setTitle(rs.getString(4));
					dto.setContent(rs.getString(5));
					dto.setPostdate(rs.getDate(6));
					dto.setOfile(rs.getString(7));
					dto.setSfile(rs.getString(8));
					dto.setVideo_url(rs.getString(9));
					dto.setDowncount(rs.getInt(10));
					dto.setPass(rs.getString(11));
					dto.setVisitcount(rs.getInt(12));

					board.add(dto);
				}
			}
			catch(Exception e) {
				System.out.println("게시물 조회 중 예외 발생");
				e.printStackTrace();
			}
			return board;
		}
		
		//글쓰기 처리시 첨부파일까지 함께 입력
		public int insertWrite(ContactDTO dto) {
			int result= 0;
			try {
				/*
				컬럼설명
				ofile: 원본 파일명
				sfile: 서버에 저장된 파일명
				pass: 비회원제 게시판이므로 수정, 삭제를 위한 인증에 사용됨
				
				MariaDB에서는 시퀀스 대신 자동증가 컬럼인 auto_increment를 사용한다.
				따라서 insert쿼리 작성시 pk로 지정된 컬럼은 제외시키는 것이 좋다.
				default값이 입력되듯 자동증가값이 자동으로 입력된다.
				 */
				String query = "INSERT INTO contact ( "
								+ " name, type, title, content, ofile, sfile, video_url, pass) "
								+ " VALUES ( "
								+ " ?,?,?,?,?,?,?,?)";
				
				
				
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getName());
				psmt.setInt(2, dto.getType());
				psmt.setString(3, dto.getTitle());
				psmt.setString(4, dto.getContent());
				psmt.setString(5, dto.getOfile());
				psmt.setString(6, dto.getSfile());
				psmt.setString(7, dto.getVideo_url());
				psmt.setString(8, dto.getPass());
				System.out.println(query);
				result = psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("게시물 입력 중 예외발생");
				e.printStackTrace();
			}
			return result;
		}
		
		//매개변수로 전달된 일련번호(idx)를 통해 하나의 레코드 조회
		public ContactDTO selectView(int idx) {
			
			//조회된 레코드를 DTO객체 저장한 후 반환한다.
			ContactDTO dto = new ContactDTO();
			//인파라미터가 있는 쿼리문 작성
			String query = "SELECT * FROM contact WHERE idx=?";
			try {
				//쿼리실행을 위한 객체생성 및 인파라미터 설정
				psmt = con.prepareStatement(query);
				psmt.setInt(1, idx);
				rs = psmt.executeQuery();
				
				//조회된 레코드가 있을 때 DTO객체에 각 컬럼값을 저장한다.
				if(rs.next()) {
					dto.setIdx(rs.getInt(1));
					dto.setType(rs.getInt(2));
					dto.setName(rs.getString(3));
					dto.setTitle(rs.getString(4));
					dto.setContent(rs.getString(5));
					dto.setPostdate(rs.getDate(6));
					dto.setOfile(rs.getString(7));
					dto.setSfile(rs.getString(8));
					dto.setVideo_url(rs.getString(9));
					dto.setDowncount(rs.getInt(10));
					dto.setPass(rs.getString(11));
					dto.setVisitcount(rs.getInt(12));
				}
				
			}
			catch(Exception e) {
				System.out.println("게시물 상세보기 중 예외 발생");
				e.printStackTrace();
			}
			return dto;
		}
		
		//주어진 일련번호에 해당하는 게시물의 조회수를 1 증가시킨다.
		public void updateVisitCount(int idx) {
			String query = "UPDATE contact SET"
						+" visitcount=visitcount+1 "
						+" WHERE idx=?";
			try {
				psmt = con.prepareStatement(query);
				psmt.setInt(1, idx);
				psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("게시물 조회수 증가 중 예외 발생");
				e.printStackTrace();
			}
		}
		
		//다운로드 수 증가
		public void downCountPlus(String idx) {
			String sql = "UPDATE contact SET "
						+" downcount=downcount+1 "
						+" WHERE idx=? ";
			try {
				psmt = con.prepareStatement(sql);
				psmt.setString(1, idx);
				psmt.executeUpdate();
			}
			catch(Exception e) {}
		}
		
		//수정/삭제전 해당 게시물의 패스워드를 검증한다.
		//즉, 게시물의 일련번호와 패스워드를 통해 조건에 부합하는 레코드가 있는지 확인한다.
		public boolean confirmPassword(String pass, int idx) {
			boolean isCorr = true;
			try {
				String sql = "SELECT COUNT(*) FROM contact WHERE pass=? AND idx=?";
				psmt = con.prepareStatement(sql);
				psmt.setString(1, pass);
				psmt.setInt(2, idx);
				rs = psmt.executeQuery();
				
				/*
				select문에 count()함수를 사용하는 경우 조건(where 절)에 만족하는 레코드가
				없을 때는 0, 만족하는 레코드가 있을떄는 1이상의 정수값이 반환된다.
				즉 어떤 경우에도 결과값이 있으므로 next() 호출시 if문이 필요하지 않다.
				 */
				rs.next();
				
				/*
				if(rs.next())
					=> 일반적인 select문을 사용하는 경우에 1개의 레코드만 반환될때 사용한다.
					주로 일련번호를 조건으로 추가하는 경우인데, 만족하는 레코드가 없다면
					next()를 사용할 때 에러가 발생된다.
				while(rs.next())
					=>select의 결과가 2개 이상일때 사용된다. 주로 게시판의 목록과 같이
					여러개의 레코드가 반환되는 경우에 사용한다.
				 */
				
				//일치하는 결과가 없는 경우 false를 반환한다.
				if(rs.getInt(1) == 0) {
					isCorr = false;
				}
				
			}
			catch(Exception e) {
				//예외가 발생하면 확인이 안된것이므로 이때도 false를 반환한다.
				isCorr = false;
				e.printStackTrace();
			}
			//검증이 완료되었을때만 true를 반환한다.
			return isCorr;
		}
		
		//게시물 삭제하기
		public int deletePost(int idx) {
			int result = 0;
			try {
				String query = "DELETE FROM contact WHERE idx=?";
				psmt = con.prepareStatement(query);
				psmt.setInt(1, idx);
				result= psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("게시물 삭제 중 예외 발생");
			}
			return result;
		}
		
		//게시물 수정처리
		public int updatePost(ContactDTO dto) {
			int result = 0;
			
			try {
				//update쿼리문 작성
				String query = "UPDATE contact "
							+ " SET type=?, title=?, name=?, content=?, ofile=?, sfile=?, video_url=? "
							+ " WHERE idx=?";
				//동적쿼리문 실행을 위해 prepared객체 생성 및 인파라미터 설정
				psmt = con.prepareStatement(query);
				psmt.setInt(1, dto.getType());
				psmt.setString(2, dto.getTitle());
				psmt.setString(3, dto.getName());
				psmt.setString(4, dto.getContent());
				psmt.setString(5, dto.getOfile());
				psmt.setString(6, dto.getSfile());
				psmt.setString(7, dto.getVideo_url());
				psmt.setInt(8, dto.getIdx());
				
				//쿼리 실행 및 결과 반환(update된 행의 갯수)
				result = psmt.executeUpdate();
			}
			catch(Exception e) {
				System.out.println("게시물 수정 중 예외 발생");
				e.printStackTrace();
			}
			
			
			return result;
		}

}