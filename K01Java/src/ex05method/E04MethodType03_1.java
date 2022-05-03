package ex05method;

import java.util.Scanner;

public class E04MethodType03_1 {

	/*
	형태3] 매개변수O 반환값X
	값 전달 후 연산하고 해당결과를 반환하지 않고
	즉시 출력하는경우
	
	시나리오]
	사용자가 입력한 2개의 시작값과 끝값사이에 있는
	수를 모두 더해 출력하는 프로그램 작성
	
	결과]
	시작값 : 5
	종료값 : 9
	결과 : 5+6~+7+8+9 =??
	*/
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.printf("시작값 : ");
		int s = scanner.nextInt();
		
		System.out.printf("종료값 : ");
		int e = scanner.nextInt();
		
		//반환값없음 2개의 정수를 인수로(argument) 전달
		yesParamNoReturn(s, e);
		
	}
	
	/*main()메서드에서 2개의 정수를 입력 받은 후 인수 전달시,
	  해당 함수에서는 매개변수 startNum, endNum가 값을 받음
	 */
	static void yesParamNoReturn(int startNum, int endNum) {
		
		int sum = 0;
		for (int i = startNum; i <=endNum; i++) {
			sum += i;
		}
		
		System.out.printf("%d~%d까지의 합은 : %d", startNum, endNum, sum);
	
	}

}
