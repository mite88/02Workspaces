package ex08Class;

//판매자
/*
전예제에서는 각 클래스가 멤버변수의 초기값으로 고정되어
다른객체 생성을 할수없는 단점이 있어서
이번엔 초기화 메서드를 도입해본다
*/
class FrultSeller2{
	//멤버변수 - 선언만하기
	int numOfApple; 
	int myMoney; 
	int apple_price; //상수로 표현시 선언 및 초기화를해야하므로 변경함
	
	//멤버변수 초기화 메서드
	public void initMembers(int money, int appleNum, int price) {
		myMoney = money;
		numOfApple = appleNum;
		apple_price = price;
	}

	public int saleApple(int money) {
		int num = money /apple_price; 
		numOfApple -= num; 
		myMoney += money; 
		return num; 
	}
	
	public void showSaleResult() {
		System.out.println("[판매자]남은 사과갯수:"+numOfApple);
		System.out.println("[판매자]판매수익:"+myMoney);
	}
}

//구매자
class FruitBuyer2{
	int myMoney;
	int numOfApple;
	
	public void initMembers(int _myMoney, int _numOfApple) {
		myMoney = _myMoney;
		numOfApple = _numOfApple;
	}
	
	public void buyApple(FrultSeller2 seller, int momey) {
		//판매자에게 돈을 지불하고 사과획득
		numOfApple += seller.saleApple(momey); 
		myMoney -= momey; //산것만큼 금액 감소
	}
	
	public void showBuyResult() {
		System.out.println("[구매자]현재잔액:"+myMoney);
		System.out.println("[구매자]사과 갯수:"+numOfApple);
	}
}


public class E06FruitSalesMain2 {
	
	public static void main(String[] args) {
		//위에서 초기화 메서드가 정의되어있으므로 다른객체 생성함
		FrultSeller2 seller1 = new FrultSeller2();
		FrultSeller2 seller2 = new FrultSeller2();
		
		seller1.initMembers(0, 100, 1000);
		seller2.initMembers(0, 80, 500);
		
		FruitBuyer2 buyer = new FruitBuyer2();
		buyer.initMembers(10000, 0);
		
		System.out.println("구매행위가 일어나기전의 상태");
		seller1.showSaleResult();
		seller2.showSaleResult();
		buyer.showBuyResult();
		
		System.out.println("======================");
		
		buyer.buyApple(seller1, 5000);
		buyer.buyApple(seller2, 5000);
		System.out.println("구매행위가 일어난 후의 상태");
		seller1.showSaleResult();
		seller2.showSaleResult();
		buyer.showBuyResult();
	}
}
