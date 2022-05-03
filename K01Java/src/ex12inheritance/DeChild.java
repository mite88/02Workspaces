package ex12inheritance;

//자식클래스
public class DeChild extends DeParent{
	//멤버변수
	String stNumber;
	
	//생성자
	public DeChild(String name, int age, String stNumber) {
		super(name, age);//부모객체 먼저생성
		this.stNumber = stNumber;
	}
	
	//멤버메서드
	public void study() {
		//부모클래스에서 private로 선언된 멤버변수를 getter메서드로 불러옴
		System.out.println(getName()+"이(가) 공부한다");
	}
	
	//제어자가 private이기때문에 오버라이딩이 안됨 
	private void eat() {
		System.out.println("학생이 먹는다");
	}
	
	//제어자의 경우 부모보다 같거나 넓은범위만 오버라이딩 대상
	@Override
	public String sleep() {
		System.out.println("학생이 잔다");
		return null;
	}
	
	/*
	오버로딩메서드
	매개변수, 리턴타입이 다르므로 오버로딩
	 */
	public int walk(int age) {
		System.out.println("나이가 "+age+"살인 학생이 산책한다");
		return 0;
	}
	
	@Override
	public void exceise() {
		System.out.println("학생이 운동한다");
	}
	
	@Override
	public void printParent() {
		/*
		super.멤버 : 부모의 멤버메서드 or 변수에 접근 
		*/
		super.printParent();
		System.out.printf(", 학번%s%n", stNumber);
	}
	
	//static는 접근이 어느곳이나 가능하기 때문에 오버라이딩 대상이 아니다
	public static void staticMethod() {
		System.out.println("학생의 정적메소드");
	}
	
}
