package ex08Class;
/*
밑변과 높이 정보를 저장할 수 있는 Triangle클래스를 정의해보자
init메소드를 통해 밑변과 높이를 초기화한다.
그리고 밑변과 높이를 변경시킬수 있는 
메소드와 삼각형의 넓이를 계산해서 반환하는 메소드도 함께 
정의해보자.


삼각형의 넓이 : 85.0
삼각형의 넓이 : 350.0

*/

class Triangle{
	int underside;
	int height;

	public void init(int u, int h) {
		underside=u;
		height=h;
	}

	//밑면
	public void setBottom(int set_bottom) {
		underside = set_bottom;
	}

	//높이
	public void setHeight(int set_height) {
		height =set_height;
	}

	//넓이
	public double getArea() {
		//밑변*높이 /2
		double area = (underside * height) /2;
		return area;
	}
	
}

public class QuTriangle {
	public static void main(String[] args)
	{
		Triangle t = new Triangle();
		t.init(10, 17); //밑변10, 높이17로 초기화
		System.out.println("삼각형의 넓이 : " + t.getArea());
		t.setBottom(50);//밑변 50으로 변경
		t.setHeight(14);//높이 14로 변경
		System.out.println("삼각형의 넓이 : " + t.getArea());
	}

}