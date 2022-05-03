package ex21jbdc.callable;

import java.sql.SQLException;
import java.sql.Types;

import ex21jbdc.IConnectImpl;


/*
 java 에서 프로시져 호출

 프로시져 실행을 위해 CallableStatement객체 생성
 
 형식  :  {call 프로시져명(인수1, 인수2....N)}
 * 파라미터는 in,out 순서 상관없이 작성 가능(정의에 따라 다름)
 */
public class InsertProcCall extends IConnectImpl {
		
	public InsertProcCall() {
			super("kosmo", "1234");
	}
	
	@Override
	public void execute() {
		try {
			
			/*
			프로시져는 return이 없으므로 ?= 로시작하지 않음
			out 파라미터를 통해 값 반환
			*/
			csmt = con.prepareCall("{call KosmoMemberInsert(?,?,?,?)}");
			
			//인파라미터설정
			csmt.setString(1, scanValue("아이디"));
			csmt.setString(2, scanValue("패스워드"));
			csmt.setString(3, scanValue("이름"));
			//out파라미터 설정, 반환값의 자료형 설정
			csmt.registerOutParameter(4, Types.NUMERIC);
			
			//실행
			csmt.execute();
			
			//out파라미터에 할당된 값을 읽어 결과 출력
			int affected = csmt.getInt(4);
			
			if( affected == 0 ) {
				System.out.println("오류발생:입력실패");
			}else {
				System.out.println(affected+"행 입력");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public static void main(String[] args) {
		new InsertProcCall().execute();
	}
}
