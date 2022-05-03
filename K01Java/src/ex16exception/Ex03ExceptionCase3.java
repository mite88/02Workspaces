package ex16exception;

import java.io.IOException;

public class Ex03ExceptionCase3 {

	/*
	예외가 발생한 지점이 아닌 메서드를 호출한 지점에서
	예외객체를 받은 후 처리하는 방법
	*/
	static void compileFunc() throws IOException{

		System.out.print("하나의 문자를 입력하세요:");
		int userChr = System.in.read();
		System.out.println("입력한 문자는 : "+(char)userChr);
		
	}
	public static void main(String[] args)  {
		
		try {
			compileFunc();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}

}
