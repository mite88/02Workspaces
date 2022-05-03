package ex14InnerClass;

import ex14InnerClass.Unit.Marine;

/*
내부클래스(Inner Class)
클래스 안에 정의된 클래스로 static가 없는 클래스

- 외부클래스의 모든 멤버(정적 혹은 인스턴스형) 사용 가능
- 정적 멤버를 가질순없지만 상수는 가질수 있음
- 컴파일시 외부 클래스명$내부클래스.class 파일로 생성됨
- 이벤트 기반의 프로그래밍에서 많이 사용됨
*/
class Unit{
	//멤버변수
	private String name;
	private int healthPoint;
	
	//인스턴스형 멤버변수
	Marine marine;
	Medic medic;
	
	//생성자
	public Unit(String name, int healthPoint) {
		this.name = name;
		this.healthPoint = healthPoint;
		marine = new Marine(); //객체를 생성해야함
		//medic = new Medic(); //사용시 생성해야함
	}
	
	//멤버변수 정보 반환
	public String infoStr() {
		return "유닛정보[이름:"+name+", 체력 : "+healthPoint+"]";
	}
	
	//내부클래스들...(내부 멤버 클래스)
	class Marine{
		//내부클래스도 일반적인 클래스와 동일하게 멤버 정의 가능
		int attakPower;
		public void attack() {
			//외부클래스의 모든 멤버 접근가능
			System.out.println(infoStr()+"\n마린이 공격한다.");
		}
	}
	
	class Medic{
		int healPower;
		public void heal() {
			System.out.println(infoStr()+"\n메딕이 치료한다.");
		}
	}

}

public class E01InnerClassMain {

	public static void main(String[] args) {
		Unit unit = new Unit("커멘드센터", 1000);
		System.out.println(unit.infoStr());
		
		/*
		외부클래스가 아닌 내부의 다른 클래스에는 
		내부 멤버 클래스가 보이지 않아 직접 인스턴스를 생성 할 수 없음
		*/
		//Marine marice = new Marine();
		
		//외부클래스의 인스턴스를 생성 후 내부클래스의 인스턴스를 생성해야함
		Unit.Marine marine = new Unit("마린", 50).marine;
		marine.attack();
		
		
		/*
		medic의 경우 Unit 생성자에서 객체 생성을 하지 않았으므로
		아래와 같이 new를 생성해야하고, Unit 객체를 통해서도 생성해야해서
		2번 사용해서 객체를 생성
		*/
		Unit.Medic medic = new Unit("메딕", 30).new Medic();
		medic.heal();
	}

}
