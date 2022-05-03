package ex12inheritance;

public class E07RideAndLoad02 {

	public static void main(String[] args)  {
		//err사용시 콘솔에빨간색으로 출력됨
		System.err.println("Child형 참조변수로 Child객체 참조");
		DeChild child = new DeChild("율곡이이", 49, "00학번");
		
		//오버라이딩 처리된 메서드라 참조변수 상관없이 자식 메서드에 호출됨
		child.exceise();
		child.sleep();
		child.printParent();
		
		child.study();//자식에서 확장(부모x)
		//오버로딩
		child.walk(); //부모 
		child.walk(25);//자식
		
		//static제어자 : 클래스명을 통해 호출
		DeChild.staticMethod();
		
		System.out.println("======================");
		
		System.err.println("Parent형 참조변수로 Child객체 참조");
		DeParent parent = 
				new DeChild("퇴계이황", 35, "99학번");//상속관계라가능
		
		//오버라이딩된 메서드이므로 부모클래스 참조상관없이 자식쪽이 출력됨
		parent.exceise();
		parent.sleep();
		parent.printParent();
		
		//부모클래스를 참조하였으므로 자식영역은 참조가 불가함
		//parent.study();
		parent.walk();
		//parent.walk(25);
		
		//static제어자 : 클래스명을 통해 호출
		parent.staticMethod();
		
	}

}
