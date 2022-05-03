package ex12inheritance;

public class DeParent {
	//멤버변수 : 정보은닉용 private
	private String name;
	private int age;
	
	//생성자
	public DeParent() {}
	public DeParent(String name, int age) {
		this.name=name;
		this.age=age;
	}
	
	//getter
	public String getName() {
		return name;
	}
	
	//멤버메서드 : 접근지정자를 통해 확인해보자
	private void eat() {
		System.out.println("부모님이 드신다");
	}
	
	String sleep() {
		System.out.println("부모님이 주무신다");
		return null;
	}
	protected void walk() {
		System.out.println("부모님이 산책하신다");
	}
	public void exceise() {
		System.out.println("부모님이 운동하신다");
	}
	
	//정보출력용
	public void printParent() {
		System.out.printf("성함:%s, 연새:%d", name, age);
	}
	public static void staticMethod() {
		System.out.println("부모님의 정적메소드");
	}
}
