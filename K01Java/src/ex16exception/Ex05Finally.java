package ex16exception;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
finally절
예외발생과 상관없이 try문에 진입시 
반드시 실행해야 할 코드가 있는경우 기술하는 블록
*/
public class Ex05Finally {

	//런타임에러 발생되는 메서드로 예외 던지기시킴
	static void runtime() throws NumberFormatException{
		Integer.parseInt("백");//문자열을 정수로 변환x
	}
	
	static void tryCatchFinally() {
		Scanner scan = new Scanner(System.in);
		System.out.print("나이를 입력하세요:");
		int age = -1;
		
		try {
			age = scan.nextInt();
			System.out.println("당신은 5년후 "+(age+5)+"살 입니다.");
			return;//해도 finally 실행됨
		} catch(InputMismatchException e){
			//예외발생되도 finally 실행됨
			System.out.println("나이는 숫자만 쓰세요.");
		}finally {
			
			System.out.println("항상 실행되는 finally절 입니다.");
			System.exit(0); //프로그램강제종료
		}
	}
	
	public static void main(String[] args) {
		try {
			runtime();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		tryCatchFinally();
		
		System.out.println("메인메서드 끝"); //System.exit(0);로 인해 실행되지않음
	}

}
