package ex11static;

class MyStatic{
	
	//인스턴스형 멤버변수는 클래스의 객체 생성 후 참조변수 접근
	int instanceVar;
	//정적변수는 객체 생성없이 클래스명으로 바로 접근(이미 메서드에 할당)
	static int staticVar;
	
	//인스턴스형 멤버메서드:모든멤버 사용가능 
	void instanceMethod() {
		System.out.println("instanceVar="+instanceVar);
		System.out.println("staticVar="+staticVar);
		staticMethod();
	}
	
	//정적 멤버메서드 : 정적멤버만 사용가능
	static void staticMethod() {
		//System.out.println("instanceVar="+instanceVar);
		System.out.println("staticVar="+staticVar);
		//instanceMethod();
	}
	
}

public class E01StaticModifier {

	public static void main(String[] args) {
		MyStatic myStatic =new MyStatic();
		myStatic.instanceVar =100; //heap 접근
		System.out.println("myStatic.instanceVar="+myStatic.instanceVar);
		//보통 static는 이텔리체로 되어있음
		MyStatic.staticVar = 200; //static변수로 Method영역
		System.out.println("MyStatic.staticVar"+MyStatic.staticVar);
		
		myStatic.staticVar =300; //접근은되지만 권장은아님
		System.out.println("myStatic.staticVar="+myStatic.staticVar);
		
		System.out.println("====================================");
		
		MyStatic ms1 = new MyStatic();
		MyStatic ms2 = new MyStatic();
		
		ms1.instanceVar = 100;
		ms2.instanceVar = 1000;
		System.out.println("ms1.instanceVar="+ms1.instanceVar); //100
		System.out.println("ms2.instanceVar="+ms2.instanceVar); //1000
		
		//권장사항은아님
		/*
		 정적변수는 메서드영역에 하나만 생성되서 어디로 접근하든 
		 동일한 메모리에 접근= 출력값 같음
		 */
		ms1.staticVar = 800;
		ms2.staticVar = 900;

		System.out.println("ms1.staticVar="+ms1.staticVar);//900
		System.out.println("ms2.staticVar="+ms2.staticVar);//900
		
		myStatic.instanceMethod();
		myStatic.staticMethod();
		
		//MyStatic.instanceMethod();
		MyStatic.staticMethod();
	}

}
