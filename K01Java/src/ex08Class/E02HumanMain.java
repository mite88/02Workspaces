package ex08Class;

public class E02HumanMain {

	/*
	Human 클래스를외부파일로 선언함
	동일한 패키지내에 정의되어있다면 컴파일러는 해당클래스를 찾아
	즉시 인스턴화 한다.
	* 다른 패키지에 선언된 경우 import 선언을 해야함
	*/
	public static void main(String[] args) {

		//객체 생성 및 참조변수 선언
		Human human = new Human();
		
		//객체 초기화
		human.name = "마이클";
		human.age = 28;
		human.energy = 4;
		
		//멤버메서드 호출 : 행위 구현용
		human.showState();
		human.eat();
		human.walk();
		human.thinking();
		human.showState();
		
		//반복문을 통해 에너지 고갈시켜보기
		for (int i = 0; i <=20; i++) {
			human.walk();
		}
		human.showState();
		
		//반복문을통해 에너지 채우기
		for (int i = 0; i <=20; i++) {
			human.eat();
		}

		human.showState();

	}

}
