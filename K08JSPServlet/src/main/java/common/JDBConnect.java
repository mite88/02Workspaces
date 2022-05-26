package common;

import java.sql.*;

import javax.servlet.ServletContext;
/**
 * @PackageName   : common 
 * @FileName  : JDBConnect.java 
 * @작성일       : 2022. 5. 26.  
 * @작성자       : 이재희 
 * @프로그램설명 : 
 */
public class JDBConnect {

	// JDBC를 위한 변수 설정
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	// 기본생성자

	// DB연결1
	public JDBConnect() {
		try {
			// 오라클 드라이버 로드
			// 커넥션URL, id, pw
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "musthave";
			String pass = "1234";

			// DB연결
			con = DriverManager.getConnection(url, id, pass);

			if (con != null) {
				System.out.println("Oracle 연결성공(기본생성자)");
			} else {
				System.out.println("Oracle 연결실패");
			}

		} catch (Exception e) {
			System.out.println("Oracle 연결시 예외발생");
			e.printStackTrace();
		}
	}

	// 생성자2
	// DB연결2
	public JDBConnect(String driver, String url, String id, String pwd) {
		try {

			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pwd);

			if (con != null) {
				System.out.println("Oracle 연결성공(인수 생성자 1)");
			} else {
				System.out.println("Oracle 연결실패");
			}

		} catch (Exception e) {
			System.out.println("Oracle 연결시 예외발생");
			e.printStackTrace();
		}
	}

	// 생성자3
	// DB연결3
	public JDBConnect(ServletContext application) {
		try {
			// JSP내장객체 매개변수를 통해 전달 후 사용함
			String driver = application.getInitParameter("OracleDriver");
			Class.forName(driver);
			String url = application.getInitParameter("OracleURL");
			String id = application.getInitParameter("OracleId");
			String pwd = application.getInitParameter("OraclePwd");
			con = DriverManager.getConnection(url, id, pwd);
			
			if (con != null) {
				System.out.println("Oracle 연결성공(인수 생성자 2)");
			} else {
				System.out.println("Oracle 연결실패");
			}

		} catch (Exception e) {
			System.out.println("Oracle 연결시 예외발생");
			e.printStackTrace();
		}
	}

	// 자원반납
	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();
			System.out.println("DB자원반납완료");

		} catch (Exception e) {
			System.out.println("자원반납 오류 발생");
			e.printStackTrace();
		}
	}
}
