package ex21jbdc;

import java.sql.*;
import java.util.Scanner;

/*
인터페이스를 구현한 클래스로  implements 사용
*/
public class IConnectImpl implements IConnect {
	
	//멤버변수
	public Connection con; //db연결
	public PreparedStatement psmt; //동적쿼리
	public Statement stmt; //정적쿼피
	public ResultSet rs; //select시 반환결과
	public CallableStatement csmt;
	
	public IConnectImpl() {
		System.out.println("IConnectImpl 기본생성자 호출");
	}
	
	public IConnectImpl(String user, String pass) {
		System.out.println("IConnectImpl 기본생성자 호출");
		
		try {
			Class.forName(ORACLE_DRIVER);
			connect(user, pass);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}
	}
	
	
	public IConnectImpl(String driver, String user, String pass) {
		System.out.println("IConnectImpl 기본생성자 호출");
		
		try {
			Class.forName(driver);
			connect(user, pass);
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
			e.printStackTrace();
		}
	}
	

	@Override
	public void connect(String user, String pass) {
		try {
			con = DriverManager.getConnection(ORACLE_URL, user, pass);
		} catch (SQLException e) {
			System.out.println("DB 연결오류");
			e.printStackTrace();
		}
	}

	@Override
	public void execute() {
		//ㅇㅊㅇ
	}

	@Override
	public void close() {

		try {
			
			if(con!=null) con.close();
			if(psmt!=null)psmt.close();
			if(rs!=null)rs.close();
			System.out.println("DB자원반납완료");
			
		} catch (Exception e) {
			System.out.println("자원반납 오류 발생");
			e.printStackTrace();
		}
		
		
	}

	@Override
	public String scanValue(String title) {
		Scanner scan = new Scanner(System.in);
		System.out.println(title+"을(를) 입력(exit->종료)");
		String inputStr = scan.nextLine();
		
		//equals()와 동일, 대소문자 구분없이 비교가능
		if("EXIT".equalsIgnoreCase(inputStr)) {
			System.out.println("프로그램을 종료합니다");
			close();
			
			//프로그램 자체가 즉시종료
			System.exit(0);
		}
		return inputStr;
	}

}
