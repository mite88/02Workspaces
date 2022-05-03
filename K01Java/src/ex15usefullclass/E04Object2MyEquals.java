package ex15usefullclass;

class IntNumber{
	int num;
	public IntNumber(int num) {
		this.num = num;
	}
	
	//equles()메서드가 어떻게 인스턴스간 비교하는지 설명하는 코드
	
	//비교를 위해 IntNumber의 객체를 매개변수로 받은 후
	public boolean myEquals(IntNumber numObj) {
		//현재 객체와 멤버변수 값 비교
		if(this.num ==numObj.num) {
			return true;
		}else {
			return false;
		}
		
	}
	
}
public class E04Object2MyEquals {

	public static void main(String[] args) {
		//String와 같은 기본클래스는 별도의 오버라이딩없이 가능
		String str1 = new String("우린NOSMO");
		String str2 = "우린NOSMO";
		
		if(str1.equals(str2)) {
			System.out.println("같은 문자열 입니다."); //출력
		}else {
			System.out.println("다른 문자열 입니다.");
		}
		
		//개발자가 직접정의한 클래스의 객체 생성
		IntNumber num1 = new IntNumber(10);
		IntNumber num2 = new IntNumber(20);
		IntNumber num3 = new IntNumber(10);
		
		//직접정의한 myEquals메서드를 이용하여 객체간 비교
		if(num1.equals(num2)) {
			System.out.println("num1과 num2는 동일한 정수");
		}else {
			System.out.println("num1과 num2는 다른 정수"); //출력
		}
		
		if(num1.equals(num3)) {
			System.out.println("num1과 num3는 동일한 정수");
		}else {
			System.out.println("num1과 num3는 다른 정수"); //출력
		}
	}
}
