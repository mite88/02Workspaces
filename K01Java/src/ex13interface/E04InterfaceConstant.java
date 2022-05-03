package ex13interface;

import java.util.Random;
import java.util.Scanner;

interface Game {
	//인터페이스에서 변수는 상수만 가능하기 때문에 생략이 가능함
	int SCISSORS = 1, ROCK = 2, PAPER = 3;
}

public class E04InterfaceConstant {

	public static void main(String[] args) {
		System.out.println("가위(1) 바위(2) 보(3) 게임입니다.");
		System.out.print("선택하세요(정수입력): ");

		Scanner sc = new Scanner(System.in);
		int user = sc.nextInt();
		
		//ai컴퓨터가 낸 숫자
		int ai = 0;
		ai = (int) ((Math.random()*3) +1);

		switch (user) {
		case Game.SCISSORS:
			System.out.println("유저는 가위를 냈습니다.");
			break;
		case Game.ROCK:
			System.out.println("유저는 바위를 냈습니다.");
			break;
		case Game.PAPER:
			System.out.println("유저는 보자기를 냈습니다.");
			break;
		default:
			System.out.println("잘못 냈습니다.");
			break;
		}
		
		switch (ai) {
		case Game.SCISSORS:
			System.out.println("AI는 가위를 냈습니다.");
			break;
		case Game.ROCK:
			System.out.println("AI는 바위를 냈습니다.");
			break;
		case Game.PAPER:
			System.out.println("AI는 보자기를 냈습니다.");
			break;
		default:
			System.out.println("잘못 냈습니다.");
			break;
		}
		
		
		/*
		(↓유저 → ai) 유저가 낼때..(○:이김 △:비김)
		
		   	   가위1 바위2 보3   차이(유저-ai) 
		가위1    △          ○     1-3=-2
		바위2    ○     △          2-1=1
		보3            ○    △     3-2=1
		
		이걸로 보면 유저-ai의 차이가 -2 or 1 이면 이기는거 같다.
		*/
		
		int score = user - ai;
		System.out.println(score);
		
		if(score == 0) {
			System.out.println("비겼습니다.");
		}else if((score == -2) || (score == 1)) {
			System.out.println("이겼습니다.");
		}else {
			System.out.println("졌습니다.");
		}
		
	}

}
