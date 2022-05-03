package ex10accessmodifier;

/*
캡슐화(Encapsulation)
여러업무 로직을 하나로 묶음
(관련있는, 업무의 순서까지 고려한 형태의 로직을 구성) 
*/

//4가지의 업무가 순서대로 진행해야한다고가정
class MemberRegist{
	void doMemberRegist() {
		System.out.println("1.회원가입을 진행합니다.");
	}
}

class CongratulationPoint{
	void doCongratulationPoint(){
		System.out.println("3.가입축하 10포인트를 지급합니다.");
	}
}

class AutoLogin{
	void doAutoLogin() {
		System.out.println("2.자동로그인");
	}
}

class FirstLoingEvent{
	void doFirstLoginEvent() {
		System.out.println("4.첫 로그인 이벤트 페이지로 이동합니다.");
	}		
}

//하나의 클래스로 정의 - 차후별도의 분석없이 해당 메서드를 호출하면 됨
class EncapsulLogic{
	MemberRegist memberRegist = new MemberRegist();
	FirstLoingEvent firstLoginEvent = new FirstLoingEvent();
	AutoLogin autoLogin = new AutoLogin();
	CongratulationPoint congratulationPint = new CongratulationPoint();

	//업무의 순서를 고려하여 캡슐화된 메서드 정의
	void doProcess() {
		memberRegist.doMemberRegist();
		autoLogin.doAutoLogin();
		congratulationPint.doCongratulationPoint();
		firstLoginEvent.doFirstLoginEvent();
	}
}

public class E05Encapsulation {
	public static void main(String[] args) {
		
		System.out.println("캡슐화 전 코드");
		
		MemberRegist memberRegist = new MemberRegist();
		FirstLoingEvent firstLoginEvent = new FirstLoingEvent();
		AutoLogin autoLogin = new AutoLogin();
		CongratulationPoint congratulationPint = new CongratulationPoint();
		
		//코드의 순서를 언제든지바꿀수 있어 경우에 따라선 논리적오류가 발생할 가능성이 있음
		memberRegist.doMemberRegist();
		firstLoginEvent.doFirstLoginEvent();
		congratulationPint.doCongratulationPoint();
		autoLogin.doAutoLogin();
	
		System.out.println("==============================");
		
		System.out.println("캡슐화 후 코드");
		new EncapsulLogic().doProcess();
	}

}
