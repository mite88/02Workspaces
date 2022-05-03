package banking;

import java.util.Scanner;

import test.HighFriend;

/*
Account의 자식클래스로 보통예금계좌를 의미한다.
생성자를 통해서 이율정보(이자비율의정보)를 초기화 할수있도록 정의한다. 
*/
@SuppressWarnings("serial")
public class NormalAccount extends Account{

	//멤버변수
	public NormalAccount() {};
	
	//생성자
	public NormalAccount(String accountNumber, String userName, int balance, double interest) {
		super(accountNumber, userName, balance, interest);
	}
	
	//toString 메서드(간단 출력 확인용)
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}

	
	//오버라이딩 : 입금계산용
	@Override
	public int deposit(int deposit) {
		balance = (int)(balance + (balance*(interest/100)) + deposit);
		
		return balance;
	}
		
	// 전체계좌정보출력
	@Override
	public void showAccInfo() {
		System.out.print( "계좌번호:"+ accountNumber);
		System.out.print( "\t고객이름:"+ userName);
		System.out.print( "\t잔고:"+ balance);
		System.out.println( "\t기본이자:"+ interest);
		
	}


}
