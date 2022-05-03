package ex04controlstatement;

import java.io.IOException;

public class Qu_04_01 {

	public static void main(String[] args) throws IOException {
		/*
		 하나의 문자를 입력받아 숫자인지 여부를 판단하는 프로그램을 삼항연산자를 이용하여 구현하시오.	
		(System.in.read()를 사용하세요)
		
		실행결과] 아래는 2번 실행하였습니다.
		
		하나의 문자를 입력하세요:a
		숫자가아닙니다
		하나의 문자를 입력하세요:7
		숫자입니다
		*/
		
		System.out.print("하나의 문자를 입력하세요:");
		int char_one= System.in.read();
	
		//삼항 연산자  - 조건?참:거짓;
		System.out.println((char_one >='0' && char_one<='9') ? "숫자입니다": "숫자가 아닙니다");
		

	}

}
