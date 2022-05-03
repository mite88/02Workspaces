package ex16exception;

import java.io.IOException;

public class Ex01ExceptionBasic1 {

	public static void main(String[] args) {
		//Syntax에러 : 구분에러
//		Int number = 10;
//		if(true);
//		{}
//		else
//		{}
		
		//위 코드를 정상적으로 수정 한거...
		int number = 10;
		if(true) {
			System.out.println("참이다");
		}else {
			System.out.println("거짓이다");
		}
		
		System.out.print("문자하나를 입력하세요:");
		
		/*
		외부자원을 사용할때 발생되는 에러 무시하는법
		방법1:예외던지기 수행 - main메서드에 throw 예외명
		방법2:try~cathch문 - 예외 발생지점에서 예외처리
		*/
		try {
			int iChar = System.in.read();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
