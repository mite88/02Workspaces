package ex14InnerClass;
/*
익명클래스(Anonymous class)
- 이름이 없는 클래스
- 내부클래스처럼 이벤트 기반의 프로그램에서 많이사용(안드로이드)
- 부모클래스의 메서드를 오버라이딩 하는것이 목적
- 클래스를 정의하는 것이 마치 메서드를 정의하는것과 비슷
- 마지막에 세미콜론 넣어야함

형식]
	부모클래스명 참조변수 = new 부모클래스명(){
		익명클래스의 실행부;
		부모클래스의 메서드 오버라이딩;
	};
	
	* 부모클래스를 상속받아 이름없는 자식 클래스를 생성하는 개념
	* 상속되기 때문에 오버라이딩 가능({}안쪽이 자식영역)
*/

//가수표현
class Singer {
	String name;

	public Singer(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "이름:" + name;
	}
}

//걸그룹표현(Singer 상속)
class GirlGroup extends Singer {

	String team;

	public GirlGroup(String name, String team) {
		super(name);
		this.team = team;
	}

	@Override
	public String toString() {
		//부모의 toString() 메서드 호출을 위해 super사용
		return super.toString()+"팀명:" + team;
	}
}

//인터페이스
interface ISinger{
	//추상메서드만 가능 
	public void dancing();
}

public class E02AnonymousClass {

	public static void main(String[] args) {
		
		//부모클래스를 통해 객체생성
		Singer s1 = new Singer("조용필");
		//객체 자체를 출력하면  toString()메서드 반환값 출력
		System.out.println(s1);
		
		//자식클래스를 통한 객체 생성 및 출력
		Singer s2 = new GirlGroup("츄", "이달의소녀");
		System.out.println(s2);

		//추상클래스
		/*
		GirlGroup를 상속받는 익명클래스 정의
		: Singer타입의 변수에 GirlGroup을 상속 받는 익명 클래스를
		생성 및 주소 할당
		
		new GirlGroup(){};
		: 익명 extends GirlGroup();형태라 생각하면 됨
		
		이름이 없는 객체이므로 부모클래스의 이름을 빌려 객체를 생성한거임
		*/
		Singer s3 = new GirlGroup("아이린", "레드벨뱃") {
			boolean mic = true; //자식에서 확장한 멤버변수
			@Override
			public String toString() {

				return super.toString()+", 소속사:sm";
			}
		};
		System.out.println(s3);
		//부모로 자식영역으로 접근이 안되기때문에 안됨
		/*
		 익명이기때문에 다운캐스팅이 안된다 (????)s3.mic
		 
		 그래서 멤버의 확장은 거의 하지않음
		 */
		//System.out.println(s3.mic); 
		
		/*
		보통 인터페이스(상속)를 구현하여 오버라이딩 목적으로
		아래처럼 구현하는것이 일반적임
		*/
		ISinger s4 = new ISinger() {
			@Override
			public void dancing(){
				System.out.println("춤추틑게 좋아요~~");
			}
		};
		s4.dancing();

		
		/*
		결론]
		
		상속의 목적은 "확장"
		익명클래스의 목적 : 오버라이딩
		주로 익명클래스의 부모는 인터페이스를 사용
		*/
	}
}