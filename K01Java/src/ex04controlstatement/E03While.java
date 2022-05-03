package ex04controlstatement;

public class E03While {

	public static void main(String[] args) {
		/*
		 while문 (반복문)
		 
		- 조건이 true인 경우에만 실행문이 실행 
		- 조건이 false 일때까지 검사 후 처음으로 돌아가 다시 검사함
		  (조건이 false라면 실행되지 않음)
		  
		- 반복의 횟수가 명확하지 않은 경우 주로사용(난수 등)
		
		* 주위 : 조건식이 false가 없다면 무한루프에 빠질 수 있음

		초기값;
		 while(조건문){
		    실행문; 
		    증감식;
		}
		*/
		
		/*
		시나리오
		
		1~10까지의 합을 구하는 프로그램 , while문이용
		*/
		
		//1. 10번 반복을 위한 while문 작성 
		int i = 1; //초기값
		while(i <= 10) {
			System.out.println("변수i="+i);
			i++; //증감식(반복문 탈출을 위한....)
		}

		//2. 수열문제 구현
		int sum=0;
		int j=1;
		while (j<=10) {
			sum+=j; //sum = sum + j;
			j++;
		}
		System.out.println("1~10까지의 합sum="+sum);
		
		/*
		시나리오
		
		1~100까지의 정수 중 3의배수이거나 4의 배수인 
		정수의 합을 구하는 프로그램 , while문이용
		*/
		int total=0;
		int k =1;
		while (k <= 100) {
			//3의 배수, 4의배수이므로 Or
			if(k%3 == 0|| k%4 == 0 ) {
				total += k;
				System.out.println("k="+ k);
			}
			k++;
		}
		System.out.println("3또는 4의 배수의 합:"+total);
		
		/*
		시나리오
		
		구구단을 출력하는 프로그램 , while문이용
		*/
		
		int dan =2; //단
		while (dan <= 9) { //2~9단까지
			
			int su =1; //수
			while (su <= 9) {  //1~9까지 단이 고정된상태에서 증가
				
				//서식에 맞쳐 출력하기위해 printf()문을 사용함
				System.out.printf("%-2d*%2d = %-2d", dan, su, (dan*su));

				System.out.print(" ");	//공백
				su++;
			}
			System.out.println();
			dan++;
		}
		System.out.println("\n=============================================\n");
		/*
		시나리오
		
		아래와 같은 모양으로 출력 , while문이용
		
		
		1 0 0 0
		0 1 0 0
		0 0 1 0 
		0 0 0 1
		*/
		int x = 1; //행
		
		while (x <= 4) {
			int y = 1; //열
			while (y <= 4) {
				if (x == y) {
					System.out.print("1 ");
				} else {
					System.out.print("0 ");
				}
				y++;
			}
			System.out.println();
			x++;
		}
	}

}
