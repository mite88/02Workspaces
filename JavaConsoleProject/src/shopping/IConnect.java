package shopping;


/*
멤버 상수 : 인터페이스에 선언된 변수는 정적상수로 선언됨 
 */
public interface IConnect {
	String ORACLE_DRIVER = "oracle.jdbc.OracleDriver";
	String ORACLE_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	
	//맴버 추상메서드
	void connect(String user, String pass);//db연결
	void execute();//쿼리실행
	void close();//자원반납
	
	//사용자 입력용
	String scanValue(String title);
}
