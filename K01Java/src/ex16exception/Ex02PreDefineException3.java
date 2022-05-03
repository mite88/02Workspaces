package ex16exception;

import java.util.InputMismatchException;
import java.util.Scanner;

public class Ex02PreDefineException3 {
	public static void main(String[] args) {
		System.out.println("### InputMismatchException ###");
		Scanner sc = new Scanner(System.in);
		try {
			System.out.print("나이를 입력하세요:");

			int strAge = sc.nextInt();
			int ageAfter10 = strAge + 10;
			System.out.println("당신의 10년후 나이는 : "+ageAfter10);
		} catch (InputMismatchException e) {
			System.out.println("나이는 문자형태로 입력하면 앙데요 ㅇ0ㅇ");
			System.out.println("예외메세지:"+e.getMessage());
			e.printStackTrace();
		}
	}
}
