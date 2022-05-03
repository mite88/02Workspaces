package ex12inheritance;
/*
다형성(Polymorphism)
같은 타입의 참조변수를 통해 다양한 객체를 이용할수있는 속성
단, 객체간의 상속관계시 성립

- 부모참조변수 -> 자식객체 참조(이질화:Heterogenous)
: 부모타입의 참조변수는 부모로부터 상속받은 멤버까지 접근
: 자식에서 오버라이딩한 메서드 우선 호출
: 자식에서 새롭게 정의한 멤버 접근x(부모멤버까지 접근하기에...)

- 같은 타입의 참조변수로 객체 참조(동질화:Homogenous)
: 객체 전체 접근
*/

//부모클래스
class Parent{
	int parentMember;

	void ParentMethod() {
		System.out.println("부모의 메서드:ParentMethod()");
	}
	
}

//자식클래스
class Child extends Parent{
	int childMember; //확장한 멤버변수
	
	//확장한 멤버메서드
	void childMethod() {
		System.out.println("자식의 메서드:childMethod()");
	}
	
	//부모에서 정의한 메서드 를 오버라이딩
	@Override
	void ParentMethod() {
		System.out.println("자식에서 Overriding한 메소드"
				+ "ParentMethod()");
	}
	
	//오버로딩
	void parentMethod(int childMember) {
		this.childMember = childMember;
		System.out.println("Overriding:자식에서 확장한 메서드"
				+ ":parentMethod(int childMember)");
	}
}
public class E11Polymorphism {

	public static void main(String[] args) {
		//동질화의 경우 객체 전체에 접근 가능
		System.out.println("[자식으로 자식객체 참조 - 동질화]");
		Child homechild = new Child();
		homechild.childMember = 10; //자식 멤버변수
		homechild.parentMember = 100;//부모 멤버변수 
		homechild.childMethod(); //자식 멤버메서드
		homechild.parentMethod(100); //오버로딩한 메서드
		homechild.ParentMethod();//부모 멤버메서드
		
		
		//이경우 자식에서 새롭게 정의한 멤버엔 접근불가 
		//접근시 강제 형변환시켜야함
		System.out.println("[부모로 자식객체 참조 - 이질화]");
		Parent parent1 = new Parent();
		parent1.parentMember = 1;//부모 멤버변수 
		//parent1.childMember = 1;//부모타입으로 자식멤버접근 불가
		parent1.ParentMethod();//오버라이딩한 메서드로 자식이 호출
		
		//두번째 참조변수 생성, 부모타입으로 자식객체 참조
		Parent parent2 = new Child();
		parent2.parentMember = 1;
		parent2.ParentMethod();
		
		//부모참조변수로 자식객체 접근시 다운캐스팅으로 자식객체 접근
		/*
		(Child)parent2.childMember (x) 
		: 이경우 parent2가 Parent 타입인데 자식멤버변수를 접근하려해서
		에러가 난다
		
		그래서 아래와 같이 Child타입으로 먼저 형변환 후 접근해야함
		 */
		((Child)parent2).childMember =1;
		((Child)parent2).childMethod();
		((Child)parent2).ParentMethod();
		
		Child child2 = (Child) parent2; 
		child2.childMember = 1;
		child2.childMethod();
		child2.parentMethod(1);
		
		/*
		 java에서 생성한 모든 클래스는 Object 클래스를 상속하여 
		 모든객체에 참조 가능하며 별도의 선언없이 사용 가능함
		 */
		System.out.println("[클래스의 끝판왕 Object]");
		Object object = new Child();
		((Parent)object).ParentMethod();
	}

}
