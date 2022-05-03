package ex13interface;
//추상클래스 1 : 추상메서드 x(abstract 지워도 상관없음)
abstract class AbsClass1{
	//int 형의 최대값을 반환하는 Wrapper클래스의 상수를 저장
	public static final int MAX_INT = Integer.MAX_VALUE; 
	
	//멤버메서드
	void instanceMethod() {}
	//정적멤버메서드
	static void staticMethod(){}
}

class AbsClassChild1 extends AbsClass1{
	//오버라이딩
	/*
	추상메서드를 포함하지 않은 추상메서드 상속시 오버라이딩은 선택사항
	(아래 오보라이딩 한 메서드는 지워도 에러가 나지않음)
	*/
	@Override
	void instanceMethod() {
		System.out.println("선택적 오버라이딩");
	}
}

//추상클래스2 : 추상메서드 포함
/*
추상메서드를 멤버로 포함한 클래스의 경우 반드시 abstract로 선언
*/
abstract class AbsClass2{
	abstract void absMethod(int number); //추상메서드는 실행부가 없음 
}

/*
 위 부모클래스 상속시 부모가 가진 추상메서드도 상속되어 해당 클래스도 abstract로 선언
 이경우 해당 클래스로도 객체 생성 x
 
 그래서 자식쪽에서 오버라이딩을 하여 생성한다
 */
class AbsClassChild2 extends AbsClass2{

	//오버라이딩으로 재정의하여 해당 자식클래스는 추상메서드를 포함하지 않게 됨(필수)
	@Override
	void absMethod(int number) {
		System.out.println("필수 오버라이딩");
	}
	
	void newMethod() {
		System.out.println("확장된 메서드");
	}
	
}

public class E01AbstractBasic {
	public static void main(String[] args) {
		//추상클래스는 객체 생성x
		//AbsClass1 absClass1 = new AbsClass1();
		//추상클래스를 상속한 하위클래스는 가능
		AbsClassChild1 absClassChild1 = new AbsClassChild1();
		
		//추상클래스는 객체(인스턴스) 생성이 안되지만 참조변수는 가능함
		AbsClass2 absClass2 = new AbsClassChild2();
		absClass2.absMethod(100);
		((AbsClassChild2)absClass2).newMethod(); //다운캐스팅을 통해 자식객체 접근
		
		//static는 역시나 어디서나 참조가능
		AbsClass1.staticMethod();
		AbsClassChild1.staticMethod();
		System.out.println("int형의 최대값:"+AbsClass1.MAX_INT);
	}
}
