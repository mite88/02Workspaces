package banking;

//개발자가 직접 정의한 예외처리 클래스
@SuppressWarnings("serial")
public class MenuSelectException extends Exception{
	
	public MenuSelectException() {}
	public MenuSelectException(String message) {
		super(message);
	}
	
	
}
