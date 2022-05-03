package ex21jbdc.callable;

import java.sql.SQLException;
import java.sql.Types;

import ex21jbdc.IConnectImpl;

/*
java 에서 오라클함수 호출

 정의된 함수를 실행하기 위해 CallableStatement객체 생성
 Connection 객체의  prepareCall() 메서드 호출을 통해 생성
 
 형식
 con.prepareCall("{? = call 함수명(인수1, 인수2....N)}");
 * 첫번째 물음표는 반환값
 * 반환값은 파라미터 설정시 java,sql.Types클래스의 자료형으로 설정
*/
public class FunctionCall extends IConnectImpl {
		
	public FunctionCall() {
			super("kosmo", "1234");
	}
	
	@Override
	public void execute() {
		try {
			csmt = con.prepareCall("{? = call fillAsterik(?)}");
			//반환값 자료형
			csmt.registerOutParameter(1, Types.VARCHAR);
			//인파라미터설정
			csmt.setString(2, scanValue("아이디"));
			//함수실행
			csmt.execute();
			System.out.println("함수의 반환값:"+csmt.getString(1));
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public static void main(String[] args) {
		new FunctionCall().execute();
	}
}
