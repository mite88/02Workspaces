package ex13interface;


import ex13interface.figure.*;

public class E05FigureDrawableMain {

	public static void main(String[] args) {
		//이질화 : 부모인터페이스 참조변수로자식객체 참조
		IFigure figure = new Circle(30);
		figure.area("원");//오버라이딩되어 형변환하지않아도 됨
		((Circle)figure).draw("나도 원"); //다운캐스팅으로 draw() 호출
		
		IFigure fig1= new Rectangle(100, 90);
		fig1.area("사각형");
		((Rectangle)fig1).draw("나도 사각형");
		
		//IDrawable인터페이스엔 draw()추상메서드만 있어서 다운캐스팅함
		IDrawable draw = new Triangle(100,90);
		draw.draw("삼각형");
		((Triangle)draw).area("나도 삼각형");
		
		//동질화
		Circle circle = new Circle(40);
		circle.area("원");
		circle.draw("나도 원");
	}
}
