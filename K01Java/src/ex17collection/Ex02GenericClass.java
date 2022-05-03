package ex17collection;

class Apple {
	int weight;

	public Apple(int w) {
		this.weight = w;
	}

	public void showInfo() {
		System.out.println("사과의 무게는 " + weight + " 입니다.");
	}
}

class Banana {
	int suger;

	public Banana(int s) {
		this.suger = s;
	}
	
	public void showInfo() {
		System.out.println("바나나의 당도는 " + suger + " 입니다.");
	}

}

/*
제네릭 클래스로 변경함
자료형에 해당하는 부분을 타입매개변수로 교체
객체 생성 시 자료형을 결젱하기위해 클래스명<T> 형태로 변경
*/
class GenericFruitBox<T> {
	T item;

	public void store(T item) {
		this.item = item;
	}

	public T pullOut() {
		return item;
	}
}

public class Ex02GenericClass {

	public static void main(String[] args) {
		//Box 인스턴스 생성시 T부분을 결정하였기에 구현의 편의성 보장
		//Apple, Banana 객체를 저장할 수 있는 인스턴스 생성됨
		GenericFruitBox<Apple> appleBox = new GenericFruitBox<Apple>();
		appleBox.store(new Apple(0));
		Apple apple = appleBox.pullOut();
		apple.showInfo();
		
		GenericFruitBox<Banana> bananaBox = new GenericFruitBox<Banana>();
		bananaBox.store(new Banana(20));
		Banana Banana = bananaBox.pullOut();
		Banana.showInfo();
		
		/*
		orangeBox는 인스턴스 생성시 Orange를 저장할 수있는 용도로 
		생성되어 다른객체 저장안됨
		
		그래서 컴파일 에러가 나므로 자료형에도 안전한 코드다
		 */
		GenericFruitBox<Orange> orangeBox = new GenericFruitBox<Orange>();
		//Orange.store("나는 오렌지");
		//Orange.store(apple);
		//Orange.store("나는 banana");
		

	}

}
