package com.member;

import common.DBConnPool;

public class MemberDAO extends DBConnPool {

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
			sql += "user_name=?, user_email=?, " + "user_phone=?, user_hoddy=?, user_job=?, user_info=? "
					+ "where user_id=?";

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

				psmt.setString(7, mDto.getUser_id());
			} else {
				psmt.setString(1, mDto.getUser_pw());
				psmt.setString(2, mDto.getUser_name());
				psmt.setString(3, mDto.getUser_email());
				psmt.setString(4, mDto.getUser_phone());

				psmt.setString(5, hoddy_formatted);
				psmt.setString(6, mDto.getUser_job());
				psmt.setString(7, mDto.getUser_info());

				psmt.setString(8, mDto.getUser_id());
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

		System.out.println("id:" + mDto.getUser_id());
		System.out.println("pw:" + mDto.getUser_pw());
		try {
			String query = "delete from member where user_id = ? and user_pw = ? ";

			psmt = con.prepareStatement(query);
			psmt.setString(1, mDto.getUser_id());
			psmt.setString(2, mDto.getUser_pw());

			result = psmt.executeUpdate(); // 적용된행의갯수반환

		} catch (Exception e) {
			System.out.println("회원삭제 중 예외");
			e.printStackTrace();
		}
		return result;

	}
}