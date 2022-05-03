package ex04controlstatement;

import java.io.IOException;
import java.util.InputMismatchException;
import java.util.Iterator;
import java.util.Scanner;

public class E04DoWhile {

	public static void main(String[] args) throws IOException {
		/*
		do~while문
		- 무조건 한번은 실행된 후 조건을 검사
		- 그 외에는 while문과 동일 

		반복을 위한 변수;
		do{
		    실행문;
		    증감식;
		}while(조건문); // 조건식이 마치는거라 ; 들어감
		*/
		
		/*
		 시나리오 
		 
		 1~10까지의 합을 구하는 프로그램 , do~while문이용
		 */
		
		int sum = 0;
		int i= 1;
		
		do {//진입
			sum += i;
			i++;
		} while (i<=10);//조건을 만족하면 끝
		
		System.out.println("1~10까지의 누적합 : "+sum);
		/*
		시나리오
		
		1~1000까지의 정수 중 4의배수이거나 7의 배수인 
		정수의 합을 구하는 프로그램 , do~while문이용
		*/
		int total = 0;
		int j = 1;
		do { 
			if(j%4 == 0 || j%7 == 0) {
				//System.out.println("j="+j);//디버깅용
				total += j;
			}
			j++;
		} while (j <= 1000);

		System.out.println("1~1000사이 4or7의 배수의 합 : "+ total);
	
	    /*
	     시나리오 
	      
	     국어,영어, 수학 점수를 입력받아 평균을 구해 
	     A~F학점을 판단하여 출력하는 프로그램
	     
	     단, 사용자가 X,x(대소문자 구문없음)를 입력시 종료
	     do~while문이용
	     */
		
		Scanner scanner = new Scanner(System.in);
		int kor, eng, math, avg;
		int exitCode;
		
		do {
			//조건확인없이 무조건 진입
			
			System.out.print("국어점수:");
			kor=scanner.nextInt();
			System.out.print("영어점수:");
			eng=scanner.nextInt();
			System.out.print("수학점수");
			math=scanner.nextInt();
			
			avg=(kor+eng+math) /(3*10);
			
			/*
			 switch 문으로 작성시...
			 
			 switch문은 산술식으로 사용해야하므로
			 나누기를 이용하여10으로 나누어 몫을 기준으로 나누었다.
			 */
			switch (avg) {
			case 10: case 9:
				System.out.println("A학점");
				break;
			case 8:
				System.out.println("B학점");
				break;
				
			case 7:
				System.out.println("C학점");
				break;
				
			case 6:
				System.out.println("D학점");
				break;
			

			default:
				System.out.println("F학점");
			}
		
			System.out.println("종료하려면 x(X)를 입력하세요.");
			System.out.println("계속하려면 아무키나 입력하세요.");
			exitCode = System.in.read();
			
		}while(!(exitCode == 'x'|| exitCode == 'X'));
		/*
		        !(exitCode == 'x'|| exitCode == 'X')
		     ------------------------------------
		     x        f||t => !(t) => 탈출
		     A        f||f => !(f) => 반복
		 */
		
	
	}

}
