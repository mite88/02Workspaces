package ex13interface.figure;
//반지름만 알면넓이를 구할수 있으므로 FigureData를 상속하지 x
public class Circle implements IDrawable, IFigure{
	
	int radius;  //반지름
	public Circle(int radius) {
		this.radius = radius;
	}

	//인터페이스에 정의된 추상메서드는 자식클래스에서 오버라이딩해야함
	@Override
	public void draw(String figureName) {
		System.out.println(figureName+"을 그립니다.");
	}

	@Override
	public void area(String figureName) {
		System.out.printf(figureName+"의 면적(r*r*PI):%.2f%n"
				,(radius*radius*Math.PI)); //Math.PI:Math클래스의 상수 PI를 통해 원주율구함
	}

}
