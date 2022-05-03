package ex13interface.figure;
//넓이를 구하는 행위를 표현한 인터페이스
/*
 인터페이스 or 클래스 하나당 하나의 자바파일을 구성하는걸 권장
 -모든 클래스가 public로 선업되어 재활용용의
 */
public interface IFigure {
	void area(String figureName);
}
