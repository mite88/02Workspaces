package ex12inheritance;
/*
연습문제]  AnimalDog 클래스 정의
	강아지를 표현한 클래스 
	- Dog is a Animal이 성립하므로 상속관계로 표현하기에 
		적합한 모델
	
	멤버변수
		강아지의종류 : 푸들, 포매라니안 등 -> dogKind
		이름 -> name
	멤버메소드
		bark() : 강아지가 짖는것을 표현
			출력결과 : 이름이 XX이고 종(포유류)이 
				YY인 강아지가 짖는다.
		showDog() : 강아지의 현재상태(멤버변수)를 출력하는 
			메소드
	인자생성자
		: 부모클래스까지 초기화할수 있도록 구성할것
 */


public class AnimalDog extends Animal{
	//멤버변수
	private String dogKind; //종
	private String name; //이름

	
	//생성자
	public AnimalDog(String species, int age, String gender, String dogKind, String name) {
		super(species, age, gender);
		this.dogKind = dogKind;
		this.name = name;
	}


	//강아지가 짖는것을 표현
	/*
	출력결과 : 이름이 XX이고 종(포유류)이 
				YY인 강아지가 짖는다.
	*/
	public void bark() {
		System.out.println("이름이 "+name+"이고 종("+getSpecies()+")이 "
				+dogKind+"인 강아지가 짖는다.");
		
	}

	//강아지의 현재상태(멤버변수)를 출력하는 메소드
	public void showDog() {
		showAnimal();
		System.out.println("종류는:"+dogKind);
		System.out.println("이름은:"+name);
	}

}
