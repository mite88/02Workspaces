package ex11static;

public class E02StaticBlockMain {

	//인스턴스형 멤버
	int instanceVar;
	void instanceMethod() {}
	
	//정적 멤버
	static int staticVar;
	static void staticMethod() {
		int localVar;
		System.out.println("정적메서드");
	}
	
	//static 블럭
	/*
	동일 클래스내의 main() 메서드 보다 먼저 실행되는 블럭
	(생성자 메서드보다도 먼저실행됨)
	*/
	static {
		//블럭내에서 정적멤버 접근 가능
		staticVar = 1000;
		
		int localVar; //지역변수가 되었음
		localVar= 1000;
		System.out.println("localVar="+localVar);
		
		//static블럭내에서는 인스턴스형 멤버에 접근 불가
		//System.out.println("instanceVar="+instanceVar);
		//instanceMethod();
		
		System.out.println("staticVar="+staticVar);
		staticMethod();
		
		System.out.println("====static block 끝====");
	}
	
	//생성자 메서드 
	public E02StaticBlockMain() {
		//생성자에서는 정적변수 접근 가능
		staticVar= -1;
		System.out.println("==StaticBlock의 생성자==");
	}
	public static void main(String[] args) {
		System.out.println("==메인메서드==");
		//static블럭 내의 지역변수이므로 에러
		//System.out.println("localVar="+localVar); 
		
		new E02StaticBlockMain();
	}

}
