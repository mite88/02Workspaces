package com.books;

import java.sql.*;
import java.util.*;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class BooksDAO extends DBConnPool {

	// 생성자의 super()을 통해 커넥션풀을 활성화 시켜줍시다
	public BooksDAO() {
		super();
	}


	// 예약정보
	public List<BooksDTO> BookLists(Map<String, Object> map, String s, String e) {
		List<BooksDTO> bbs = new ArrayList<BooksDTO>();
		

		try {
			
			// 아이디가 맞는지 확인용
			String sql = "select * from books where start between"+
			" ? and ?";

			psmt = con.prepareStatement(sql);
			psmt.setTimestamp(1, Timestamp.valueOf(s+" 00:00:00.0"));
			psmt.setTimestamp(2, Timestamp.valueOf(e+" 23:59:59.999"));
			
			rs = psmt.executeQuery();

			while (rs.next()) {
				BooksDTO dto = new BooksDTO(); // DTO객체 생성
				
				dto.setNumber(rs.getLong(1));
				dto.setTitle(rs.getString(2));
				dto.setStart(rs.getTimestamp(3));
				dto.setEnd(rs.getTimestamp(4));
				dto.setMessage(rs.getString(5));
				dto.setOffice_num(rs.getInt(6));
				
				bbs.add(dto);
			}

		} catch (Exception e2) {
			System.out.println("리스트에러" + e2.getMessage());
			e2.getStackTrace();

		}

		return bbs;
	}

}