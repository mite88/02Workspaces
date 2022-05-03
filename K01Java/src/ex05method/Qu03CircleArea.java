package ex05method;

public class Qu03CircleArea {

	/*
	반지름이 10인 원의 넓이를 구해 출력하시오.
	단, 넓이의 타입을 int, double형 두가지로 선언하여 각각 출력해야한다.
	변수명] 
		int형 : area_int
		double형 : area_double
	공식]
		원의넓이 = 반지름 * 반지름 * 3.14
	실행결과]
	int형 넓이:314
	double형 넓이:314.0
	*/
	public static void main(String[] args) {
		int area_int=10;
		double area_double=10.0;
		
		System.out.println("int형 넓이:"+int_circleArea(area_int));
		System.out.println("double형 넓이:"+double_circleArea(area_double));

	}
	
	static int int_circleArea(int area_int) {
		return (int)(area_int * area_int * 3.14);
	}
	
	static double double_circleArea(double area_double) {
		return (area_double * area_double * 3.14);
	}

}
