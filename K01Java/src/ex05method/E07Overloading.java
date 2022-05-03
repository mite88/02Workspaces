package ex05method;

public class E07Overloading {

	/*
	메서드 오버로딩
	같은 이름을 갖고 있지만, 
	서로 다른 매개변수 형식을 가지고 있는 메서드를 여러 개 정의하는 것.
	 
	<조건>
	메서드의 이름이 같아야 한다.
    메서드의 리턴타입이 다른 경우는 오버로딩이 성립되지 않는다.
    매개변수의 개수 or 매개변수의 자료형이 달라야 한다. 
    
    * 메소드 오버로딩의 대표적인 예) println() 메소드
    println() 메소드는 전달받는 매개변수의 타입에 따라 
    다양한 원형 중에서 적절한 원형을 호출
	*/
	
	static void person(int juminNum, int milNum) {
		System.out.println("군필자 이시군요");
		System.out.println("주민번호:"+juminNum);
		System.out.println("군번:"+milNum);
	}
	
	static void person(int juminNum) {
		System.out.println("미필자이거나 여성이시군요");
		System.out.println("주민번호:"+juminNum);
	}
	
	/*
	//메서드의 리턴타입이 다른 경우는 오버로딩이 성립되지 않는다.
	static int person(int juminNum) {
		System.out.println("미필자이거나 여성이시군요");
		System.out.println("주민번호:"+juminNum);
	}
	*/

	public static void main(String[] args) {
		//매개변수가 2개인 메서드 호출
		person(123456,7890123);
		System.out.println("=======================");
		//매개변수가 1개인 메서드 호출
		person(987654);

	}
	
}
