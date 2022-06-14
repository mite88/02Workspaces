package model2.mvcboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;

public class MVCBoardDAO extends DBConnPool {
	public MVCBoardDAO() {
		super();
	}

	// 게시물갯수 카운터를 위한 메서드(순번출력용)
	public int selectCount(Map<String, Object> map) {
		// 카운터 변수
		int totalcount = 0;

		// 쿼리문작성
		String query = "select count(*) from mvcboard ";

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

	// 페이징 처리
	public List<MVCBoardDTO> selectListstPage(Map<String, Object> map) {
		List<MVCBoardDTO> bbs = new ArrayList<MVCBoardDTO>();

		/*
		 * 3개의 서브쿼리문으로 각페이지에출력한 게시판 목록을 출력하는 쿼리문 작성
		 */
		String query = "select * from (" + "    select Tb.*, rownum rNum from" + "        (select * from mvcboard ";

		// 검색어가 존재하는경우 추가
		if (map.get("searchWord") != null) {
			query += " where " + map.get("searchField") + " like '%" + map.get("searchWord") + "%'";
		}
		query += "        order by idx desc) Tb" + ")" + " where rNum between ? and ?";

		// 문자열 연결시 StringBuffer클래스 활용하면 유용함

		// query문 확인
		System.out.println("selectListstPage:" + query);

		try {
			psmt = con.prepareStatement(query);

			/*
			 * 인파라미터 설정 : jsp에서 구간을 계산하여 map컬렉션에 저장 및 전달
			 */
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());

			rs = psmt.executeQuery();

			// 1개 이상일 가능성이 높으니 while문함
			while (rs.next()) {
				// 하나의 레코드를 읽어 추출 후 dTO객체에 저장
				MVCBoardDTO dto = new MVCBoardDTO(); // DTO객체 생성

				// 각 맴버변수에 해당 컬럼을 매칭하여 데이터에 저장함
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));

				// List컬렉션에 추가함
				bbs.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 페이징 중 예외");
			e.printStackTrace();
		}

		return bbs;
	}

	// 글쓰기+첨부파일
	public int insertWrite(MVCBoardDTO dto) {
		int result = 0;// 입력결과 확인용변수

		try {
			String query = "insert into mvcboard(" + "idx, name, title, content, ofile, sfile, pass) " + "values( "
					+ "seq_board_num.NEXTVAL, ?, ?, ?, ?, ?, ?)";

			// query문 확인
			System.out.println("insertWrite:" + query);

			// 동적쿼리문 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			// 인파라미터 설정
			psmt.setString(1, dto.getName());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile()); // 원본파일명
			psmt.setString(5, dto.getSfile()); // 서버에 저장된 파일명
			psmt.setString(6, dto.getPass());
			// 쿼리문실행
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 입력 중 예외");
			e.printStackTrace();
		}
		return result;
	}

	// 게시물 조회
	public MVCBoardDTO selectView(String idx) {
		// 조회된 레코드르 DTO객체에 저장후 반환
		MVCBoardDTO dto = new MVCBoardDTO();
		// 작성자명을 위해 join문사용함
		String query = "select * from mvcboard where idx =?";

		// query문 확인
		System.out.println("selectView:" + query);

		try {
			// 쿼리실행을 위한 객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);

			psmt.setString(1, idx);
			rs = psmt.executeQuery();

			// 2개이상이 없기에 if문으로 했음
			if (rs.next()) {
				// DTO에 레코드 내용 추가
				dto.setIdx(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
			}
		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외");
			e.printStackTrace();
		}

		return dto;

	}

	// 조회수 증가
	public void updateVisitCount(String idx) {
		try {
			// 일련번호를 매개변수로 받아 조회수 1증가함
			String query = "update mvcboard set " + "visitcount = visitcount+1 where idx=?";

			// query문 확인
			System.out.println("updateVisitCount:" + query);

			psmt = con.prepareStatement(query);

			psmt.setString(1, idx);
			psmt.executeQuery();

		} catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외");
			e.printStackTrace();
		}
	}

	// 파일 다운로드
	public void downCountPlus(String idx) {
		try {
			// 일련번호를 매개변수로 받아 조회수 1증가함
			String query = "update mvcboard set " + "downcount = downcount+1 where idx=?";

			// query문 확인
			System.out.println("downCountPlus:" + query);

			psmt = con.prepareStatement(query);

			psmt.setString(1, idx);
			psmt.executeQuery();

		} catch (Exception e) {
			System.out.println("다운로드 수 증가 중 예외");
			e.printStackTrace();
		}
	}

	// 비번검증
	public boolean confirmPassword(String pass, String idx) {
		boolean isCorr = true;
		try {
			String sql = "select count(*) from mvcboard where pass = ? and idx = ?";

			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, idx);

			rs = psmt.executeQuery();
			rs.next();
			// 결과 없으면 false
			if (rs.getInt(1) == 0) {
				isCorr = false;
			}

		} catch (Exception e) {
			isCorr = false;
			e.printStackTrace();
		}

		return isCorr;
	}

	// 삭제하기
	public int deletePost(String idx) {
		int result = 0;

		try {
			String query = "delete from mvcboard where idx = ?";

			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);

			result = psmt.executeUpdate(); // 적용된행의갯수반환
		} catch (Exception e) {
			System.out.println("게시물 삭제 중 예외");
			e.printStackTrace();
		}
		return result;
	}

	// 수정하기
	public int updateEdit(MVCBoardDTO dto) {
		int result = 0;

		try {
			String query = "update mvcboard set " + "title=?, name=?, content=?, ofile=?, sfile=? "
					+ "where idx=? and pass=?";

			// query문 확인
			System.out.println("updateEdit:" + query);

			// 동적쿼리문 실행을 위한 prepared객체 생성
			psmt = con.prepareStatement(query);
			// 인파라미터 설정
			psmt.setString(1, dto.getTitle());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile());
			psmt.setString(5, dto.getSfile());
			psmt.setString(6, dto.getIdx());
			psmt.setString(7, dto.getPass());
			
			
			// 쿼리문실행
			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("게시물 수정 중 예외");
			e.printStackTrace();
		}

		return result;
	}

}
