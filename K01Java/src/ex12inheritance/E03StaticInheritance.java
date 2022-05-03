package ex12inheritance;

/*
static 타입의 멤버는 어디나 접근이 가능하다
하지만 클래스 외부에서 접근하는 경우 객체 생성없이도 바로 
접근이 가능하기때문에 문제가 생김
*/
class Adder{
	public static int val=0;
	
	/*
	static로 선언된 멤버변수는 실제론 메서드 영역에 생성되어
	클래스명으로 접근 가능
	현재는 현 클래스의 멤버변수라서 변수명으로도 접근가능함
	*/
	public void add(int num) {
		val+= num;
		Adder.val +=num;
	}
}

//부모의 멤버변수가 public라 접근제한이 없음
class AdderFriend extends Adder{
	public void friendAdd(int num) {
		val+= num; //변수명으로 접근
		Adder.val +=num; //클래스명으로 접근
	}
	
	public void showVal() {
		System.out.println("val="+val);
		System.out.println("val="+Adder.val);
	}
}

public class E03StaticInheritance {

	public static void main(String[] args) {
		
		/*
		멤버변수 val은 static라 프로그램 시작시 한번생성되고
		메서드 영역에 로드
		
		아래의 모든연산은 하나의 변수val에만 더해짐
		*/
		Adder ad = new Adder();
		AdderFriend adFriend = new AdderFriend();
		
		ad.add(1);
		adFriend.friendAdd(3);
		Adder.val +=5;
		AdderFriend.val +=7;
		
		adFriend.showVal();
		
	}

}
