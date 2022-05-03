package ex21jbdc.prepared;

import java.util.Scanner;

import ex21jbdc.IConnectImpl;

public class UpdateSQL extends IConnectImpl{
	
	public UpdateSQL() {
		super(ORACLE_DRIVER, "kosmo","1234");
	}
	
	@Override
	public void execute() {
		//보통 수정 삭제시 pk로 지정한 컬럼을 조건으로 사용(안전성)
		String sql ="update member set name = ?, pass = ? where id = ?";
		try {

			psmt=con.prepareStatement(sql);
			
			//사용자로부터 입력받아 exit할때까지 실행됨
			while (true) {
				psmt.setString(3, scanValue("수정할아이디"));
				psmt.setString(1, scanValue("이름"));
				psmt.setString(2, scanValue("비번"));
				

				//쿼리실행 후 결과값 반환
				int affected = psmt.executeUpdate();
				System.out.println(affected+"행 변경");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}

	public static void main(String[] args) {
		new UpdateSQL().execute();
	}

}
