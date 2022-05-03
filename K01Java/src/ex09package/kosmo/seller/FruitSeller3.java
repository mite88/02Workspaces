package ex09package.kosmo.seller;

public class FruitSeller3{

	int numOfApple; 
	int myMoney; 
	int APPLE_PRICE;
	
	public FruitSeller3(int appleNum, int money, int price) {
		this.numOfApple = appleNum;
		this.myMoney = money;
		APPLE_PRICE = price;
	}
	
	public int saleApple(int money) {
		int num = money /APPLE_PRICE; 
		numOfApple -= num; 
		myMoney += money; 
		return num; 
	}
	

	public void showSaleResult() {
		System.out.println("[판매자]남은 사과갯수:"+numOfApple);
		System.out.println("[판매자]판매수익:"+myMoney);
	}
}