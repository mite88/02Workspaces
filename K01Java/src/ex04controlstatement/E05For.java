package ex04controlstatement;

import java.util.Iterator;
import java.util.Scanner;

public class E05For {

	public static void main(String[] args) {
		/*
		for문(반복문)
		
		for(초기값; 조건식; 증감식){
			실행문장;
		}
		
		* while로 하면....
 
		초기값
		while(조건식){
			실행문장;
			증감식
		}
		*/
		
		//기본사용법
		/*
		1. 반복을 위한 변수인 i를 1로 초기화
		2. 조건식 검사
		3. true일경우 실행
		4. 증감식 실행
		5. 2번 부터 반복(false될때까지)
		*/
		for (int i = 1; i <= 5; i++) {
			System.out.println("i="+i);
		}
		
		/*
		시나리오 - 1~100까지의 합
		*/
		int sum = 0;
		for (int j = 1; j <=100; j++) {
			sum+=j;
		}
		System.out.println("1~100까지의 합 : "+sum);
		/*
		시나리오 - 1~10까지의정수 중 2의 배수의 합
		*/
		int total=0;
		for (int i = 1; i <=10; i++) {
			if(i%2 == 0) {
				total += i;
			}
		}
		System.out.println("1~10사이2의 배수의 합(방법1) : "+total);
		
		total=0;
		for (int i = 0; i <=10; i+=2) {
			total+=i;
		}
		System.out.println("1~10사이2의 배수의 합(방법2) : "+total);
		
		
		// 무한루프
	
		int a =1;
		for (;;) {
			System.out.println("나는 for문으로 만든 무한루프입니다."+a);
			a++;
			if(a==1000)break;
		}
		
		
		/*
		지역변수 전역변수에 따른 결과
		
		전역변수(Global variable) : 어느 위치에서든 호출하면 사용이 가능
		지역변수(Local variable) : 특정구역({ }) 내에서 생성되어 그 구역에서만 사용
		*/
		for (int j = 0; j <=5; j++) {
			System.out.println("어랏...나는 누구? 여긴 어디?");
		}
		
		/*
		for문의 초기식에서 선언된 변수j는 for문이 종료시 메모리에서 소멸
		여기서 j는 지역변수(Local variable)
		*/
		//System.out.println("위 for문에서선언한 변수 j="+j);
		System.out.println("위 main함수 지역에서 선언한 변수 total="+total);
		
		/*
		for문의 초기값을 외부에서 선언하면 해당변수는 for문의 안쪽에서 사용 가능
		즉 아래에 선언한 변수 i는 main메서드의 지역변수가 된다.
		*/
		int i=0;
		for ( ;i<=5; i++) {
			System.out.println("for문 안에서의 i값 : "+i);
		}
		
		System.out.println("for문 밖에서의 i값 : "+i);
		
		System.out.println("----------------------------");
		
		/*
		연습문제 - 구구단
		*/
		
	
		/*Scanner scanner = new Scanner(System.in);
		int dan = 0;
		System.out.print("구구단입니다.\n보실 단을 입력하세요:");
		dan = scanner.nextInt();
		
		for ( int su=1 ; su <=9 ; su++) {
			System.out.printf("%-2d* %-2d= %2d\n", dan, su, (dan*su));
		}*/
		
		//단(2~9)
		for ( int dan=2 ; dan <=9 ; dan++) {
			//수(1~9)
			for ( int su=1 ; su <=9 ; su++) {
				System.out.printf("%-2d* %-2d= %2d  ", dan, su, (dan*su));
			}
			System.out.println();
		}
		
		System.out.println("----------------------------");
		
		/*
		연습문제 - 위 문제 에서 열로 출력 
		*/
		
		for ( int su=1 ; su <=9 ; su++) {
			//수(1~9)
			for ( int dan=2 ; dan <=9 ; dan++) {
				System.out.printf("%-2d* %-2d= %2d  ", dan, su, (dan*su));
			}
			System.out.println();
		}
		
		System.out.println("----------------------------");
		
		/*
		연습문제 -다음 결과를 보이는 for문작성
		 |1 2 3 4
		----------
		1|0 0 0 1
		2|0 0 1 0
		3|0 1 0 0
		4|1 0 0 0
		
		* x+y =5가 될때 1을 출력
		*/
		
		
		for (int x = 1; x <= 4; x++) {
			for (int y = 1; y <= 4; y++) {
				//System.out.print((x+y)%4);
				
				//System.out.print((x+y == 5) ? "1 ":"0 ");
				System.out.print((x+y)%4 ==1 ? "1 ":"0 ");
				/*if(x+y == 5) {
					System.out.print("1 ");
				}else {
					System.out.print("0 ");
				}*/
				
			}
			System.out.println();
		}
		

	}

}
