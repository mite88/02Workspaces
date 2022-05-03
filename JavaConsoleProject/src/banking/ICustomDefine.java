package banking;
/*
interface로 생성한다. 
메뉴선택과 이자율 지정을 위한 인터페이스형 상수를 정의한다. 
메뉴 : 계좌개설, 입금, 출금, 전체계좌정보출력, 종료를 1~5까지로 지정한다.
이자율 : 고객의 신용등급을 A, B, C로 나눠서 7%, 4%, 2%로 지정한다.
*/
public  interface  ICustomDefine {
	//메뉴관련 지정
	public static final int MAKE = 1;
	public static final int DEPOSIT = 2;
	public static final int WITHDRAW = 3;
	public static final int INQUIRE = 4;
	public static final int EXIT = 5;
	
	//이자율 지정
	public static final double A = 0.07;
	public static final double B = 0.04;
	public static final double C = 0.02;
}
