package ex21jbdc;

import java.sql.SQLException;

public class UpdateQuery extends ConnectDB{

	//부모클래스의 생성자를 통해 DB연결
	public UpdateQuery(String user, String pass) {
		super(user, pass);
	}

	//부모의 추상메서드를 오버라이딩하여 재정의
	@Override
	void extcute() {
		try {
			stmt = con.createStatement();
			
			String sql ="update member "
					+ "set "
					+ "pass = '1111', "
					+ "name = '이순신', "
					+ "regidate = sysdate "
					+ "where id = 'ko1' ";
			
			System.out.println("sql:"+sql);
			
			int affected = stmt.executeUpdate(sql);
			System.out.println(affected+"행이 업데이트 됨");
		}catch (SQLException e) {
			System.out.println("쿼리실행문제");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("알수없는 기타예외");
		}finally {
			//try문에서 반드시 실행되는 코드
			close();//쿼리닫기 메서드
		}
	}
	
	
	public static void main(String[] args) {
		new UpdateQuery("kosmo", "1234").extcute();
	}

}
