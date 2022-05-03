package banking;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Scanner;

/*
계좌정보를 표현한 클래스로 NormalAccount, HighCreditAccount의 부모클래스
*/

/*
@SuppressWarnings("serial")

@SuppressWarnings : 컴파일시 경고(노란줄)제외용

java.io.Serializable를 불러올시 serialVersionUID를 정의 하지 않을때 경고가 뜨기 때문에
하는방식

이방법말고도 명시적으로 하는 방법도 있음(26번줄 참고)
(jvm에서 명시적으로 할것을 권장하긴 함)
*/
@SuppressWarnings("serial")
public abstract class Account implements Serializable {


	//private static final long serialVersionUID = 1L;
	
	//멤버변수
	public String accountNumber;// 계좌번호
	public String userName;// 고객이름
	public int balance; // 잔고
	public double interest; // 이자

	// 생성자
	public Account() {};

	//생성자 - 기본틀이되는 ....
	public Account(String accountNumber, String userName, int balance, double interest) {
		this.accountNumber = accountNumber;
		this.userName = userName;
		this.balance = balance;
		this.interest = interest;
	}


	/*
	Object클래스의 hashCode(), equals()메소드
	
	객체에서 같은 객체를 찾을때 기준이 되는 걸 하기위한 메서드..
	
	검색1단계 
	hashCode() 메소드의 반환값을 해시값으로 활용하여 검색의 그룹을 선택한다.
	 
	검색2단계 
	equals() 메소드의 반환값의 결과로 인스턴스가 동일한지 판단한다.
	 */
	
	// 이름이 같으면 같은 객체로 인식하게끔 오버라이딩
	@Override
	public int hashCode() {
		// TODO Auto-generated method stub

		return accountNumber.hashCode();
	}
		
	@Override
	public boolean equals(Object obj) {
		Account account = (Account) obj;
		if (this.accountNumber.equals(account.accountNumber)) {
			return true;
		} else
			return false;
	}

	// 객체정보
	@Override
	public String toString() {
		return String.format("계좌번호:%s, 고객이름:%s, 잔고:%d, 이자:%f", accountNumber, userName, balance, interest);
	}

	void showMenu() {}; //메뉴
	void makeAccount() {} // 계좌개설을 위한 함수
	void depositMoney() {}; // 입 금
	void withdrawMoney() {}; // 출 금
	public abstract void showAccInfo(); // 전체계좌정보출력
	
	public abstract int deposit(int deposit); // 입금금액 계산용 : 추가함
}
