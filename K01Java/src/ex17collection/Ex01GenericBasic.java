package ex17collection;

//오렌지를 표현한 클래스
class Orange{
	int suger; //당도
	public Orange(int suger) {
		this.suger= suger;
	}
	
	public void showInfo() {
		System.out.println("오렌지의 당도는 "+suger+" 입니다.");
	}
}

//오랜지전용 박스를 표현한 클래스 : Orange객체만 저장
class OrangBox{
	Orange item;
	//저장
	public void store(Orange item) {
		this.item= item;
	}
	
	//꺼내기
	public Orange pullOut() {
		return item;
	}
}

//과일상자 : Object라서 모든객체를 대상으로 함
class FruitBox{
	Object item; //멤버변수가 모든 객체 참조
	
	public FruitBox(Object item) {
		this.item = item;
	}
	
	public void store(Object item) {
		this.item = item;
	}
	
	public Object pullOut() {
		return item;
	}
}

public class Ex01GenericBasic {

	public static void main(String[] args) {
		//OrangBox생성 후 Orange 객체저장, Orange를꺼낸 후정보 출력
		OrangBox oBox1 = new OrangBox();
		Orange orange1 = new Orange(10);
		oBox1.store(orange1);
		orange1 = oBox1.pullOut();
		orange1.showInfo();
		
		/*
		상자1은 오렌지 전용박스라서 다른과일(객체)저장 x
		이경우 컴파일 에러발생 및 실행이 안된다
		 
		->자료형은 안전, 구현이 어려움 , 이거해결하려면 다른 Box 클래스 만들어야함
		 */
		//oBox1.store("당도가 20일 오렌지"); //해당 메서드는 void라서 안됨 
		Orange orange2 = oBox1.pullOut();
		orange2.showInfo();
		
		/*
		Object기반으로 생성된 FruitBox는 구현에는 이상이 없지만
		코드레벨에서 에러가 발생하지 않기에 오류를찾기 힘듬
		*/
		FruitBox fBox1 = new FruitBox(new Orange(20));
		Orange orange3 = (Orange)fBox1.pullOut();
		orange3.showInfo();
		
		/*
		 해당 객체는 String라 저장에는 문제가 없지만, 
		 사용할때 형변환에 문제가 생겨 런타임 에러가 발생되어
		 발견이 어려운 단점이 있음
		 */
		FruitBox fBox2 = new FruitBox("당도가 30인 오렌지");
		Orange orange4 = (Orange)fBox2.pullOut();
		orange4.showInfo();
		
	}

}
