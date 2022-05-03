package ex10accessmodifier;


//판매자
/*
생성자로 작성하기
*/
class FrultSeller5{

	int numOfApple; 
	int myMoney; 
	int APPLE_PRICE;
	/*
	멤버상수는 값변경이 안되고 한번반 초기화 되기때문에
	일반 멤버메서드에서는 초기화가 안된다
	
	하지만 생성자는 객체생성시 한번만호출되고
	개발자가 마음대로 호출이 가능하여 멤버상수를 생성자에서 
	초기화 가능
	*/
	
	//멤버변수 초기화 메서드
	public int saleApple(int money) {
		int num = money /APPLE_PRICE; 
		numOfApple -= num; 
		myMoney += money; 
		return num; 
	}
	
	//생성자
	public FrultSeller5(int appleNum, int money, int price) {
		this.numOfApple = appleNum;
		this.myMoney = money;
		APPLE_PRICE = price;
	}

	public void showSaleResult() {
		System.out.println("[판매자]남은 사과갯수:"+numOfApple);
		System.out.println("[판매자]판매수익:"+myMoney);
	}
}

//구매자
class FruitBuyer5{
	int myMoney;
	int numOfApple;
	
	//생성자
	public FruitBuyer5(int _myMoney, int _numOfApple) {
		myMoney = _myMoney;
		numOfApple = _numOfApple;
	}
	
	public void buyApple(FrultSeller5 seller, int momey) {
		//판매자에게 돈을 지불하고 사과획득
		numOfApple += seller.saleApple(momey); 
		myMoney -= momey; //산것만큼 금액 감소
	}
	
	public void showBuyResult() {
		System.out.println("[구매자]현재잔액:"+myMoney);
		System.out.println("[구매자]사과 갯수:"+numOfApple);
	}
}


public class E02FruitSalesMain5 {
	
	public static void main(String[] args) {
		
		/*
		생성자 사용시 생성과 초기화 동시 가능
		*/
		FrultSeller5 seller1 = new FrultSeller5(0, 100, 1000);
		FrultSeller5 seller2 = new FrultSeller5(0, 80, 500);
		

		FruitBuyer5 buyer = new FruitBuyer5(10000, 0);
		
		System.out.println("구매행위가 일어나기전의 상태");
		seller1.showSaleResult();
		seller2.showSaleResult();
		buyer.showBuyResult();
		
		System.out.println("======================");
		
		/*
		문법적인 오류는 없지만 직접작성한 경우 관계가 맞지않는 논리적오류 발생
		(코드(메서드)로 구현한 규칙이 무너짐)
		
		객체지향프로그래밍에서는 이런 오류를 막기위해 멤버변수에 대한 
		"정보은닉"을 하도록 규정
		
		멤버변수의 외부접근은 원천적으로 차단하고, 멤버메서드를 통해서만 
		접근 가능하도록하여 논리적오류를 해결할수 있음
		*/
		
		//이경우 구매자의 금액이 차단되지않는다 ㅇㅊㅇ
		seller1.myMoney +=1000;
		seller1.numOfApple-=50;
		buyer.numOfApple+=50;
		
		seller2.myMoney +=1000;
		seller2.numOfApple-=70;
		buyer.numOfApple+=70;
		
		System.out.println("======================");

		System.out.println("구매행위가 일어난 후의 상태");
		seller1.showSaleResult();
		seller2.showSaleResult();
		buyer.showBuyResult();
	}
}
