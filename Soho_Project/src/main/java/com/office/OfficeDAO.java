package com.office;

import java.sql.*;
import java.util.*;
import java.util.List;
import java.util.Map;

import com.books.BooksDTO;
import com.contact.ContactDTO;

import common.DBConnPool;

public class OfficeDAO extends DBConnPool {

	// 생성자의 super()을 통해 커넥션풀을 활성화 시켜줍시다
	public OfficeDAO() {
		super();
	}

	// 사무실가입
	public int officeInsert(OfficeDTO mDto) {
		int result = 0;

		try {
			String sql = "insert into office"
					+ " (o_name,o_bnumber,o_addr,o_phone,o_fax,o_manage_name, o_manage_phone,o_email,"
					+ "o_banknumber,o_bankname,o_img1, o_img2, o_content,o_pay,o_service,o_type) values" 
					+ "(?, ?, ?, ?, ?,  ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


			// query문 확인
			System.out.println("officeInsert:" + sql);

			String type = String.join(", ", mDto.getO_type());

			psmt = con.prepareStatement(sql);
			psmt.setString(1, mDto.getO_name());
			psmt.setString(2, mDto.getO_bnumber());
			psmt.setString(3, mDto.getO_addr());
			psmt.setString(4, mDto.getO_phone());
			psmt.setString(5, mDto.getO_fax());
			psmt.setString(6, mDto.getO_manage_name());
			psmt.setString(7, mDto.getO_manage_phone());
			psmt.setString(8, mDto.getO_email());
			psmt.setString(9, mDto.getO_banknumber());
			psmt.setString(10, mDto.getO_bankname());
			psmt.setString(11, mDto.getO_img1());
			psmt.setString(12, mDto.getO_img2());
			psmt.setString(13, mDto.getO_content());
			psmt.setString(14, mDto.getO_pay());
			psmt.setString(15, mDto.getO_service());
			psmt.setString(16, type);

			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("사무실가입에러" + e.getMessage());
		}
		return result;
	}

	// 총갯수 카운터
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM office ";
		// 코드없으면 전체검색
		if (map.get("code") != null) {
			query += " where code = " + Integer.parseInt(map.get("code").toString());
		}
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		} catch (Exception e) {
			System.out.println("게시물 카운트중 예외 발생");
			e.printStackTrace();
		}

		return totalCount;
	}
	
	// 오피스정보(관리자가찾음)
		public List<OfficeDTO> officeSelect(Map<String, Object> map) {

			List<OfficeDTO> office_list = new ArrayList<OfficeDTO>();

			try {
				String sql = "select * from office ";

				psmt = con.prepareStatement(sql);

				// 코드없으면 전체검색
				if (map.get("code") != null) {
					sql += " where code = ?";

					psmt.setInt(1, Integer.parseInt(map.get("code").toString()));
				}

				rs = psmt.executeQuery();

				while (rs.next()) {

					OfficeDTO dto = new OfficeDTO(); // 객체생성

					dto.setCode(rs.getInt(1));
					dto.setO_name(rs.getString(2));
					dto.setO_bnumber(rs.getString(3));
					dto.setO_addr(rs.getString(4));
					dto.setO_phone(rs.getString(5));
					dto.setO_fax(rs.getString(6));
					dto.setO_manage_name(rs.getString(7));
					dto.setO_manage_phone(rs.getString(8));
					dto.setO_email(rs.getString(9));
					dto.setO_banknumber(rs.getString(10));
					dto.setO_bankname(rs.getString(11));
					dto.setO_img1(rs.getString(12));
					dto.setO_img2(rs.getString(13));
					
					

					dto.setO_content(rs.getString(14).replaceAll("\r\n", "<br>"));
					dto.setO_pay(rs.getString(15).replaceAll("\r\n", "<br>"));
					dto.setO_service(rs.getString(16).replaceAll("\r\n", "<br>"));
					dto.setO_type(rs.getString(17).replaceAll("\r\n", "<br>"));

					//dto.setO_content(rs.getString(14));
					//dto.setO_pay(rs.getString(15));
					//dto.setO_service(rs.getString(16));
					//dto.setO_type(rs.getString(17));

					office_list.add(dto);
				}

			} catch (Exception e) {
				e.getStackTrace();
				System.out.println("로그인에러" + e.getMessage());
				e.getStackTrace();

			}

			return office_list;
		}

	// 오피스정보(관리자가찾음)
	public List<OfficeDTO> selectListPage(Map<String, Object> map) {

		List<OfficeDTO> office_list = new ArrayList<OfficeDTO>();

		try {
			String sql = "select * from office ";

			if (map.get("searchWord") != null) {
				sql += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
			}
			sql += "	ORDER BY code DESC LIMIT ?, ?";


			psmt = con.prepareStatement(sql);
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()) );
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()) );
			rs = psmt.executeQuery();
			
			System.out.println("sql:"+sql);

			while (rs.next()) {

				OfficeDTO dto = new OfficeDTO(); // 객체생성

				dto.setCode(rs.getInt(1));
				dto.setO_name(rs.getString(2));
				dto.setO_bnumber(rs.getString(3));
				dto.setO_addr(rs.getString(4));
				dto.setO_phone(rs.getString(5));
				dto.setO_fax(rs.getString(6));
				dto.setO_manage_name(rs.getString(7));
				dto.setO_manage_phone(rs.getString(8));
				dto.setO_email(rs.getString(9));
				dto.setO_banknumber(rs.getString(10));
				dto.setO_bankname(rs.getString(11));
				dto.setO_img1(rs.getString(12));
				dto.setO_img2(rs.getString(13));
				dto.setO_content(rs.getString(14));
				dto.setO_pay(rs.getString(15));
				dto.setO_service(rs.getString(16));
				dto.setO_type(rs.getString(17));

				office_list.add(dto);
			}

		} catch (Exception e) {
			e.getStackTrace();
			System.out.println("사무실리스트에러" + e.getMessage());
			e.getStackTrace();

		}

		return office_list;
	}

	// 매개변수로 전달된 일련번호(code)를 통해 하나의 레코드 조회
	public OfficeDTO selectView(int code) {

		// 조회된 레코드를 DTO객체 저장한 후 반환한다.
		OfficeDTO dto = new OfficeDTO();
		// 인파라미터가 있는 쿼리문 작성
		String query = "SELECT * FROM office WHERE code=?";
		try {
			// 쿼리실행을 위한 객체생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setInt(1, code);
			rs = psmt.executeQuery();

			// 조회된 레코드가 있을 때 DTO객체에 각 컬럼값을 저장한다.
			if (rs.next()) {
				dto.setCode(rs.getInt(1));
				dto.setO_name(rs.getString(2));
				dto.setO_bnumber(rs.getString(3));
				dto.setO_addr(rs.getString(4));
				dto.setO_phone(rs.getString(5));
				dto.setO_fax(rs.getString(6));
				dto.setO_manage_name(rs.getString(7));
				dto.setO_manage_phone(rs.getString(8));
				dto.setO_email(rs.getString(9));
				dto.setO_banknumber(rs.getString(10));
				dto.setO_bankname(rs.getString(11));
				dto.setO_img1(rs.getString(12));
				dto.setO_img2(rs.getString(13));
				dto.setO_content(rs.getString(14));
				dto.setO_pay(rs.getString(15));
				dto.setO_service(rs.getString(16));
				dto.setO_type(rs.getString(17));

			}

		} catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}

	// 수정
	public int officeUpdate(OfficeDTO mDto) {
		int result = 0;

		try {

			
			  System.out.println(
			  mDto.getO_name()+"/"+mDto.getO_bnumber()+"/"+mDto.getO_addr()
			  +"/"+mDto.getO_phone()+"/"+ mDto.getO_fax()+"/"+mDto.getO_manage_name()
			  +"/"+mDto.getO_manage_phone()+"/"+mDto.getO_email()+"/"+mDto.getO_banknumber(
			  ) +"/"+mDto.getO_bankname()+"/"+mDto.getO_img1()+"/"+mDto.getO_img2()
			  +"/"+mDto.getO_content()+"/"+
			  mDto.getO_pay()+"/"+mDto.getO_service()+"/"+mDto.getO_type()+"/"+
			  mDto.getCode());
			 
			
			String sql = "update office set ";
			sql += "o_name=?, o_bnumber=?, o_addr=?, o_phone=?, o_fax=?, o_manage_name=?, "
					+ "o_manage_phone=?, o_email=?, o_banknumber=?, o_bankname=?, "
					+ "o_img1=?, o_img2=?, o_content=?, o_pay=?, " 
					+ "o_service=?, o_type=? " + " where code=?";

			// query문 확인
			System.out.println("officeUpdate:" + sql);
			
			psmt = con.prepareStatement(sql);

			psmt.setString(1, mDto.getO_name());
			psmt.setString(2, mDto.getO_bnumber());
			psmt.setString(3, mDto.getO_addr());
			psmt.setString(4, mDto.getO_phone());
			psmt.setString(5, mDto.getO_fax());
			psmt.setString(6, mDto.getO_manage_name());
			psmt.setString(7, mDto.getO_manage_phone());
			psmt.setString(8, mDto.getO_email());
			psmt.setString(9, mDto.getO_banknumber());
			psmt.setString(10, mDto.getO_bankname());
			psmt.setString(11, mDto.getO_img1());
			psmt.setString(12, mDto.getO_img2());
			psmt.setString(13, mDto.getO_content());
			psmt.setString(14, mDto.getO_pay());
			psmt.setString(15, mDto.getO_service());
			psmt.setString(16, mDto.getO_type());
			psmt.setInt(17, mDto.getCode());
			
			
			result = psmt.executeUpdate();
			
			System.out.println("result"+result);

		} catch (Exception e) {
			//e.getStackTrace();
			System.out.println("사무실수정에러" + e.getMessage());
		}
		return result;
	}

	// 사무실삭제
	public int officeDelete(OfficeDTO mDto) {

		int result = 0;

		try {
			String query = "delete from office where code = ? ";

			psmt = con.prepareStatement(query);
			psmt.setInt(1, mDto.getCode());

			result = psmt.executeUpdate(); // 적용된행의갯수반환

		} catch (Exception e) {
			System.out.println("사무실삭제 중 예외");
			e.printStackTrace();
		}
		return result;

	}

}