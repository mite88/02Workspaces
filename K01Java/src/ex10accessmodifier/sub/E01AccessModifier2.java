package ex10accessmodifier.sub;

/*E01AccessModifier1이랑 패키지명말곤 구조가같으니 생략함*/
class DefaultClass2 {
	void myFunc() {
		System.out.println("DefaultClass2클래스의 myFunc()메서드 호출");
	}
}

public class E01AccessModifier2 {

	private int privateVar;
	int defaultVar;
	public int publicVar;

	private void privateMethod() {
		privateVar = 400;
		System.out.println("privateMethod() 메서드 호출");
	}
	
	void defaultMethod() {
		defaultVar = 500;
		System.out.println("defaultMethod() 메서드 호출");
	}
	
	public void publicMethod() {
		publicVar = 600;
		System.out.println("publicMethod() 메서드 호출");
		privateMethod();
	}
}


