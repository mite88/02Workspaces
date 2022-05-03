package ex05method;

import java.util.Scanner;

public class E03MethodType02_2 {
	/*
	 * 형태2] 매개변수X 반환값O
	 * 사용자로부터 입력값 받고 결과값을 반환하는형태의 기능시 사용
	 */
	
	static String getHakjum() {
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("국어점수:");
		int kor = scanner.nextInt();
		System.out.print("영어점수:");
		int eng = scanner.nextInt();
		System.out.print("수학점수;");
		int math = scanner.nextInt();
		
		double avg=(kor+eng+math) / 3.0;
		
		String hakjum="";
		
		int result=(int)avg / 10;
		
		switch (result) {
		case 10:case 9:
			hakjum ="A학점";
			break;
			
		case 8:
			hakjum ="B학점";	
			break;
					
		case 7:
			hakjum ="C학점";
			break;
			
		case 6:
			hakjum ="D학점";
			break;

		default:
			hakjum ="F학점";
			break;
		}
		
		return hakjum;
	}
	public static void main(String[] args) {
		System.out.println("너의 학점은 "+getHakjum()+"이얌~!");

		String h = getHakjum();
		System.out.printf("당신의 학점은 %s 입니다", h);
	}

}
