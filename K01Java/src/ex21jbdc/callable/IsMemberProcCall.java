package ex21jbdc.callable;

import java.sql.Types;

import ex21jbdc.IConnectImpl;

public class IsMemberProcCall extends IConnectImpl{
	
	public IsMemberProcCall() {
		super("kosmo","1234");
	}

	@Override
	public void execute() {
		try {
			//프로시져 호출
			csmt = con.prepareCall("{call KosmoMemberAuth(?, ?, ?)}");
			
			//in 파라미터 : 아이디, 비번 입력
			csmt.setString(1, scanValue("회원 아이디"));
			csmt.setString(2, scanValue("회원 패스워드"));
			//out 파라미터 : 결과값 출력(0~2)
			csmt.registerOutParameter(3, Types.NUMERIC);
			csmt.execute();
			
			//결과값을 바탕으로 switch문 작성
			int outParamResult = csmt.getInt(3);

			switch (outParamResult) {
			case 0:
				System.out.println("회원아이디가 없어요. 회원가입해주삼");
				break;

			case 1:
				System.out.println("패스워드가 일치하지 않아요. 비번찾기하삼");
				break;
			case 2:
				System.out.println("회원님 방가방가^^*");
				break;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public static void main(String[] args) {
		new IsMemberProcCall().execute();
	}
	

}
