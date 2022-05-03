package ex16exception;

import java.io.IOException;

public class Ex03ExceptionCase2 {
	/*
	가장많이쓰는방식
	
	예외가 발생한 지점에서 예외를 직접처리
	try~catch문을 통해 예외가 발생될 수 있는 지점을 명시적으로 알수 있음
	*/

	static void compileFunc() throws IOException{
		System.out.print("하나의 문자를 입력하세요:");
		int userChr = System.in.read();
		System.out.println("입력한 문자는 : "+(char)userChr);
	}
	public static void main(String[] args) throws IOException {
		compileFunc();
	}

}
