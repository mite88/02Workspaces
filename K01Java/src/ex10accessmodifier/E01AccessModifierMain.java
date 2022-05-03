package ex10accessmodifier;

import ex10accessmodifier.sub.E01AccessModifier2;

public class E01AccessModifierMain {

	public static void main(String[] args) {
		System.out.println("E01AccessModifierMain1 객체 생성 및 접근");
		
		E01AccessModifier1 one = new E01AccessModifier1();
		
		//private : 같은객체내에서만 사용가능하므로 에러걸림
		
		//System.out.println("one.privateMethod="+one.privateVar);
		System.out.println("one.defaultVar="+one.defaultVar);
		System.out.println("one.publicVar="+one.publicVar);
		/*
		private로 선언된 멤버에 외부클래스에서 접근하려면 public로
		선언된 멤버메서드를 통해 간접적으로 접근해야함
		여기선 publicMethod()를 통해 접근했음
		*/
		
		//one.privateMethod();
		one.defaultMethod();
		one.publicMethod();
		
		System.out.println("DefaultClass 객체 생성 및 접근");
		new DefaultClass1().myFunc();
		
		System.out.println("=================================");
		/*private : 같은객체내에서만 사용가능하므로 에러걸림
		  default : 같은패키지 내에서만 사용가능
		*/
		
		
		E01AccessModifier2 two = new E01AccessModifier2();
		//System.out.println("two.privateMethod="+two.privateVar);
		//System.out.println("two.defaultVar="+two.defaultVar);
		System.out.println("two.publicVar="+two.publicVar);
		
		//two.privateMethod();
		//two.defaultMethod();
		two.publicMethod();
		
		System.out.println("DefaultClass 객체 생성 및 접근");
		//new DefaultClass2().myFunc(); 
	}

}
