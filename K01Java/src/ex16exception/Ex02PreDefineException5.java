package ex16exception;

public class Ex02PreDefineException5 {
	
	public static void main(String[] args)  {	
	 
		System.out.println("### ArithmeticException ###");
		int result = 10;
		try {
			//0으로 나누면 무한대가 되는데 이처럼 연산불능 상태가 되면 예외가 발생
			result = result / 0;
			System.out.println("결과는:"+ result);
		}
		catch(ArithmeticException e) {
			System.out.println("0으로 나눌수 없습니다.");
			System.out.println("예외메세지:"+ e.getMessage());
		}
				 
	}////end of main	
	 
}


