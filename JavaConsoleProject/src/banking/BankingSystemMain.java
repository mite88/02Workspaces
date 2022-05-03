package banking;


//main 메서드를 포함한 클래스. 프로그램은 여기서 실행한다. 

public class BankingSystemMain {

	public static void main(String[] args) throws Exception {
		//AccountManager에 50개를 할당하여 메뉴를 실행함
		AccountManager am = new AccountManager(50);	
		am.showMenu();//메뉴접근
	}

}
