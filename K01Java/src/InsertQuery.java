import java.sql.*;

public class InsertQuery {
	
	Connection con;
	Statement stmt;
	
	public InsertQuery() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "hr";
			String pass ="1234";
			
			Connection con = DriverManager.getConnection(url, id, pass);
			
			if(con != null) {
				System.out.println("Oracle 연결성공");
			}else {
				System.out.println("Oracle 연결실패");
			}
			
		} catch (ClassNotFoundException e) {
			System.out.println("오라클 드라이버 로딩실패");
			e.printStackTrace();
		}catch (SQLException e) {
			System.out.println("DB연결 실패");
			e.printStackTrace();
		}catch (Exception e) {
			System.out.println("Oracle 연결시 예외발생");
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
