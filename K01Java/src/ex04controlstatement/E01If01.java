package ex04controlstatement;

import java.io.IOException;

public class E01If01 {

	public static void main(String[] args) throws IOException{
		/*
		
		 조건문(비교식 or 논리식) - if 
		 
		  // 결과가 true이거나 false가 아닌 일반 산술식은 사용불가
		  // 실행문장이 하나인 경우 중괄호 생략가능 
		   * 
		 if(조건식) {  
		
		  실행문장;
		}
		 */
		
		int num =10;
		
		/*
		 if(num%2) {
			System.out.println("잘못된 조건식입니다.");
		}
		
		if(num) {
			System.out.println("이것도 잘못된 조건식입니다.");
		}
		*/
		
		if (num % 2 == 0) {
			System.out.printf("%d는 짝수입니다", num);
		}
		
		if(num % 2 == 0 && num >= 10) {
			System.out.printf("%n%d는 짝수이고 10보다 크거나 같다. %n", num);
		}
		
		if(true) {
			System.out.println("무조건 실행되는 if문입니다.");
		}
		
		if(num % 2 != 0); //문장이 끝나버려서 아래가 실행되어버림 
		{
			System.out.printf("%d는 홀수입니다.", num);	
		}
		
		if (num % 2 == 0) System.out.println("\n"+ num+"은 짝수이다.");
		
		if( num % 2 != 0) {
			System.out.println("num은"+num+"입니다.");
			System.out.println(num+"은 홀수입니다.");
		}
		
		/*
		 시나리오
		 
		 사용자가 입력한 문자가 숫자인지 판단하는 
		 프로그램을 if문을 이용하여 작성하시오.
		 */
		
		System.out.println("하나의 문자를 입력하세요");
		//문자하나를 입력할때쓰는 메소드 예외처리해야함(2글자입력해도 첫글자만입력됨)
		int asciiCode = System.in.read(); 
		System.out.println("입력한 문자는:"+asciiCode); //아스키 코드가 나옴

		//아스키코드로
		if(asciiCode >=48 && asciiCode <= 57) {
			System.out.println("입력한 문자는 숫자입니다");
		}else {
			System.out.println("입력한 문자는 숫자가 아닙니다");
		}
		
		//아스키코드를 모를때
		if(asciiCode >='0' && asciiCode <= '9') {
			System.out.println("입력한 문자는 숫자입니다[1]");
		}else {
			System.out.println("입력한 문자는 숫자가 아닙니다[1]");
		}
	}

}
