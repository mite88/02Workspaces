package ex12inheritance;

/*
Has-a
X가 Y를 소유하고 있다
클래스의 멤버로 다른 객체를 사용하는것이 좋다
*/


class Gun{
	int bullet;//탄환수
	
	//생성자
	public Gun(int bNum) {
		bullet = bNum;
	}
	
	//멤버메서드 : 쏭쏘고 탄감소
	public void shutGun() {
		System.out.println("빵야~~!");
		bullet--;
	}
}

class Police{
	int handCuffs;//수갑 보유수
	Gun gun;//객체형 멤버변수
	
	//생성자
	public Police(int bNum, int hCuff) {
		handCuffs = hCuff;
		if(bNum <= 0) {
			gun = null; //참조할 객체 생성되지 않음
		}
		else {
			gun = new Gun(bNum); //객체생성
		}
	}
	
	//수갑을 채움
	public void putHandcuff() {
		System.out.println("수갑채움~!넌콩밥~!");
		handCuffs--;
	}
	
	//총쏘기
	public void shut(){
		if(gun ==null) {
			System.out.println("보유한 권총없음. 헛빵~!");
		}
		else
		{
			gun.shutGun();
		}
	}
	
}
public class E05HasAComposite {

	public static void main(String[] args) {
		System.out.println("==경찰1==");
		Police police1 = new Police(5, 3);
		police1.shut();
		police1.putHandcuff();
		
		System.out.println("==경찰2==");
		Police police2 = new Police(0, 3);
		police2.shut();
		police2.putHandcuff();

	}

}
