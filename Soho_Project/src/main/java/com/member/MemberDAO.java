package com.member;

import java.util.List;
import java.util.Map;
import java.util.Vector;

import com.contact.ContactDTO;

import common.DBConnPool;
import utils.AES256;

public class MemberDAO extends DBConnPool {
	AES256 aes = new AES256();//비번 암호화

	// 생성자의 super()을 통해 커넥션풀을 활성화 시켜줍시다
	public MemberDAO() {
		super();
	}

	// 회원가입
	public int memberInsert(MemberDTO mDto) {
		int result = 0;

		try {
			String sql = "insert into member values" + "(?, ?, ?, ?, ?,  ?, ?, ?, now(), ?)";

			// query문 확인
			System.out.println("memberInsert:" + sql);

			psmt = con.prepareStatement(sql);
			psmt.setString(1, mDto.getUser_id());
			psmt.setString(2, mDto.getUser_pw());
			psmt.setString(3, mDto.getUser_name());
			psmt.setString(4, mDto.getUser_email());
			psmt.setString(5, mDto.getUser_phone());
			String hoddy_formatted = String.join(", ", mDto.getUser_hoddy());
			psmt.setString(6, hoddy_formatted);
			psmt.setString(7, mDto.getUser_job());
			psmt.setString(8, mDto.getUser_info());
			psmt.setString(9, mDto.getMemberLevel());

			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("회원가입에러" + e.getMessage());
		}
		return result;
	}

	// Contact테이블의 게시물의 갯수를 카운트 하여 반환한다.
	// 목록의 페이징 처리나 게시물의 가상번호 부여에 사용한다.
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM member ";
		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' " ;
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

	public List<MemberDTO> selectListPage(Map<String, Object> map) {
		List<MemberDTO> member_board = new Vector<MemberDTO>();

		String query = " " + " SELECT * FROM member ";

		if (map.get("searchWord") != null) {
			query += " WHERE " + map.get("searchField") + " LIKE '%" + map.get("searchWord") + "%' ";
		}
		query += "	ORDER BY megister_date DESC LIMIT ?, ?";

		System.out.println("쿼리문=" + query);

		try {
			psmt = con.prepareStatement(query);
			// 페이지 스타트, 엔드 값 얻어오기
			/*
			 * setString()으로 인파라미터를 설정하면 문자형이 되므로 값 양쪽에 싱글쿼테이션이 자동으로 삽입된다. 여기서는 정수값을 전달해야
			 * 하므로 setInt()를 사용하고, 인수로 전달되는 변수를 정수로 변경한다.
			 */
			psmt.setInt(1, Integer.parseInt(map.get("start").toString()));
			psmt.setInt(2, Integer.parseInt(map.get("end").toString()));
			rs = psmt.executeQuery();

			while (rs.next()) {
				// 테이블이 변경되었으므로 저장하는 부분은 수정이 필요함..
				MemberDTO dto = new MemberDTO();

				dto.setUser_id(rs.getString(1));
				
				try {
					dto.setUser_pw(aes.decrypt(rs.getString(2)));
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
				//dto.setUser_pw(rs.getString(2));
				dto.setUser_name(rs.getString(3));
				dto.setUser_email(rs.getString(4));
				dto.setUser_phone(rs.getString(5));
				dto.setUser_hoddy(rs.getString(6));
				dto.setUser_job(rs.getString(7));
				dto.setUser_info(rs.getString(8));
				dto.setMegister_date(rs.getDate(9));
				dto.setMemberLevel(rs.getString(10));

				member_board.add(dto);
			}
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return member_board;
	}

	
	
	
	// 회원정보(추후에 로그인 및 아이디 체크등 정보확인용으로 작업할겁니다)
	public MemberDTO memberSelect(String id, String pw) {
		MemberDTO dto = new MemberDTO(); // 객체생성
		try {
			System.out.println("id:" + id);
			System.out.println("pw:" + pw);

			if (pw.equals("")) {
				// 아이디가 맞는지 확인용
				String sql = "select * from member where user_id = ?";

				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();

				// rs.next(); // 해당결과는 한행뿐이기 때문에 if문을 쓰지않음
				if (rs.next()) {

					dto.setUser_id(rs.getString(1));
					dto.setUser_pw(rs.getString(2));
					dto.setUser_name(rs.getString(3));
					dto.setUser_email(rs.getString(4));
					dto.setUser_phone(rs.getString(5));
					dto.setUser_hoddy(rs.getString(6));
					dto.setUser_job(rs.getString(7));
					dto.setUser_info(rs.getString(8));
					dto.setMegister_date(rs.getDate(9));
					dto.setMemberLevel(rs.getString(10));

				}

			} else {
				// 아이디와 비번이 맞는지 확인용
				String sql = "select * from member where user_id = ? and user_pw = ?";

				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pw);
				rs = psmt.executeQuery();

				// rs.next(); // 해당결과는 한행뿐이기 때문에 if문을 쓰지않음
				if (rs.next()) {

					dto.setUser_id(rs.getString(1));
					//dto.setUser_pw(rs.getString(2));
					try {
						dto.setUser_pw(aes.decrypt(rs.getString(2)));
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					dto.setUser_name(rs.getString(3));
					dto.setUser_email(rs.getString(4));
					dto.setUser_phone(rs.getString(5));
					dto.setUser_hoddy(rs.getString(6));
					dto.setUser_job(rs.getString(7));
					dto.setUser_info(rs.getString(8));
					dto.setMegister_date(rs.getDate(9));
					dto.setMemberLevel(rs.getString(10));

				}
			}

		} catch (Exception e) {
			System.out.println("로그인에러" + e.getMessage());
			e.getStackTrace();

		}

		return dto;
	}
	
	//특정 회원편(관리자)
	//회원정보
		public MemberDTO memberLogin_admin(String id, String pw) {
		MemberDTO dto = new MemberDTO(); // 객체생성
		try {
			System.out.println("id:" + id);
			System.out.println("pw:" + pw);

			// 아이디와 비번이 맞는지 확인용
			String sql = "select * from member where user_id = ? and user_pw = ? and memberLevel=?";

			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, "admin"); //관리자용
			rs = psmt.executeQuery();

			// rs.next(); // 해당결과는 한행뿐이기 때문에 if문을 쓰지않음
			if (rs.next()) {

				dto.setUser_id(rs.getString(1));
				dto.setUser_pw(rs.getString(2));
				dto.setUser_name(rs.getString(3));
				dto.setUser_email(rs.getString(4));
				dto.setUser_phone(rs.getString(5));
				dto.setUser_hoddy(rs.getString(6));
				dto.setUser_job(rs.getString(7));
				dto.setUser_info(rs.getString(8));
				dto.setMegister_date(rs.getDate(9));
				dto.setMemberLevel(rs.getString(10));

			}

		} catch (Exception e) {
			System.out.println("로그인에러" + e.getMessage());
			e.getStackTrace();

		}

		return dto;
	}

	// 회원수정
	public int memberUpdate(MemberDTO mDto) {
		int result = 0;

		String pw = mDto.getUser_pw();

		try {
			/*
			 * 회원수정시 비밀번호를 입력하지 않는 경우를 대비하여 작성했습니다.
			 */
			String sql = "update member set ";
			if (!pw.equals("")) {
				sql += "user_pw=?, ";
			}
			sql += "user_name=?, user_email=?, " + "user_phone=?, user_hoddy=?, user_job=?, user_info=?, memberLevel=? ";
			sql += "where user_id=?";

			// query문 확인
			System.out.println("memberUpdate:" + sql);

			psmt = con.prepareStatement(sql);

			String hoddy_formatted = String.join(", ", mDto.getUser_hoddy());
			if (pw.equals("")) {
				psmt.setString(1, mDto.getUser_name());
				psmt.setString(2, mDto.getUser_email());
				psmt.setString(3, mDto.getUser_phone());

				psmt.setString(4, hoddy_formatted);
				psmt.setString(5, mDto.getUser_job());
				psmt.setString(6, mDto.getUser_info());
				psmt.setString(7,  mDto.getMemberLevel());

				psmt.setString(8, mDto.getUser_id());
			} else {
				psmt.setString(1, mDto.getUser_pw());
				psmt.setString(2, mDto.getUser_name());
				psmt.setString(3, mDto.getUser_email());
				psmt.setString(4, mDto.getUser_phone());

				psmt.setString(5, hoddy_formatted);
				psmt.setString(6, mDto.getUser_job());
				psmt.setString(7, mDto.getUser_info());
				psmt.setString(8,  mDto.getMemberLevel());

				psmt.setString(9, mDto.getUser_id());
			}
			
			
			

			result = psmt.executeUpdate();

		} catch (Exception e) {
			System.out.println("회원수정에러" + e.getMessage());
		}
		return result;
	}

	// 회원탈퇴
	public int memberDelete(MemberDTO mDto) {

		int result = 0;
		String pw = mDto.getUser_pw();

		try {
			String query = "delete from member where user_id = ? ";
			
			if (!pw.equals("")) {
				query +=" and user_pw = ? ";
			}

			psmt = con.prepareStatement(query);
			psmt.setString(1, mDto.getUser_id());
			
			if (!pw.equals("")) {
				psmt.setString(2, mDto.getUser_pw());
			}


			result = psmt.executeUpdate(); // 적용된행의갯수반환

		} catch (Exception e) {
			System.out.println("회원삭제 중 예외");
			e.printStackTrace();
		}
		return result;

	}
}