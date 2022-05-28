package homework;

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
		+"(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			
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

		result = psmt.executeUpdate();


		} catch (Exception e) {
			System.out.println("회원가입에러"+e.getMessage());
		}
		return result;
	}
	
	//로그인
	public List<MembershipDTO> memberLogin(String id, String pw) {
		
		int result = 0;
		MembershipDTO mDTO = new MembershipDTO();
		List<MembershipDTO> memberArr = new ArrayList<MembershipDTO>();

		try {
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
		
	}
}
