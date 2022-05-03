package ex12inheritance;
/*
오버라이딩
클래스의 상속관계 시 하위 클래스가 상위클래스의
멤버메서드와 완전히 같은 모양(갯수, 타입전부)으로 재정의하는것
오버라이딩 시 상위클래스의 메서드는 가리게 되어
항상 자식클래스에서 오버라이딩한 메서드가 호출
*/
//부모클래스
class Speaker{ 
private int volumnRate;

	//외부에서 변수설정이 가능한 setter메서드
	public void setVolumn(int vol) {
		volumnRate=vol;
	}
	
    //오버라이딩목적용임 : 현 메서드는 외부에 가려짐
    public void showState() {
        System.out.println("스피커의 볼륨크기:"+volumnRate);
    }
}

//자식클래스
class BaseSpeaker extends Speaker { //오버라이딩 관계
    private int baseRate; 
    
    //setter메서드
    public void setBase(int bas) {
    	baseRate = bas;
    }
 
    /*
    어노테이션이라고도 하고, 오버라이딩 된 메서드에추가하여
    컴퍼일러에게 알려주는 역활(필수는아님)
    */
    
    @Override
    public void showState() {
    	/*
    	super를 통해 부모 클래스에 정의 된 멤버메서드 호출
    	오버라이딩 된 메서드 호출시 super이 없으면 재귀호출이 됨
    	*/
        super.showState(); 
        System.out.println("스피커의 불륨크기:"+baseRate);
    }
 
}

public class E06Overriding {

	public static void main(String[] args) {

		//자식클래스를 통해 객체생성 : 부모 멤버포함하여 호출가능
		BaseSpeaker baseSpeaker = new BaseSpeaker();
		baseSpeaker.setVolumn(10);
		baseSpeaker.setBase(20);
		baseSpeaker.showState(); 
		
		System.out.println();
		
		/*
		BaseSpeaker클래스는 부모클래스를 포함하고 있어 생성가능한데,
		부모 클래스인 Speaker클래스로 접근하기때문에 부모클래스범위로 제한되며
		일반적으론 자식클래스로 접근할 수 없음
		단, 오버라이딩 된 메서드의 경우 자식클래스도 참조가 가능해짐
		*/
		Speaker speaker = new BaseSpeaker();
		speaker.setVolumn(30);
		//speaker.setBase(40);
		speaker.showState();
	}

}
