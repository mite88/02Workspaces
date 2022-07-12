package di;

//그래프 상에서 원을 표현한 클래스(getter/setter)
public class Circle {
	//중심점에서 해당하는 Point객체 및 반지름을 멤버변수로 선언
	Point point;
	int radian;
	
	public Point getPoint() {
		return point;
	}
	public void setPoint(Point point) {
		this.point = point;
	}
	public int getRadian() {
		return radian;
	}
	public void setRadian(int radian) {
		this.radian = radian;
	}
	
	@Override
	public String toString() {
		return point+"반지름:"+radian;
	}
}