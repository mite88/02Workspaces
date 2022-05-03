package ex21jbdc;

import java.sql.*;

//상속을 목적으로 생성하는 추상클래스 DB여녈, 자원반납
public abstract class ConnectDB {

	//상속관계에서 접근가능하게 지정자지정한 멤버변수 선언
	protected Connection con;
	protected Statement stmt;
	protected ResultSet rs;
	
	public ConnectDB(String id,String pw) {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", id, pw);
		
			System.out.println("오라클 DB 연결성공");
			
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버 로딩실패");
		} catch (SQLException e) {
			System.out.println("DB연결실패");
		} catch (Exception e) {
			System.out.println("기타 예외");
			e.printStackTrace();
		}
	}
	
	//생성자복사하여 기본 id, pw만변경
	public ConnectDB() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			con = DriverManager.getConnection(
					"jdbc:oracle:thin:@localhost:1521:xe", "kosmo", "1234");
		
			System.out.println("오라클 DB 연결성공");
			
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버 로딩실패");
		} catch (SQLException e) {
			System.out.println("DB연결실패");
		} catch (Exception e) {
			System.out.println("기타 예외");
			e.printStackTrace();
		}
	}
	
	
	public void close() {
		
		try {
			
			if(stmt!=null)stmt.close();
			if(con!=null) con.close();
			System.out.println("DB자원반납완료");
			
		} catch (SQLException e) {
			System.out.println("자원반납 오류 발생");
			e.printStackTrace();
		}
		
	}//end of close
	
	abstract void extcute();
	
}
