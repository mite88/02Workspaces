package ex12inheritance;

/*
실행결과]
직사각형 면적: 12
정사각형 면적: 49
*/

//직사각형을 표현한 클래스
class Rectangle
{
	int underside, height;
	
	public Rectangle(int underside, int height) {
		this.underside = underside;
		this.height = height;
	}

	public void showAreaInfo() {
		System.out.println("직사각형의 면적:"+ (underside*height));
	}
     	
} 
//정사각형을 표현한 클래스(정사각형은 직사각형의 일종)
class Square extends Rectangle
{
	public Square(int side) {
		super(side, side);
	}

	@Override
	public void showAreaInfo() {
		System.out.println("정사각형의 면적:"+ (underside*height));
	}
     	
} 
class QuRectangleMain {
	public static void main(String[] args) {
       	Rectangle rec = new Rectangle(4, 3);
       	rec.showAreaInfo();

 		Square sqr = new Square(7);
       	sqr.showAreaInfo();
 	}
}

