package ex21jbdc;

import java.sql.SQLException;

public class SelectQuery extends ConnectDB {

	
	public SelectQuery() {
		super();
	}
	
	/*
	ResultSet클래스
	- select문실행시 결과저장
	- 결과로 반환된 레코드의 처음부터 마지막까지
	  next() 메서드를 통해 확인 후 반복인출 
	
	<자료형에 따른 메서드 출력>
	number타입 : getInt();
	char/varchar2타입 : getString();
	date타입 : getDate();
	
	해당 메서드의 매개변수는 인덱스(1부터) or 컬럼명으로 사용가능
	
	* 오라클 자료형에 상관없이 getString()로도 모두출력가능
	*/
	@Override
	void extcute() {
		try {
			stmt = con.createStatement();
			
			String query ="select id, pass, name, regidate, "
					+ "to_char(regidate, 'yyyy.mm.dd hh24:mi') d1 "
					+ "from member";
			
			rs = stmt.executeQuery(query);
			
			//쿼리실행시 사용되는 메서드 
			while (rs.next()) {
				String id= rs.getString(1);
				String pw= rs.getString("pass");
				String name= rs.getString("name");
				
				//(오라클)Date의 기본포맷 : yyyy-mm-dd
				java.sql.Date regidate= rs.getDate("regidate");
				
				//getString()로 날짜형을 출력하면 날짜 및 시간까지 같이 나온다..
				String regidate2 = rs.getString("regidate"); 
				String regidate3 = rs.getString("regidate").substring(0,13);
				String regidate4 = rs.getString("d1");
				
				System.out.printf("%s %s %s %s %s %s %s\n",
						id, pw, name, regidate, regidate2, regidate3, regidate4);
			}
			
		} catch (SQLException e) {
			System.out.println("쿼리실행문제");
			e.printStackTrace();
		} finally {
			//try문에서 반드시 실행되는 코드
			close();//쿼리닫기 메서드
		}
	}
	
	public static void main(String[] args) {
		SelectQuery selectSQL = new SelectQuery();
		selectSQL.extcute();

	}


}
