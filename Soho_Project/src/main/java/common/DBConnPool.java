package common;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.ServletContext;
import javax.sql.DataSource;
/**
 * @PackageName   : common 
 * @FileName  : JDBConnect.java 
 * @작성일       : 2022. 5. 26.  
 * @작성자       : mite88 
 * @프로그램설명 : 
 */

/*
 JNDI(Java Naming and Directiry Interface)
 디렉토리 서비스에서 제공하는 데이터 및 객체를 찾아 참고하는 API
 (외부에 있는 객체를 이름으로 찾아오기위한 기술)
 
 DBCP(DataBase Connection Pool)
 DB와 연결된 커넥션 객체를 미리 만들어 풀에 저장했다가
 필요시 가져다 쓰고 반납하는 기법으로, 부하를 줄이고 자원을
 효율적으로 관리
 */
public class DBConnPool {

	// JDBC를 위한 변수 설정
	public Connection con; 
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;

	// 기본생성자

	public DBConnPool() {
		try {
			
			Context initCtx = new InitialContext(); //Context객체 생성
			/*
			앞에서 생성한 객체를 통해 JNDI 서비스 구조의 초기 root 디렉토리 얻기
			(java:comp/env 는 톰켓 루트 디렉토리명)
			 */
			Context ctx =(Context)initCtx.lookup("java:comp/env");
			/*
			server.xml에 등록된 네이밍을 lookup해서 DataSource얻음
			*/
			DataSource source = (DataSource)ctx.lookup("jdbc_mysql");

			// DB연결
			con = source.getConnection();

			if (con != null) {
				System.out.println("DB연결성공(커네션 풀)");
			} else {
				System.out.println("DB 연결실패");
			}

		} catch (Exception e) {
			System.out.println("DB 연결시 예외발생");
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
