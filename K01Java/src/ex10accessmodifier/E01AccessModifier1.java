package ex10accessmodifier;
/*
* 클래스의 경우 public , default만사용가능
*/
/*private class PrivateClass1{
	void myFunc() {
		System.out.println("PrivateClass1클래스의 myFunc()메서드 호출");
	}
}*/

//default : 같은 패키지(폴더)에 있는 객체들만 허용(생략되어있다면 default임)
class DefaultClass1{
	void myFunc() {
		System.out.println("DefaultClass1클래스의 myFunc()메서드 호출");
	}
}
//public : 모든 접근허용
/*
public 클래스는 하나의 자바파이일에 단 하나만 정의 가능함
*/
public class E01AccessModifier1 {

	//멤버변수
	private int privateVar;//private : 현재 객체 내에서만 허용
	int defaultVar;
	public int publicVar;
	
	//멤버메서드들....
	
	//동일한 클래스내에서는 private멤버라 해도 접근가능
	private void privateMethod() {
		privateVar = 100;
		System.out.println("privateMethod() 메서드 호출");
	}
	
	void defaultMethod() {
		defaultVar = 200;
		System.out.println("defaultMethod() 메서드 호출");
	}
	
	public void publicMethod() {
		publicVar = 300;
		System.out.println("publicMethod() 메서드 호출");
		privateMethod();
	}
}
