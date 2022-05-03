package ex21jbdc;

import java.sql.*;

public class DeleteQuery {
	
	Connection con;
	Statement stmt;
	
	
	public DeleteQuery() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String id = "kosmo";
			String pass ="1234";
			
			con = DriverManager.getConnection(url, id, pass);
		
			System.out.println("오라클 DB 연결성공");
			
		} catch (Exception e) {
			System.out.println("연결실패");
			e.printStackTrace();
		}
	}//end of InsertQuery
	
	private void close() {
		
		try {
			
			if(stmt!=null)stmt.close();
			if(con!=null) con.close();
			System.out.println("DB자원반납완료");
			
		} catch (SQLException e) {
			System.out.println("자원반납 오류 발생");
			e.printStackTrace();
		}
		
	}//end of close
	
	
	private void execute() {
		try {
			stmt =con.createStatement();
			
			String sql ="delete from member where id='dummy'";
			
			/*
			행의 변화가 생기는 insert, delete, update : executeUpdate()
			행의 변화가 없는 select : executeQuery()
			*/
			int affected=stmt.executeUpdate(sql);
			System.out.println(affected+"행이 삭제");
			
			close();
			
		} catch (SQLException e) {
			System.out.println("쿼리실행문제");
			e.printStackTrace();
		}
	}//end of execute

	public static void main(String[] args) {
		new DeleteQuery().execute();
	}

}
