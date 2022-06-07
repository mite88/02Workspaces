package model2.mvcboard;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import common.DBConnPool;
import fileupload.MyfileDTO;
import model1.board.BoardDTO;

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
}
