package ex04controlstatement;

import java.util.Scanner;

public class E02Switch {

	public static void main(String[] args) {
		/*
		 switch문
		 
		- 산술식만 사용가능
		- 논리연산자를 이용한 조건식은 사용x
		- case 와 default는 실행위치를 표시하는 레이블(Label)로 사용 

		switch(산술식 혹은 정수식){
		    case 값1 : 
		        실행문; 
		        break; //switch문 탈출
		    case 값2 : 
		        실행문; 
		        break; //switch문 탈출  
		    default;    
		}
		
		※ 만약 break문이 없다면 아래 실행문이 모두실행된다.
		*/
		
		//Scanner 클래스 : 사용자로 부터 특정값 입력을 받을 수 있는 클래스(한줄)
		Scanner scanner = new Scanner(System.in);
		System.out.print("숫자를 입력하세요. : ");
		
		//int형을 입력 받을 때는 nextInt 메서드를 이용
		//* 문자열은 nextLine 메서드
		int iNum = scanner.nextInt(); 
		System.out.println("입력한 숫자는:"+iNum);
		
		int remain = iNum % 3;
		
		//정수를 3으로 나눌때 0,1,2 만 나옴
		switch (remain) {
		case 0: //나머지가 0일때
			System.out.println("나머지는 0입니다.");
			break; //swich문 빠져나옴
		case 1: //나머지가 1일때
			System.out.println("나머지는 1입니다.");
			break;//swich문 빠져나옴
		default://나머지가 2일때
			System.out.println("나머지는 2입니다.");
			//보통 switch문의 마지막엔 break문을 쓰지 않음
		}
		
		/*
		 switch문에서 사용 가능한 자료형 및 클래스
		 byte, short, int, char, String
		 */
		/*
		 long ln = 100L;
		 
		switch (ln) {
		case 100:
			System.out.println("long타입 사용??");
			break;

		default:
			System.out.println("안되는군!");
			break;
		}

		//조건식을 쓸수 없음
		switch (iNum %3 == 0) {
		System.out.println("논리식도 안되는군!");
		}
		*/
		
		//default 없이 사용도 가능함
		 String title ="자바";
		 switch (title) {
		case "자바":
			System.out.println("자바 좋아");
			break;

		case "JAVA":
			System.out.println("JAVA Gooood");
			break;
		}
		
		// 여러case를 동시에 처리시 break문없이 나열이 가능(Or과 같음)
		int season = 8;
		switch (season) {
			case 3: case 4: case 5: //=> if(season == 3 || season == 4 || season == 5 )
				System.out.println("봄입니다.");
				break;
			case 6: case 7: case 8: case 9:
				System.out.println("여름입니다.");	
				break;
			case 10:
				System.out.println("가을입니다.");	
				break;
			case 11: case 12: case 1: case 2:
				System.out.println("겨울입니다.");	
				break;

		}

	}

}
