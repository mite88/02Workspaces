package membership;

import javax.servlet.ServletContext;

import common.JDBConnect;

/** 
* @PackageName   : membership 
* @FileName  : MemberDAO.java 
* @작성일       : 2022. 5. 27.  
* @작성자       : mite88
* @프로그램설명 
* DAO(Data Access Object)
* DB에 접근하여 여러 CRUD 작업을 하기위한 객체
*/
public class MemberDAO extends JDBConnect{
	
	//생성자(DB연결)
	public MemberDAO(String drv, String url, String id, String pw) {
		super(drv, url, id, pw);
	}
	
	//application 내장객체로 매개변수 전달해서 DB 연결
	public MemberDAO(ServletContext application) {
		super(application);
	}
	
	//사용자가 입력한 id,pw을 회원테이블에 확인 후 존재하는정보 있는지...
	public MemberDTO getMemberDTO(String uid, String upass) {
		MemberDTO dto = new MemberDTO(); //객체생성
		//쿼리(회원정보 검색)
		String query = "select * from member where id=? and pass=?";
		
		try {
			//쿼리 실행을위한 prepared 객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, uid);
			psmt.setString(2, upass);
			rs = psmt.executeQuery();
			
			//반환된 ResultSet객체를 통해 회원정보확인
			if(rs.next()){
				//정보 존재시 DTO객체에 회원정보 반환
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setRegidate(rs.getString(4));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}


}
