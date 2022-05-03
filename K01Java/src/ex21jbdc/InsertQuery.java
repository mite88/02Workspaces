package ex21jbdc;

import java.sql.*;

public class InsertQuery {
	
	//멤버변수
	Connection con; //db연결용
	Statement stmt; //정적쿼리문작성용
	
	//생성자
	public InsertQuery() {
		//드라이버 및 오라클 db연결
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
	
	//DB자원해제
	private void close() {
		
		try {
			//연결확인후 자원해제
			if(stmt!=null)stmt.close();
			if(con!=null) con.close();
			System.out.println("DB자원반납완료");
			
		} catch (SQLException e) {
			System.out.println("자원반납 오류 발생");
			e.printStackTrace();
		}
		
	}//end of close
	
	
	//쿼리 작성 및 전송, 실행
	private void execute() {
		try {
			//stmt 객체 생성을 위한 메서드 호출
			stmt =con.createStatement();
			
			//insert 쿼리문 작성
			String sql ="insert into member values "
			+"('test3','3333','테스트3', sysdate)";
			
			//쿼리문 전송 및 실행
			int affected=stmt.executeUpdate(sql);
			System.out.println(affected+"행이 입력");
			
			close();
			
		} catch (SQLException e) {
			System.out.println("쿼리실행문제");
			e.printStackTrace();
		}
	}//end of execute

	public static void main(String[] args) {
		InsertQuery iSQL = new InsertQuery();
		iSQL.execute();
	}

}
