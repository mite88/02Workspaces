package ex18lambda;

//인터페이스 정의
interface IKomsmo1{
	//인터페이스의 메서드는 추상메서드로 public abstract 자동 추가됨
	void studyLambda(String str);
}

//추상메서드를 포함한 인터페이스 구현 시 하위클래스엔 오버라이딩 필수
class KosmoStudent1 implements IKomsmo1{

	@Override
	public void studyLambda(String str) {
		System.out.println(str+"을(를) 공부합니다.");
	}
	
}
public class Ex01NormalClass {

	public static void main(String[] args) {
		//메서드 하나 정의하기위해 인터페이스, 상속, 오보라이딩 , 객체생성까지 해야하나?
		IKomsmo1 kosmo = new KosmoStudent1();
		kosmo.studyLambda("람다식");
	}

}
