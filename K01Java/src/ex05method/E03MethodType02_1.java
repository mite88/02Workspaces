package ex05method;

public class E03MethodType02_1 {
	/*
	 * 형태2] 매개변수X 반환값O
	 * 사용자로부터 입력값 받고 결과값을 반환하는형태의 기능시 사용
	 */
	
	static int noParamYesReturn() {
		
		int sum = 0;
		for (int i = 0; i <= 10; i++) {
			sum += i;
			
		}
		
		return sum;
	}
	
	
	public static void main(String[] args) {

		//반환값이 있는 메서드는 주로 print(), 변수에 할당을 위해 코드의 우측에서 호출
		System.out.println("1~10까지의 합:"+noParamYesReturn());
		
		int sum10=noParamYesReturn();
		System.out.printf("1에서10까지의 합은 %d입니다", sum10);
	}

}
