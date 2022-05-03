package quiz;

import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Random;
import java.util.Scanner;

/*
숫자대신 문자를 입력할 경우 발생되는 예외를 처리하시오. 
(가위바위보 입력시, 재시작여부 입력시)
게임과 관련없는 숫자를 입력했을때 사용자정의 예외클래스를 통해 처리하시오.
예외처리 클래스명 : WrongNumberException

*/
class WrongNumberException extends NumberFormatException {
	public WrongNumberException() {
		super("가위바위보 할줄 모르세요? 제대로 내세요^^;");
	}
}

public class QuRockPaperScissors2 {

	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		Random random = new Random();
		int gameCount = 0;

		while (true) {
			try {
				// 1.난수생성
				int com = random.nextInt(10000) % 3 + 1;// 1~3사이의 난수
				//System.out.println("컴퓨터:" + com);

				int user = 0;
				System.out.println("가위바위보를 입력하세요.");
				System.out.print("가위(1), 바위(2), 보(3)=>");

				user = scanner.nextInt();

				// 3.승부판단
				// 사용자가 정상적으로 입력한 경우
				if (!(user < 1 || user > 3)) {

					// 승부판단 로직2 : 입력한 수의 차를 이용해 승부를 판단한다.
					System.out.printf("사용자:%s, 컴퓨터:%s ", displayRPS(user), displayRPS(com));
					switch (user - com) {
					case 0:
						System.out.println("비겼습니다.");
						break;
					case 1:
					case -2:
						System.out.println("이겼습니다.");
						break;
					case 2:
					case -1:
						System.out.println("졌습니다.");
						break;
					}

					gameCount++;// 게임카운트 증가
				} else {
					try {
						WrongNumberException we = new WrongNumberException();
						throw we;
					} catch (Exception e) {
						System.out.println(e.getMessage());
					}

				}

				// 4.게임재시작 여부 확인
				if (gameCount >= 5) {
					// 0과 1을 입력하지 않아도 게임은 재시작된다.
					System.out.print("게임재시작(1), 종료(0):");
					int restart = scanner.nextInt();
					if (restart == 0) {
						// 게임종료를 위해 while루프 탈출
						break;
					} else if (restart == 1) {
						System.out.println("게임 재시작^^");
						gameCount = 0;
					} else {
						try {
							WrongNumberException we = new WrongNumberException();
							throw we;
						} catch (Exception e) {
							System.out.println(e.getMessage());
						}
					}
				}

			} catch (InputMismatchException e) {
				System.out.println("숫자를내세요");
				/*
				 * nextLine()호출후 문자입력시 예외가 발생하여 엔터키가 버퍼로남음 그래서 엔터기를 누른것처럼 인식되어 무한루프가발생 그래서 엔터키를
				 * 제거해주는 작업을 한다
				 */
				scanner.nextLine(); //버퍼비움
			}

		}
	}

	public static String displayRPS(int n) {
		String str = "";
		switch (n) {
		case 1:
			str = "가위";
			break;
		case 2:
			str = "바위";
			break;
		case 3:
			str = "보";
			break;
		}
		return str;
	}
}
