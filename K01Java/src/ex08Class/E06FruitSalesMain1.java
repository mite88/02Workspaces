package ex08Class;
//판매자
class FrultSeller{
	//멤버변수
	int numOfApple = 10; //사과갯수
	int myMoney = 0; //판매수익
	final int APPLE_PRICE = 1000; //사과개당가격
	
	//클래스에서 멤버상수를 선언하는경우는 동시에 초기화해야함

	//멤버메서드 - 판매자가 사과를 판매하는 행위
	public int saleApple(int money) {
		int num = money /APPLE_PRICE; //판매한사과갯수
		numOfApple -= num; //남은사과를 계산하기위한....
		myMoney += money; //금액증가
		return num; 
	}
	
	//멤버메서드 - 판매자상태
	public void showSaleResult() {
		System.out.println("[판매자]남은 사과갯수:"+numOfApple);
		System.out.println("[판매자]판매수익:"+myMoney);
	}
}

//구매자
class FruitBuyer{
	int myMoney = 5000; //보유 금액
	int numOfApple = 0; //사과갯수(장바구니)
	
	//멤버메서드 - 구매자가 사과를 구매하는 행위
	public void buyApple(FrultSeller seller, int momey) {
		//판매자에게 돈을 지불하고 사과획득
		numOfApple += seller.saleApple(momey); 
		myMoney -= momey; //산것만큼 금액 감소
	}
	
	//멤버메서드 - 구매자상태
	public void showBuyResult() {
		System.out.println("[구매자]현재잔액:"+myMoney);
		System.out.println("[구매자]사과 갯수:"+numOfApple);
	}
}


public class E06FruitSalesMain1 {
	
	public static void main(String[] args) {
		FrultSeller seller = new FrultSeller();
		FruitBuyer buyer = new FruitBuyer();
		
		System.out.println("구매행위가 일어나기전의 상태");
		seller.showSaleResult();
		buyer.showBuyResult();
		
		System.out.println("======================");
		
		buyer.buyApple(seller, 5000); //구매자가 사과구매
		System.out.println("구매행위가 일어난 후의 상태");
		seller.showSaleResult();
		buyer.showBuyResult();
	}
}
