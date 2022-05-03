package banking;

/*
신용신뢰계좌편

Account의 자식클래스로 신용도가 높은 고객에게 개설이 허용되며 높은 이율의 계좌이다.
생성자를 통해서 이율정보(이자비율의정보)를 초기화 할수있도록 정의한다.
*/
@SuppressWarnings("serial")
public class HighCreditAccount extends NormalAccount implements ICustomDefine{
	//멤버변수
	public String rating;

	//생성자
	public HighCreditAccount() {}

	public HighCreditAccount(String accountNumber, String userName, int balance, double interest, String rating) {
		super(accountNumber, userName, balance, interest);
		this.rating = rating;
	};
	
	
	//toString 메서드(간단 출력 확인용)
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString()+ ", 신용등급:"+ rating;
	}
	
	//오버라이딩 : 입금계산용
	@Override
	public int deposit(int deposit) {
		System.out.println("rating;"+rating);
		if(rating.equals("A")) 
			balance=(int)Math.floor((balance + (balance * interest/100)+(balance *A)+ deposit));
		else if(rating.equals("B")) 
			balance=(int)Math.floor((balance + (balance * interest/100)+(balance *B)+ deposit));
		else if(rating.equals("C")) 
			balance=(int)Math.floor((balance + (balance * interest/100)+(balance *C)+ deposit));
		
		System.out.println(balance);
		return balance;
	}
	

	// 전체계좌정보출력
	@Override
	public void showAccInfo() {
		System.out.print( "계좌번호:"+ accountNumber);
		System.out.print( "\t고객이름:"+ userName);
		System.out.print( "\t잔고:"+ balance);
		System.out.print( "\t기본이자:"+ interest);
		System.out.println( "\t신용등급:"+ rating);
		
	}

	
}
