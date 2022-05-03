package ex10accessmodifier;


//판매자
/*
생성자로 작성하기
*/
class FrultSeller6{

	//정보은닉 - 멤버변수를 private로 선언하여 직접적인 접근을 차단
	private int numOfApple; 
	private int myMoney; 
	private int APPLE_PRICE;
	
	//멤버변수 초기화 메서드
	public int saleApple(int money) {
		int num = money /APPLE_PRICE; 
		numOfApple -= num; 
		myMoney += money; 
		return num; 
	}
	
	//생성자
	public FrultSeller6(int appleNum, int money, int price) {
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
class FruitBuyer6{
	private int myMoney;
	private int numOfApple;
	
	//생성자
	public FruitBuyer6(int _myMoney, int _numOfApple) {
		myMoney = _myMoney;
		numOfApple = _numOfApple;
	}
	
	public void buyApple(FrultSeller6 seller, int momey) {
		//판매자에게 돈을 지불하고 사과획득
		numOfApple += seller.saleApple(momey); 
		myMoney -= momey; //산것만큼 금액 감소
	}
	
	public void showBuyResult() {
		System.out.println("[구매자]현재잔액:"+myMoney);
		System.out.println("[구매자]사과 갯수:"+numOfApple);
	}
}


public class E03InfomationHiding {
	
	public static void main(String[] args) {
		
		/*
		생성자 사용시 생성과 초기화 동시 가능
		*/
		FrultSeller6 seller1 = new FrultSeller6(20, 100, 1000);
		FrultSeller6 seller2 = new FrultSeller6(20, 80, 500);
		

		FruitBuyer6 buyer = new FruitBuyer6(10000, 0);
		
		System.out.println("구매행위가 일어나기전의 상태");
		seller1.showSaleResult();
		seller2.showSaleResult();
		buyer.showBuyResult();
		
		System.out.println("======================");
	
		//은닉을통해 직접적으로 들어갈수 없게 되어 오류가 난다
		/*
		seller1.myMoney +=1000;
		seller1.numOfApple-=50;
		buyer.numOfApple+=50;
		
		seller2.myMoney +=1000;
		seller2.numOfApple-=70;
		buyer.numOfApple+=70;
		 */
		
		buyer.buyApple(seller1, 5000);
		buyer.buyApple(seller2, 5000);
		
		
		System.out.println("======================");

		System.out.println("구매행위가 일어난 후의 상태");
		seller1.showSaleResult();
		seller2.showSaleResult();
		buyer.showBuyResult();
	}
}
