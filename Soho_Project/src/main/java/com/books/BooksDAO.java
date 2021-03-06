package com.books;

import java.sql.*;
import java.util.*;
import java.util.Date;

import common.DBConnPool;

public class BooksDAO extends DBConnPool {

	// 생성자의 super()을 통해 커넥션풀을 활성화 시켜줍시다
	public BooksDAO() {
		super();
	}


	// 예약정보
	public List<BooksDTO> BookLists(Map<String, Object> map, String s, String e, int offilce_code) {
		List<BooksDTO> bbs = new ArrayList<BooksDTO>();
		

		try {
			
			/*
			 * select * from books where  (START <= DATE_ADD('2022-10-09 00:00:00.0' , INTERVAL 1 DAY))  
			and  (END < DATE_ADD('2022-12-09 00:00:00.0' , INTERVAL 1 DAY) or END >= '2022-12-28 23:59:59.999') 

			 * */
			// 아이디가 맞는지 확인용
			String sql = "SELECT b.*, o.o_name "
					+ " FROM books b INNER JOIN office o "
					+ " ON b.office_num = o.code ";
			//sql+= " start between '"+Timestamp.valueOf(s+" 00:00:00.0")+"' and '"+Timestamp.valueOf(e+" 23:59:59.999")+"' ";
			sql +=" where (start <= DATE_ADD('"+Timestamp.valueOf(e+" 00:00:00.0")+"' , INTERVAL 1 DAY) ) ";
			sql +=" and ";
			sql +=" (END < DATE_ADD('"+Timestamp.valueOf(e+" 00:00:00.0")+"' , INTERVAL 1 DAY)"
					+ " or END >= '"+Timestamp.valueOf(s+" 23:59:59.999")+"') "
					+ " and pay_type='Y'";
			if(offilce_code != 0) {
				sql+= " and office_num = "+offilce_code;

			}

			System.out.println(sql);
			
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				BooksDTO dto = new BooksDTO(); // DTO객체 생성
				
				dto.setNumber(rs.getLong(1));
				dto.setTitle(rs.getString(2));
				dto.setStart(rs.getTimestamp(3));
				dto.setEnd(rs.getTimestamp(4));
				dto.setMessage(rs.getString(5));
				dto.setPay_type(rs.getString(6));
				dto.setUser_id(rs.getString(7));
				dto.setOffice_num(rs.getInt(8));
				dto.setO_name(rs.getString(9));
				
				//System.out.println(rs.getString(9));
				
				bbs.add(dto);
			}

		} catch (Exception e2) {
			System.out.println("예약에러" + e2.getMessage());
			e2.getStackTrace();

		}

		return bbs;
	}
	
	//게시물수1
	public int selectCount(Map<String, Object> map, String user_id) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM books ";
		query += "where user_id = '"+user_id+"'";
		
		
		System.out.println(query);

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("카운트중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	
	//게시물수2
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM books ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' " ;
		} 
		
		System.out.println(query);

		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		catch(Exception e) {
			System.out.println("카운트중 예외 발생");
			e.printStackTrace();
		}
		
		return totalCount;
	}
	
	// 예약등록
	public int BookCreate(BooksDTO Dto) {
		int result = 0;

		try {
			String sql = "insert into books (number, title, start, end, message, user_id, office_num) values" + "(?, ?, ?, ?, ?, ?, ?)";

			// query문 확인
			System.out.println("BookInsert:" + sql);

			psmt = con.prepareStatement(sql);

			psmt.setLong(1, new Date().getTime());
			psmt.setString(2, Dto.getTitle());
			psmt.setTimestamp(3, Dto.getStart());
			psmt.setTimestamp(4, Dto.getEnd());
			psmt.setString(5, Dto.getMessage());
			psmt.setString(6, Dto.getUser_id());
			psmt.setInt(7, Dto.getOffice_num());

			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("예약등록에러" + e.getMessage());
		}
		return result;
	}

	//예약예약확인용 - 사무실정보랑 join - 확인용
	public List<BooksDTO> BookUser_Lists(Map<String, Object> map, String user_id, int offilce_code) {
		
		List<BooksDTO> bbs = new ArrayList<BooksDTO>();
		
		try {

			// 아이디가 맞는지 확인용
			String sql= "SELECT b.*, o.o_name "
					+ " FROM books b INNER JOIN office o "
					+ " ON b.office_num = o.code ";
			
			if(user_id != "") {
				
				if(offilce_code != 0 ) {
					sql+= " where office_num = "+offilce_code;
					sql+= " and user_id = '"+user_id+"'";

				}
				else {
					sql+= " where user_id = '"+user_id+"'";
				}
				sql += "	ORDER BY number DESC LIMIT ?, ?";

			}
			

			psmt = con.prepareStatement(sql);
			//페이지 스타트, 엔드 값 얻어오기
			/*
			setString()으로 인파라미터를 설정하면 문자형이 되므로 값 양쪽에 
			싱글쿼테이션이 자동으로 삽입된다. 여기서는 정수값을 전달해야
			하므로 setInt()를 사용하고, 인수로 전달되는 변수를 정수로 변경한다.
			 */
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();

			while (rs.next()) {
				BooksDTO dto = new BooksDTO(); // DTO객체 생성
				
				dto.setNumber(rs.getLong(1));
				dto.setTitle(rs.getString(2));
				dto.setStart(rs.getTimestamp(3));
				dto.setEnd(rs.getTimestamp(4));
				dto.setMessage(rs.getString(5));
				dto.setPay_type(rs.getString(6));
				dto.setUser_id(rs.getString(7));
				dto.setOffice_num(rs.getInt(8));
				dto.setO_name(rs.getString(9));
				
				bbs.add(dto);
			}

		} catch (Exception e2) {
			System.out.println("조회에러" + e2.getMessage());
			e2.getStackTrace();

		}

		return bbs;
	}
	
	
	//예약예약확인용 - 사무실정보랑 join - 전체용
	public List<BooksDTO> BookUser_Lists2(Map<String, Object> map) {
		
		List<BooksDTO> bbs = new ArrayList<BooksDTO>();
		
		try {

			// 아이디가 맞는지 확인용
			String sql= "SELECT b.*, o.o_name "
					+ " FROM books b INNER JOIN office o "
					+ " ON b.office_num = o.code ";
			
			if (map.get("searchWord") != null) {
				sql += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
			}
			sql += " ORDER BY number DESC LIMIT ?, ?";

			System.out.println("BookUser_Lists2"+sql);
			

			psmt = con.prepareStatement(sql);
			//페이지 스타트, 엔드 값 얻어오기
			/*
			setString()으로 인파라미터를 설정하면 문자형이 되므로 값 양쪽에 
			싱글쿼테이션이 자동으로 삽입된다. 여기서는 정수값을 전달해야
			하므로 setInt()를 사용하고, 인수로 전달되는 변수를 정수로 변경한다.
			 */
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();

			while (rs.next()) {
				BooksDTO dto = new BooksDTO(); // DTO객체 생성
				
				dto.setNumber(rs.getLong(1));
				dto.setTitle(rs.getString(2));
				dto.setStart(rs.getTimestamp(3));
				dto.setEnd(rs.getTimestamp(4));
				dto.setMessage(rs.getString(5));
				dto.setPay_type(rs.getString(6));
				dto.setUser_id(rs.getString(7));
				dto.setOffice_num(rs.getInt(8));
				dto.setO_name(rs.getString(9));
				
				bbs.add(dto);
			}

		} catch (Exception e2) {
			System.out.println("조회에러" + e2.getMessage());
			e2.getStackTrace();

		}

		return bbs;
	}
	
	// 예약수정
	public int BooksUpdate(BooksDTO mDto) {
		int result = 0;

		try {
			/*
			 * 예약수정시 비밀번호를 입력하지 않는 경우를 대비하여 작성했습니다.
			 */
			String sql = "update books set ";
			sql += " title=?, start=?,  end=?, "
				+ "message=?, pay_type=?, user_id=?, office_num=? ";
			sql += "where number=?";

			// query문 확인
			System.out.println("booksUpdate:" + sql);

			psmt = con.prepareStatement(sql);

			psmt.setString(1, mDto.getTitle());
			psmt.setTimestamp(2, mDto.getStart());
			psmt.setTimestamp(3, mDto.getEnd());
			psmt.setString(4, mDto.getMessage());
			psmt.setString(5, mDto.getPay_type());
			psmt.setString(6, mDto.getUser_id());
			psmt.setInt(7, mDto.getOffice_num());
			
			psmt.setLong(8, mDto.getNumber());

			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("예약수정에러" + e.getMessage());
		}
		return result;
	}

	// 예약탈퇴
	public int BooksDelete(BooksDTO mDto) {

		int result = 0;
		try {
			String query = "delete from books where number = ? ";

			psmt = con.prepareStatement(query);
			psmt.setLong(1, mDto.getNumber());

			result = psmt.executeUpdate(); // 적용된행의갯수반환

		} catch (Exception e) {
			System.out.println("예약삭제 중 예외");
			e.printStackTrace();
		}
		return result;

	}


}