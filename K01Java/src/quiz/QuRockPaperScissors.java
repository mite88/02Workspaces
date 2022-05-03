package quiz;

import java.util.Scanner;
/*
가위바위보 게임을 메소드를 통해 구현한다.
난수생성기를 이용하여 1, 2, 3중 하나의 숫자를 생성한다.
사용자가 가위(1),바위(2),보(3) 중 하나를 낸다.
승부를 판단하여 출력한다.
1,2,3 이외의 숫자를 입력하면 잘못된 입력을 알려주고 재입력을 요구한다.
숫자입력을 잘못한 경우는 게임횟수에 포함하지 않는다.
게임은 5번 진행하고 5번째 게임을 끝내면 다시할지 물어본다. 
재시작(1), 종료(0)
0, 1 이외의 숫자를 입력하면 재입력을 요구해야 한다.
*/


interface Game {
	int SCISSORS = 1, ROCK = 2, PAPER = 3;
	public abstract void RPSResult(int rps, String name);
	 
}
//가위 바위보 출력
class RockPaperScissorsResult implements Game{

	@Override
	public void RPSResult(int rps, String name) {
		System.out.print(name+":");
		
		switch (rps) {
		case Game.SCISSORS:
			System.out.print("가위");
			break;
		case Game.ROCK:
			System.out.print("바위");
			break;
		case Game.PAPER:
			System.out.print("보");
			break;
		default:
			System.out.println("가위바위보 할줄 모르세요? 제대로 내세요^^;");
			break;
		}
		
	}

}
//전체적 결과
class Score{

	//결과관련

	public void ScoreRestlt() {
		/*
		(↓유저 → ai) 유저가 낼때..(○:이김 △:비김)
		
		   	   가위1 바위2 보3   차이(유저-ai) 
		가위1    △          ○     1-3=-2
		바위2    ○     △          2-1=1
		보3            ○    △     3-2=1
		
		이걸로 보면 유저-ai의 차이가 -2 or 1 이면 이기는거 같다.
		*/

		Scanner sc = new Scanner(System.in);
		
		int gameCount = 0; // 게임 카운트용 변수
		int exitNum=0;
		RockPaperScissorsResult prsResult = new RockPaperScissorsResult();

		
		while(true) {
			System.out.print("무엇을 내겠습니까?(1: 가위, 2:바위, 3:보) :");
			int user = sc.nextInt();
			int ai= (int) ((Math.random()*3) +1); //3까지 랜덤으로 나오게 하기위한...
			
			
			
			//사이숫자
			if(user>0 && user<4) {
				
				prsResult.RPSResult(user, "사용자");
				System.out.print(", ");
				prsResult.RPSResult(ai, "컴퓨터");
				System.out.println();
				int score = user - ai;
				//System.out.println(score); //차이비교용
				
				if(score == 0) {
					System.out.println("비겼습니다.");
				}else if((score == -2) || (score == 1)) {
					System.out.println("이겼습니다.");
				}else {
					System.out.println("졌습니다.");
				}
				
				gameCount++;
			}else {
				System.out.println("가위바위보 할줄 모르세요? 제대로 내세요^^");
				continue;
			}
	
			
			
			if(gameCount >= 5) {
				
				System.out.print("5번의 게임이 끝났습니다. 게임을 계속하시겠습니까? 재시작(1), 종료(0) : ");
				while(true) { 
					
					exitNum=sc.nextInt();//종료여부
					
					if(exitNum==0 || exitNum==1) { 
						break;
					} else { 
						System.out.print("잘못입력하셨습니다. 재시작(1), 종료(0)중에 입력하세요");
					} 
				} 
				
				
				
				if (exitNum == 0) {
					System.out.println("게임종료");
					break;
				}else if(exitNum == 1){
					System.out.println("게임재시작");
					gameCount = 0;
				}
				
				
				
			}
			
		}

	}
	
}


public class QuRockPaperScissors {

	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		Score game = new Score();
		game.ScoreRestlt();
		
	}

}
