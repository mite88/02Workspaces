package ex13interface.figure;

//사각형을 표현한 클래스 가로, 세로가 있어 FigureData 상속
//넓이 구하는 행위를 하기위한 인터페이스 구현
public class Rectangle extends FigureData implements IFigure, IDrawable {

	public Rectangle(int width, int height) {
		super(width, height);
	}

	@Override
	public void draw(String figureName) {
		System.out.println(figureName+"을 그립니다.");
	}

	@Override
	public void area(String figureName) {
		System.out.println(figureName+"의 면적(가로*세로):"
				+(width*height));
	}

}
