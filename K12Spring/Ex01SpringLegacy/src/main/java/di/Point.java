package di;

//그래프 좌표값 표현 클래스
public class Point {
	//멤버변수
	public int x;
	public int y;
	
	//생성자 및 메서드 정의
	public Point(int x, int y) {
		super();
		this.x = x;
		this.y = y;
	}
	
	//참조변수 출력용 
	@Override
	public String toString() {
		return String.format("(x, y=%d, %d)", x, y);
	}
}
