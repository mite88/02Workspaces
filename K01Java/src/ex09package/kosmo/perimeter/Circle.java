package ex09package.kosmo.perimeter;

//원의둘레 perimeter패키지에 정의
public class Circle {
	double red;//반지름
	final double PI; //원주율
	
	//생성자
	public Circle(double red) {
		this.red = red;
		PI = 3.14; //생성자에선 초기화가 가능
	}
	
	//둘레구하기
	public double getPerimeter() {
		return 2 * PI * red;
	}
	
	
}
