package ex12inheritance;

/*
멤버변수가 상속관계에 있어도 private로 선언되면 클래스 내부
에서만 접근가능

*/
class Account{
	private int money;  //private 선언 변수는 클래스 내부에서만 사용
	
	public Account(int init) {
		money = init;
	}
	
	//입금처리 : protected로 선언하여 상속관계에서 접근가능
	protected void depositMoney(int _money) {
		if(_money < 0) {
			System.out.println("마이너스 금액은 입금처리 불가합니다.");
			return;
		}
		money +=_money;
	}
	
	//private멤버변수를 외부로 봔환시 사용(getter메서드)
	protected int getAccMoney() {
		return money;
	}
}

class SavingAccount extends Account{
	
	public SavingAccount(int initVal) {
		super(initVal);//인자가 하나인 부보클래스의 생성자호출
	}
	
	//부모클래스의 protected로 선언된 멤버메서드 호출
	public void saveMoney(int money) {
		depositMoney(money);
	}
	
	public void showAccountMoney() {
		//money는 private멤버라서 직접접근이 안되므로 간접적으로 접근함
		System.out.println("지금까지의 누적금액:"+getAccMoney());
	}
	
}

public class E02PrivateInheritanceMain {

	public static void main(String[] args) {
		SavingAccount sa = new SavingAccount(10000);
		
		//private 멤버라서 접근불가, 정보은닉
		//sa.money= 100000;
		sa.saveMoney(5000);
		sa.showAccountMoney();
		
		sa.saveMoney(-1000);
		sa.showAccountMoney();
		
		Account account = new Account(1000);
		//account.money = 1000;
	}

}
