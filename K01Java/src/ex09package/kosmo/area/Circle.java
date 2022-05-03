package ex09package.kosmo.area;

//원의 넓이 area패키지에 정의
public class Circle {
	double red;
	final double PI;
	
	public Circle(double red) {
		this.red = red;
		PI = 3.14;
	}
	
	public double getArea() {
		return PI * red * red;
	}
}
