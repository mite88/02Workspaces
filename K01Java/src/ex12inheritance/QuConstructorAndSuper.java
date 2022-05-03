package ex12inheritance;

/*
상속관계에 놓여있는 클래스의 생성자 정의 및 
호출방식을 기본으로 다음 클래스의 적절한 생성자를 삽입해보자. 
그리고 이의 확인을 위한 main 메소드도 적절히 정의해보자.

*/
class Car {
	int gasoline;

	//객체 생성문장을 통해 1개의 매개변수를 가진 생성자 메서드 정의
	public Car(int gasoline) {
		this.gasoline = gasoline;//해당클래스멤버변수를 초기화
	}

}

class HybridCar extends Car {
	int electric;

	//객체 생성문장을 통해 2개의 매개변수를 가진 생성자 메서드 정의
	public HybridCar(int gasoline, int electric) {
		//부모생성자 1개 매개변수 전달
		super(gasoline);
		this.electric = electric;//해당클래스멤버변수를 초기화
	}

}

class HybridWaterCar extends HybridCar {
	int water;

	//객체 생성문장을 통해 3개의 매개변수를 가진 생성자 메서드 정의
	public HybridWaterCar(int gasoline, int electric, int water) {
		//부모생성자 2개 매개변수 전달
		super(gasoline, electric);
		this.water = water; //해당클래스멤버변수를 초기화
	}

	public void showNowGauge() {
		System.out.println("남은가솔린:" + gasoline);
		System.out.println("남은전기량:" + electric);
		System.out.println("남은워터량:" + water);
	}
}

/*
상속구조라 할지라도,클래스 개별적으로 
객체생성 및 멤버변수를 초기화 하는 구조로 가는것이 좋음
*/
public class QuConstructorAndSuper {

	public static void main(String[] args) {
		HybridWaterCar hcar = new HybridWaterCar(10, 20, 30);
		hcar.showNowGauge();
	}
}
