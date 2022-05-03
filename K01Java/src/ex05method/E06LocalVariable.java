package ex05method;

public class E06LocalVariable {

	public static void main(String[] args) {
		boolean scope = true; 
		/*
		main 지역에서 num을 선언하면  이미 선언되어 메모리에 상주되어있기때문에
		if문안에서 지역변수인 같은 이름의 변수를 사용할수 없음
		*/
		//int num = 9; 
		
		
		//if와 else 안은 각각 다른 지역이므로 동일한 변수명 선언가능
		if(scope) {
			int num = 1; num++; 
			System.out.println("첫번째 if문 지역:"+ num);
		}else {
			int num = 5;
			System.out.println("첫번째 if문의 else지역"+ num);
		}
		
		/*if문의 블럭에서 선언된 num은 해당블롯을 벗어나면
		메모리에서 소멸되어 동일한 변수명 선언가능
		*/
		int num = 100; 
		System.out.println("main메서드지역:"+ num); 
		
		simpleFunc();

		System.out.println("main메서드 끝");
	}
		
		

	/*
	main에서 선언한 변수 num이 메모리에 상주되어있지만
	simpleFunc()메서드는 서로 다른 지역이기때문에 같은 변수명 선언가능
	*/
	private static void simpleFunc() {
		int num = 100; 
		System.out.println("main메서드지역:"+ num); 
	}
	
}