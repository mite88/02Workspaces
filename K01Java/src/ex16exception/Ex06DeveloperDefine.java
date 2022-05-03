package ex16exception;

import java.util.InputMismatchException;
import java.util.Scanner;

/*
사용자 정의 예외클래스
1. Exception 클래스를 상속
2. 생성자에서 예외발생시 출력할 메세지를 super()을 통해 입력
3. 예외발생지점에서 if문으로감지 후 예외객체 생성 및 throw
4. catch문에서 예외객체를 받아 예외처리

*/
@SuppressWarnings("serial")
class AgeErrorException extends Exception{
	public AgeErrorException() {
		super("나이 입력이 잘못 되었어요.");
	}
}

public class Ex06DeveloperDefine {

	public static void main(String[] args) {
		
		System.out.print("나이를 입력하세요 : ");
		
		try {
			//AgeErrorException예외객체를 throw하면 여기서 예외처리ㅈ됨
			int age = readAge();
			System.out.println("당신의 나이는 "+age+"입니다.");
		} catch (Exception e) {
			System.out.println("[예외발생]"+e.getMessage());
		}
	}
	
	public static int readAge() throws AgeErrorException{
		Scanner sc = new Scanner(System.in);
		int inputAge = 0;
		
		try {
			//나이입력시 문자를 잘못 입력할 경우 예외처리
			inputAge = sc.nextInt();
		} catch (InputMismatchException e) {
			e.printStackTrace();
			System.exit(0);
		}
		/*
		 음수는 JVM에서 감지하지 못하기때문에 
		 if문으로 감지후 개발자 정의 예외객체 생성 후 직접 throw함
		 */
		if(inputAge < 0) {
			AgeErrorException ex = new AgeErrorException();
			/*throw시 catch를 하지않으면 프로그램 종료됨*/
			throw ex;
		}
		
		return inputAge;
		
	}

}

