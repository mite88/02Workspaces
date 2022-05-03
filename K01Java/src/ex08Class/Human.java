package ex08Class;

public class Human {

	/*
	다음에 주어진 조건으로 '사람'을 추상화하기
	
	- 속성 : 이름, 나이, 에너지
	- 행동 :걷는다, 생각한다, 먹는다, 현재상태표현
	- 행동의 조건 : 먹으면 2+, 걸으면 1-, 생각시 2-
	                단 , 에너지의 범위는 0~10이며 마이너스가 될수 없음
	*/
	
	String name; //이름
	int age; //나이
	int energy; //에너지
	
	//멤버메서드
	void walk() {
		energy--; //에너지 1감소
		
		//차감 후 0이하로 내려가지 않게 하기위한 조건문 작성
		if(energy < 0) {
			energy = 0;
			System.out.println("[walk]에너지는 0이 최소입니다.");
			System.out.println("0으로 고정됩니다");
		}else {
			System.out.println("[walk]에너지는 1감소하였습니다.");
		}
	}
	
	//멤버메서드
	void thinking() {
		energy -= 2;//에너지 2감소
		
		//차감 후 0이하로 내려가지 않게 하기위한 조건문 작성
		if(energy < 0) {
			energy = 0;
			System.out.println("[thinking]에너지는 0이 최소입니다.");
			System.out.println("0으로 고정됩니다");
		}else {
			System.out.println("[thinking]에너지는 2감소하였습니다.");
		}
	} 
	
	//멤버메서드
	void eat() {
		energy += 2; //에너지 2증가
		
		//차감 후 10이상으로 올라가지 않게 하기위한 조건문 작성
		if(energy > 10) {
			energy = 0;
			System.out.println("[eat]에너지는 10이 최대치입니다.");
			System.out.println("0으로 고정됩니다");
		}else {
			System.out.println("[eat]에너지는 2증가하였습니다.");
		}
	}
	
	//멤버메서드
	void showState() {
		System.out.println("===님의 현재상태는===");
		System.out.println("이름"+name);
		System.out.println("나이"+age);
		System.out.println("에너지"+energy);
		System.out.println("=====================");
	}
	
	public static void main(String[] args) {

	}

}
