package ex21jbdc.callable;

import java.sql.Types;

import ex21jbdc.IConnectImpl;

public class DeleteProcCall extends IConnectImpl{
	
	public DeleteProcCall() {
		super("kosmo","1234");
	}

	@Override
	public void execute() {
		try {
			//프로시져 호출
			csmt = con.prepareCall("{call KosmoMemberDelete(?, ?)}");
			
			//in파라미터 설정 :삭제할 아이디 입력후 전달
			csmt.setString(1, scanValue("삭제할 아이디"));
			//out파라미터 설정 : 반환값에대한 타입설정
			csmt.registerOutParameter(2, Types.VARCHAR);
			//프로시져 실행
			csmt.execute();
			
			System.out.println("삭제프로시져 실행결과:");
			System.out.println(csmt.getString(2));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public static void main(String[] args) {
		new DeleteProcCall().execute();
	}
	

}
