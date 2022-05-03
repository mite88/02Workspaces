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
class AgeErrorException2 extends Exception {
	public AgeErrorException2() {
		super("나이 입력이 잘못 되었어요.");
	}
}

public class Ex06DeveloperDefine2 {

	public static void main(String[] args) throws AgeErrorException2 {

		System.out.print("나이를 입력하세요 : ");

		int age = readAge();
		System.out.println("당신의 나이는 " + age + "입니다.");

	}

	public static int readAge() throws AgeErrorException2 {
		Scanner sc = new Scanner(System.in);
		int inputAge = 0;

		try {
			// 나이입력시 문자를 잘못 입력할 경우 예외처리
			inputAge = sc.nextInt();
		} catch (InputMismatchException e) {
			e.printStackTrace();
			System.exit(0);
		}

		//개발자 정의 예외객체를 던지면 해당 지점에서 즉시 try~catch로 묶어 예외처리
		try {
			if (inputAge < 0) {
				AgeErrorException2 ex = new AgeErrorException2();
				/* throw시 catch를 하지않으면 프로그램 종료됨 */
				throw ex;
			}
		} catch (AgeErrorException2 e) {
			System.out.println(e.getMessage());
		}
		return inputAge;

	}

}
