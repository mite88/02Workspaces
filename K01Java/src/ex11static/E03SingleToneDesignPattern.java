package ex11static;

/*
싱글톤(SingleTone) 패턴
어떤 클래스가 최초 한번만 메모리를 할당하고(Static) 
그 메모리에 객체를 만들어 사용하는 디자인 패턴

재 사용이 가능하며, 메모리 낭비를 방지

1. 생성자의 접근지정자를 private로선언
(클래스 외부에서 생성자를 접근할수 없어서 객체생성 x)
2. 클래스 내부에정적메서드로 해당 클래스의 객체를 반환하도록해준다
(getInstance())
4.이제 객체를 사용하면 된다. 그러면 메모리에 하나의 객체만 만들어진다.
*/

//일반적인클래스
class NoSingleTone{
	int instVar;
	public NoSingleTone() {}
}

//싱글톤
class SingleTone{
	//멤버변수
	int shareVar;
	//전역변수 선언에 static하므로써 main()실행전에 메서드영역에 할당함
	private static SingleTone single = new SingleTone();
	
	 //private는 객체내에서만가능하므로 new를통해 인스턴스를 얻을수 없다
	private SingleTone() {}
	
	//getInstance()메서드를통해 인스턴스를 얻을수 있음
	public static SingleTone getInstance() {
		return single;
	}
	
	void print() {
		System.out.println(String.format("shareVar=%d", shareVar));
	}
}

public class E03SingleToneDesignPattern {

	public static void main(String[] args) {
		
		//일반적 - 객체생성시 새로운 주소값을 할당받는 인스턴스가 됨
		NoSingleTone nst1= new NoSingleTone();
		nst1.instVar =100;
		System.out.println("nst1="+nst1);
		
		NoSingleTone nst2= new NoSingleTone();
		nst1.instVar =200;
		System.out.println("nst2="+nst2);
		
		//싱글톤
		//SingleTone st1 = new SingleTone(); //private로 하여 생성을 하지못하게 막음
		
		//정적메서드라서 클래스명으로 직접 호출 가능
		SingleTone st2 = SingleTone.getInstance();
		st2.shareVar = 100;
		st2.print();
		
		SingleTone st3 = SingleTone.getInstance();
		st3.shareVar = 200;
		st3.print();
		
		System.out.println(String.format("st2의 주소:%s", st2));
		System.out.println(String.format("st3의 주소:%s", st3));
	}

}
