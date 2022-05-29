package homework;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class MembershipDAO extends JDBConnect{


	public MembershipDAO(ServletContext application) {
		super(application);
	}
		
	//회원가입
	public int memberInsert(MembershipDTO dto) {
		int result = 0;
		
		try {
			String sql ="insert into membership values"
		+"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
		psmt = con.prepareStatement(sql);
		psmt.setString(1, dto.getUserid());
		psmt.setString(2, dto.getPass());
		psmt.setString(3, dto.getName());
		psmt.setString(4, dto.getGender());
		psmt.setString(5, dto.getBirthday());
		psmt.setString(6, dto.getZipcode());
		psmt.setString(7, dto.getAddress1());
		psmt.setString(8, dto.getAddress2());
		psmt.setString(9, dto.getEmail());
		psmt.setString(10, dto.getMoblie());
		psmt.setString(11, dto.getTel());
		//시간까지 나타내려고 Timestamp 사용
		/*
		 [오라클에서 시간까지 넣기]
		 1. string타입으로 넣기
		 추후 클라이언트에서 형변환해야함
		 
		 2. Timestamp타입으로 넣기
		 오라클에서 테이블 생성시 TIMESTAMP형으로 만듬
		 오라클에 들어가면 22/05/28 14:48:30.000000000 
		 이런형식으로 들어가짐
		
		넣는방법은 아래 코드 참고
		 */
		psmt.setTimestamp(12, new Timestamp(System.currentTimeMillis()));

		result = psmt.executeUpdate();


		} catch (Exception e) {
			System.out.println("회원가입에러"+e.getMessage());
		}
		return result;
	}
	
	//로그인
	public List<MembershipDTO> memberLogin(String id, String pw) {

		MembershipDTO mDTO = new MembershipDTO();
		
		List<MembershipDTO> memberArr = new ArrayList<MembershipDTO>();

		try {
			//아이디와 비번이 맞는지 확인용
			String sql ="select * from membership where userid = ? and pass = ?";
			
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pw);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				
				mDTO.setUserid(rs.getString(1));
				mDTO.setName(rs.getString(3));
				
				memberArr.add(mDTO);
				return memberArr;
			}

		} catch (Exception e) {
			System.out.println("로그인에러");
			e.getStackTrace();
		}
		return memberArr;
		
		//아이디와 비번이 맞다면 하나의 객체가 들어갈거고 없으면 비어있는상태가 될것임
	}
}
