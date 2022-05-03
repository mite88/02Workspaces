package ex09package;

//동일한 이름의 클래스 사용시 둘다 임포트를 못하기에 하나만 함
import ex09package.kosmo.perimeter.*;


public class CircleMain {

	public static void main(String[] args) {
		//넓이 - 풀경로를 통해 객체생성
		ex09package.kosmo.area.Circle circle1=
		 new ex09package.kosmo.area.Circle(6.5);
		
		System.out.println("반지름이 6.5인 원의넓이 : "
		+ circle1.getArea());
		
		//둘레 - import이용
		Circle circle2= new Circle(4.5);

		System.out.println("반지름이 4.5인 원의둘레 : "
		+ circle2.getPerimeter());
	}
}
