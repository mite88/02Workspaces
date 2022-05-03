package ex05method;

import java.util.Scanner;

public class E04MethodType03_2 {

	/*
	형태3] 매개변수O 반환값X
	 
	연습문제] 사용자로부터 2~9사이의 숫자중 2개를 입력받아
	그에 해당하는 구구단을 출력하는 메서드를 작성하시오.
	무조건 첫번째 입력받는수가 작아야한다.
	입력예]
		첫번째숫자 : 3
		두번째숫자 : 12
		3*1=3 3*2=6........
		........
		...................12*9=108
	메서드명 : inputGugudan(int sNum, int eNum)
	*/

	//첫숫자 ~ 두번째 숫사사이 구구단 출력
	static void inputGugudan(int sNum, int eNum) {
		
	for ( int dan=sNum ; dan <=eNum ; dan++) {
		for ( int su=1 ; su <=9 ; su++) {
			
				System.out.printf("%2d*%-2d= %3d  ", dan, su, (dan*su));
			}
			System.out.println();
		}
		
	}
	
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.printf("첫번째숫자 : ");
		int d1 = scanner.nextInt();
		
		System.out.printf("두번째숫자 : ");
		int d2 = scanner.nextInt();

		if(d1>d2) {
			inputGugudan(d2, d1);
		}else {
			inputGugudan(d1, d2);
		}
		
	}

}
