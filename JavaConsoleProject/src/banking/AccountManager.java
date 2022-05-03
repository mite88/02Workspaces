package banking;

import java.io.*;
import java.util.*;

//컨트롤 클래스로 프로그램의 전반적인 기능을 구현
public class AccountManager implements ICustomDefine {

	// 입력
	Scanner scanner = new Scanner(System.in);

	// 계좌 정보 저장용 HashSet 컬렉션 생성
	HashSet<Account> accSet;

	// 생성자
	public AccountManager() {
	}

	// 생성자(50의 자리를 할당하기위한 생성자)
	public AccountManager(int i) {
		accSet = new HashSet<Account>();
	}

	// 메뉴출력
	public void showMenu() throws MenuSelectException {
		loadStorage();

		int menuNumber;// 주메뉴선택번호

		while (true) {

			try {
				// 계좌정보없음출력용
				if (accSet.size() == 0) {
					System.out.println("계좌없음");
				}

				System.out.println("--------------------Menu---------------------");
				System.out.println("1.계좌개설\t2.입	금\t3.출	금");
				System.out.println("4.계좌정보출력\t5.프로그램종료");
				System.out.println("---------------------------------------------");

				System.out.print("메뉴선택:");
				menuNumber = scanner.nextInt();
				
				//예외처리용 : 다른숫자입력시.....
				try {
					if(menuNumber <=0 || menuNumber>=6) {
						MenuSelectException ex =
								new MenuSelectException("다른숫자 입력");
						
						throw ex;
					}
				} catch (MenuSelectException e) {
					System.out.println(e.getMessage());
				}

				//주메뉴 선택 번호에 따른 메뉴 진입 설정
				switch (menuNumber) {

				case MAKE://개설
					System.out.println("*********계좌개설*********");
					System.out.println("----------계좌선택-----------");
					System.out.println("1.보통계좌\t2.신용신뢰계좌");
					System.out.print("메뉴선택:");
					int subMenuNumber = scanner.nextInt();

					makeAccount(subMenuNumber);

					break;

				case DEPOSIT://입금
					depositMoney();
					break;

				case WITHDRAW://출금
					withdrawMoney();
					break;

				case INQUIRE://리스트

					showAccInfo();

					break;

				case EXIT://종료
					saveStorage(); //내용저장
					System.out.println("프로그램종료");
					System.exit(0);
					//return;
				}// switch end

			} catch (InputMismatchException e) {
				//문자입력시 예외처리
				scanner.nextLine(); //버퍼
				System.out.println("문자 입력불가");

			}

		} // while end

	}

	// 계좌만들기
	public void makeAccount(int subMenuNumber) throws MenuSelectException {
		String accountNumber, userName, rating;// 계좌번호, 예금주, 등급
		int balance, interest; //잔고, 이자

		System.out.print("계좌번호:");
		accountNumber = scanner.next();
		System.out.print("예금주:");
		userName = scanner.next();
		System.out.print("잔고:");
		balance = scanner.nextInt();
		System.out.print("기본이자%(정수형태): ");
		interest = scanner.nextInt();

		// 일반계좌 개설
		if (subMenuNumber == 1) {

			//일반계좌로 초기화
			NormalAccount nomAcc = new NormalAccount(accountNumber, userName, balance, interest);

			// 중복계좌 체크
			boolean Check = accSet.add(nomAcc);
			//System.out.println("equals:" + Check);
			if (Check == false) {
				System.out.print("이미 등록된 계좌번호입니다. 덮어쓸까요?(y or n)");
				String openAccount = scanner.next();
				if (openAccount.equalsIgnoreCase("y")) {
					accSet.remove(nomAcc);
					accSet.add(nomAcc);
					System.out.println("계좌 덮어쓰기 완료");
				} else if (openAccount.equalsIgnoreCase("n")) {
					System.out.println("계좌 덮어쓰기 취소");
				}
			}
		}

		// 신용계좌 개설
		else if (subMenuNumber == 2) {
			System.out.print("신용등급(A,B,C등급): ");
			rating = scanner.next();

			//신용계좌로 초기화
			HighCreditAccount highAcc = new HighCreditAccount(accountNumber, userName, balance, interest, rating);

			// 중복계좌 체크
			boolean Check = accSet.add(highAcc);
			//System.out.println("equals:" + Check);

			if (Check == false) {
				System.out.print("이미 등록된 계좌번호입니다. 덮어쓸까요?(y or n)");
				String openAccount = scanner.next();
				if (openAccount.equalsIgnoreCase("y")) {
					accSet.remove(highAcc);
					accSet.add(highAcc);
					System.out.println("계좌 덮어쓰기 완료");
				} else if (openAccount.equalsIgnoreCase("n")) {
					System.out.println("계좌 덮어쓰기 취소");
					return;
				}
			}
		}

	}

	// 입금
	private void depositMoney() throws MenuSelectException {

		try {
			scanner.nextLine();//버퍼
			System.out.println("*********계좌입금*********");
			System.out.println("계좌번호와 입금할 금액 입력");
			System.out.println("(입금은 500원 단위)");
			System.out.print("계좌번호:");
			String accountNo = scanner.next();
			System.out.print("입금액:");
			int deposit = scanner.nextInt();
			
			//음수 및 500원 단위 체크
			try {

				if (deposit < 0) {
					throw new MenuSelectException("음수 입력불가");

				}
				if (deposit % 500 != 0) {
					throw new MenuSelectException("입금액은 500원 단위로 가능");
				}
				
				
				// 이터레이터를 사용하여 계좌 보유여부 체크 및 입금
				boolean findAccount = false;
				Iterator<Account> itr = accSet.iterator();
				while (itr.hasNext()) {
					Account account = itr.next();
					if (accountNo.compareTo(account.accountNumber) == 0) {
						account.deposit(deposit);
						System.out.println("입금 완료");
						findAccount = true;
					}
				}
				if (findAccount == false)
					System.out.println("등록되지 않은 계좌번호");

			} catch (MenuSelectException e) {
				System.out.println(e.getMessage());
			}


		} catch (InputMismatchException e) {
			scanner.nextLine();
			System.out.println("문자는 입력불가");

		}

	}

	// 출금
	private void withdrawMoney() throws MenuSelectException {

		boolean findAccount = false;
		
		scanner.nextLine();//버퍼
		System.out.println("*********계좌출금*********");
		System.out.println("계좌번호와 출금할 금액을 입력");
		System.out.println("출금은 1000원 단위로 출금이 가능");
		System.out.print("계좌번호:");
		String accountNo = scanner.next();
		System.out.print("출금액:");
		int withdraw = scanner.nextInt();
		
		//음수 및 출금단위 체크
		try {
			if (withdraw < 0) {
				throw new MenuSelectException("음수 사용불가");
			}
			if (withdraw % 1000 != 0) {
				throw new MenuSelectException("출금은 1000원 단위");
			}

			// 이터레이터를 사용하여 계좌 보유여부 체크 및 출금
			Iterator<Account> itr = accSet.iterator();
			while (itr.hasNext()) {
				Account account = itr.next();

				// 잔액이 있는 경우 해당 계좌에서 출금
				if (accountNo.compareTo(account.accountNumber) == 0) {
					if (account.balance > withdraw) {
						account.balance -= withdraw;
						System.out.println("출금 완료");
						findAccount = true;
					}
					// 잔액이 부족한 경우
					else {
						System.out.print("잔고가 부족합니다. 금액전체를 출금할까요?(y or n)");

						while (true) {
							String withdrawChoice = scanner.nextLine();

							if (withdrawChoice.equalsIgnoreCase("y")) {
								System.out.println("전체 출금");
								account.balance -= account.balance;
								findAccount = true;
								break;
							} else if (withdrawChoice.equalsIgnoreCase("n")) {
								System.out.println("출금 취소");
								findAccount = true;
								break;
							}
						}
					}
				}
			}

			if (findAccount == false)
				System.out.println("등록되지 않은 계좌번호");
		} catch (MenuSelectException e) {
			System.out.println(e.getMessage());
		}

	}

	// 전체출력
	private void showAccInfo() {
		System.out.println("*********계좌리스트*********");
		for (Account acc : accSet) {
			acc.showAccInfo(); // 오버러이딩된 메서드출력함
		}

	}

	// 종료시 파일 저장을 위한 함수
	public void saveStorage() {
		try {
			ObjectOutputStream out = new ObjectOutputStream(
					new FileOutputStream("C:\\study\\02Workspaces\\JavaConsoleProject\\src\\banking\\save.obj"));

			for (Account account : accSet) {
				out.writeObject(account);
			}

			out.close();
		} catch (Exception e) {

		}
	}

	// 시작시 파일을 불러오기 위한함수
	public void loadStorage() {

		try {
			ObjectInputStream in = new ObjectInputStream(
					new FileInputStream("C:\\study\\02Workspaces\\JavaConsoleProject\\src\\banking\\save.obj"));

			// 데이터 복원
			while (true) {
				Account acc = (Account) in.readObject();
				// 읽어와서 다시 컬렉션에 저장
				accSet.add(acc);
				if (acc == null)
					break;
			}
			in.close();
		} catch (Exception e) {
			System.out.println("모든 계좌를 불러왔습니다.");
		}
		System.out.println("계좌 정보 복원 완료");
	}

}
