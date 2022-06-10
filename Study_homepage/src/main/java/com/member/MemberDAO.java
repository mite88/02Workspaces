package com.member;


import common.JDBConnect;

public class MemberDAO extends JDBConnect{

	//회원가입
	public int memberInsert(MemberDTO mDto) {
		int result = 0;

		try {
			String sql ="insert into member values"
		+"(?, ?, ?, ?, ?,  ?, ?, ?, sysdate, ?)";
			
		//System.out.println("id:"+ mDto.getUser_id());
			
		psmt = con.prepareStatement(sql);
		psmt.setString(1, mDto.getUser_id());
		psmt.setString(2, mDto.getUser_pw());
		psmt.setString(3, mDto.getUser_name());
		psmt.setString(4, mDto.getUser_email());
		psmt.setString(5, mDto.getUser_phone());
		psmt.setString(6, mDto.getUser_hoddy());
		psmt.setString(7, mDto.getUser_job());
		psmt.setString(8, mDto.getUser_info());
		psmt.setString(9, mDto.getMemberLevel());
		
		
		result = psmt.executeUpdate();
		
		close();


		} catch (Exception e) {
			System.out.println("회원가입에러"+e.getMessage());
		}
		return result;
	}
	
	//로그인
	 public MemberDTO memberSelect(String id, String pw) {
		 MemberDTO dto = new MemberDTO(); //객체생성
		try {
			System.out.println("pw:"+pw);
			
			if(pw.equals("")) {
				//아이디와 비번이 맞는지 확인용
				String sql ="select * from member where user_id = ?";
				
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				rs = psmt.executeQuery();
				
				//rs.next(); // 해당결과는 한행뿐이기 때문에 if문을 쓰지않음
				if(rs.next()) {
					
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
				
			}else {
				//아이디와 비번이 맞는지 확인용
				String sql ="select * from member where user_id = ? and user_pw = ?";
				
				psmt = con.prepareStatement(sql);
				psmt.setString(1, id);
				psmt.setString(2, pw);
				rs = psmt.executeQuery();
				
				//rs.next(); // 해당결과는 한행뿐이기 때문에 if문을 쓰지않음
				if(rs.next()) {
					
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
			System.out.println("로그인에러");
			e.getStackTrace();
		}

		return dto;
	}
	
	
	//회원수정
}