package ex16exception;

import java.util.Scanner;

public class Ex02PreDefineException2 {

	public static void main(String[] args) {
		System.out.println("### NumberFormatException ###");
		Scanner sc = new Scanner(System.in);
		try {
			System.out.print("나이를 입력하세요:");
			//정수가 아닌 다른 문자열 입력시 정수로 변환이 안되니 예외발생
			String strAge = sc.nextLine();
			int ageAfter10 = Integer.parseInt(strAge) + 10;
			System.out.println("당신의 10년후 나이는 : "+ageAfter10);
		} catch (NumberFormatException e) {
			System.out.println("나이는 숫자로만 입력해야 합니다.");
			System.out.println("예외메세지:"+e.getMessage());
			e.printStackTrace();
		}
	}

}
