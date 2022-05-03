package ex15usefullclass;

/*
Object클래스
- 자바에서 최상위 클래스
- 별도 선언없이 해당 클래스에 정의된 모든 메서드 사용가능
- 개발자가 정한 모든클래스는 해당클래스의 참조변수로 참조 가능
Object obj = new Person();
void simpleFunc(Object obj){}
*/

/*
toString()메서드
- Object클래스에 정의된 메서드
- printin()이 문자열을 출력하기 전에 자동 호출되는 메서드
- 인스턴스 변수를 문자열 형태로 변환하여 반환
- 필요한 경우 클래스 정의시 적절히 오버라이딩하여 재정의하는것이 좋음(선택)
*/
class myFriends extends Object{
	String myName;
	
	public myFriends(String name) {
		this.myName = name;
	}

	//오버라이딩
	@Override
	public String toString() {
		return "이름:"+myName;
	}
}

//toString() x
class yourFriends extends Object{
	String myName;

	public yourFriends(String name) {
		this.myName = name;
	}
	
}
public class E04Object1toString {

	public static void main(String[] args) {
		myFriends fnd1 = new myFriends("성유겸");
		yourFriends fnd2 = new yourFriends("헬로비너스");
		
		System.out.println(fnd1); //toString()메서드호출
		System.out.println(fnd2); //(참조)주소값이 나온다
	}
}
