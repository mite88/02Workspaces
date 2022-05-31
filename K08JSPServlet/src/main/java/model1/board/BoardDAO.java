package model1.board;

import java.util.*;
import javax.servlet.ServletContext;
import common.JDBConnect;

/**
 *  
 * 
 * @PackageName   : model1.board 
 * @FileName  : BoardDAO.java 
 * @작성일       : 2022. 5. 27.  
 * @작성자       : mite88
 * @프로그램설명 : model1 게시판 DTO클래스
 */
public class BoardDAO extends JDBConnect {

	// DAO클래스 생성자의 부모클래스의 생성자 호출로 인한 DB연결을 위한 생성자
	public BoardDAO(ServletContext application) {
		super(application);
	}

	// 게시물갯수 카운터를 위한 메서드(순번출력용)
	public int selectCount(Map<String, Object> map) {
		// 카운터 변수
		int totalcount = 0;

		// 쿼리문작성
		String query = "select count(*) from board ";

		// 검색어가 있는경우 쿼리문 추가함(조건문)
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%'";
		}

		// query문 확인
		System.out.println("selectCount:" + query);

		try {
			// (정적)쿼리문 실행
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next(); // 해당결과는 한행뿐이기 때문에 if문을 쓰지않음
			totalcount = rs.getInt(1); // 결과값 저장
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외");
			e.printStackTrace();
		}

		// 결과값 반환
		return totalcount;

	}

	// 게시물 목록출력용 메서드 - 순서보장, 2개이상이기에 List로 함
	public List<BoardDTO> selectList(Map<String, Object> map) {
		// 여기선 Vector썼음(보통은 ArrayList씀)
		List<BoardDTO> bbs = new Vector<BoardDTO>();

		// 쿼리문 작성
		String query = "select * from board ";

		// 검색어가 있는경우 쿼리문 추가함(조건문 + 최근글이 위로...)
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " " + " like '%" + map.get("searchWord") + "%'";
		}
		query += " order by num desc";

		// query문 확인
		System.out.println("selectList:" + query);

		try {
			// (동적)쿼리문 실행
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);

			// 1개 이상일 가능성이 높으니 while문함
			while (rs.next()) {
				// 하나의 레코드를 읽어 추출 후 dTO객체에 저장
				BoardDTO dto = new BoardDTO(); // DTO객체 생성

				// 각 맴버변수에 해당 컬럼을 매칭하여 데이터에 저장함
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));

				// List컬렉션에 추가함
				bbs.add(dto);
			}

		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외");
			e.printStackTrace();
		}
		// 컬렉션반환
		return bbs;

	}

	// 글쓰기
	public int insertWrite(BoardDTO dto) {
		int result = 0;// 입력결과 확인용변수

		try {
			String query = "insert into board(" + "num, title, content, id, visitcount) " + "values( "
					+ "seq_board_num.NEXTVAL, ? , ?, ?, 0)";

			// query문 확인
			System.out.println("insertWrite:" + query);

			// 동적쿼리문 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			// 인파라미터 설정
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getId());
			// 쿼리문실행
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외");
			e.printStackTrace();
		}
		return result;
	}

	// 게시물 조회
	public BoardDTO selectView(String num) {
		BoardDTO dto = new BoardDTO();
		// 작성자명을 위해 join문사용함
		String query = "select B.*, M.name " + "from board B inner join member M " + "on B.id = M.id " + "where num =?";

		// query문 확인
		System.out.println("selectView:" + query);

		try {
			psmt = con.prepareStatement(query);

			psmt.setString(1, num);
			rs = psmt.executeQuery();

			// 2개이상이 없기에 if문으로 했음
			if (rs.next()) {
				// DTO에 레코드 내용 추가
				dto.setNum(rs.getString(1));
				dto.setTitle(rs.getString(2));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString(6));
				dto.setName(rs.getString("name"));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외");
			e.printStackTrace();
		}

		return dto;

	}

	// 조회수 증가
	public void updateVisitCount(String num) {
		try {
			// 일련번호를 매개변수로 받아 조회수 1증가함
			String query = "update board set " + "visitcount = visitcount+1 where num=?";

			// query문 확인
			System.out.println("updateVisitCount:" + query);

			psmt = con.prepareStatement(query);

			psmt.setString(1, num);
			psmt.executeQuery();

		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외");
			e.printStackTrace();
		}
	}

	// 수정하기
	public int updateEdit(BoardDTO dto) {
		int result = 0;

		try {
			String query = "update board set " + "title=?, content=? " + "where num=?";

			// query문 확인
			System.out.println("updateEdit:" + query);

			// 동적쿼리문 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			// 인파라미터 설정
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getContent());
			psmt.setString(3, dto.getNum());
			// 쿼리문실행
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외");
			e.printStackTrace();
		}

		return result;
	}

	// 삭제하기
	public int deletePost(BoardDTO dto) {
		int result = 0;

		try {
			String query = "delete from board where num = ?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getNum());

			result = psmt.executeUpdate(); // 적용된행의갯수반환
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외");
			e.printStackTrace();
		}
		return result;
	}

	// 페이징 처리
	public List<BoardDTO> selectListstPage(Map<String, Object> map) {
		List<BoardDTO> bbs = new ArrayList<BoardDTO>();

		/*
		3개의 서브쿼리문으로 각페이지에출력한 게시판 목록을
		출력하는 쿼리문 작성 
		 */
		String query = "select * from (" 
		+ "    select Tb.*, rownum rNum from" 
				+ "        (select * from board ";

		// 검색어가 존재하는경우 추가
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") 
			+ " like '%" + map.get("searchWord") + "%'";
		}
		query += "        order by num desc) Tb" + ")" 
		+ " where rNum between ? and ?";

		// query문 확인
		System.out.println("selectListstPage:" + query);

		try {
			psmt = con.prepareStatement(query);

			/*인파라미터 설정 : 
			jsp에서 구간을 계산하여 map컬렉션에 저장 및 전달
			 */
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());

			rs = psmt.executeQuery();

			// 1개 이상일 가능성이 높으니 while문함
			while (rs.next()) {
				// 하나의 레코드를 읽어 추출 후 dTO객체에 저장
				BoardDTO dto = new BoardDTO(); // DTO객체 생성

				// 각 맴버변수에 해당 컬럼을 매칭하여 데이터에 저장함
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));

				// List컬렉션에 추가함
				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 페이징 중 예외");
			e.printStackTrace();
		}

		return bbs;
	}
}
