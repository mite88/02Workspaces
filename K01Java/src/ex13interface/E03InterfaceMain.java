package ex13interface;


/*
인터페이스
- 클래스의 설계도
- 다중상속 지원
- 추상클래스와 동일하게 상속을 목적으로 제작 -> 하위클래스에 오버라이딩
- 상수 및 추상메서드만 가능
  메서드 : public abstract
  상수 : public static final 
  *생성자 x
*/
interface MyInterface1{
	//public MyInterface1(){} //생성자 사용불가
	
	//멤버 상수 : 인터페이스에서 선언된 변수는 상수가 됨
	public static final int MAX_INT = Integer.MAX_VALUE;
	//그래서 public static final은 생략하는것 이 좋음
	double MAX_DBL = Double.MAX_VALUE; 
	
	//멤버메서드 : 추상메서드만 가능
	public abstract void absFunc1();
	//그래서 public abstract은 생략하는것 이 좋음
	void absFunc2();
}

interface MyInterface2{
	void absFunc2();
}

//보무클래스
class SimpleClass{
	int simple = 1;
	void MySimple(){
		System.out.println("simple="+simple);
	}
}

//인터페이스에선 다중 상족 지원, 상속과 같이 쓸수 있음
class MyClass extends SimpleClass implements MyInterface1, MyInterface2{

	//인터페이스와 동일한 이름의 추상메서드가 존재하는 경우 하나만 오버라이딩됨
	@Override
	public void absFunc1() {
		System.out.println("absFun1() 호출됨");
	}

	@Override
	public void absFunc2() {
		System.out.println("absFun2() 호출됨");
	}
	
}
public class E03InterfaceMain {

	public static void main(String[] args) {
		//MyClass의 부모는 MyInterface1, MyInterface2, SimpleClass 총3개
		MyInterface1 my1 = new MyClass();
		my1.absFunc1();
		my1.absFunc2();
		((SimpleClass)my1).MySimple(); //다운캐스팅시켜 자식멤버 접근
	}
}
