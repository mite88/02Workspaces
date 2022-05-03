package ex08Class;
/*
은행계좌

멤버변수 : 예금주, 계좌번호, 잔고
멤버메서드 : 입금(deposit()), 출금(withdraw()), 잔고출력(showAccount())

입금은 무제한 가능
잔고부족시 출금 불능 처리하기

초기화 메서드 : 멤버변수를 초기화 할수 있는 메서드 정의
*/

class Account{
	//멤버변수
		String name;
		//연산이 필요없는경우는 int형을 하지않음(예-번호 등)
		String accountNumber;
		int balance;
		
		//멤버메서드
		
		//입금처리
		void deposit(int money) {
			balance += money;
			System.out.println(money+"원이 입금됨");
		}
		
		//출금처리 : 출금 + 잔고부족 로직 
		void withdraw(int money) {
			//출금을 위해잔고와 출금액을 비교함
			if(balance >= money) {//잔고가 남아있는경우
				balance -= money;
				System.out.println("계좌에서 "+money+"원이 출금됨");
			}else {
				System.out.println("잔고부족으로 출금불능");
			}
		}
		
		//계좌조회
		void showAccount() {
			System.out.println("계좌주:"+name);
			System.out.println("계좌번호:"+accountNumber);
			System.out.println("잔고:"+balance);
		}
		
		//초기화 메서드
		void init(String n , String a, int b) {
			name=n;
			accountNumber =a;
			balance =b;
		}
}
public class E04AccountMain {

	public static void main(String[] args) {
		//
		Account  account = new Account();
		account.init("장동건", "111-21-8888", 1000);
		account.deposit(9000);
		account.withdraw(5000);
		account.showAccount();
		
		System.out.println("====================");
		//두번째통장 개설
		Account  account2 = new Account();
		account2.name="정우성";
		account2.accountNumber="123-45-67890";
		account2.balance=900000;
		account2.showAccount();
		
	}

}
