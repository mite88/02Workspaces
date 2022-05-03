package ex05method;

import java.util.Scanner;

public class QuSimpleOperation {

	/*
	두개의 정수를 입력받아서 사칙연산의 결과를 출력하는 메소드와 main메소드를 작성해보자. 
	단 나눗셈은 몫과 나머지를 각각 출력해야 한다.
	파라메타(인자)로 전달되는 두 숫자는 모두 0 이상의 양의 정수이다.
	메소드명 : arithmetic()
	
	
	실행결과]
	덧셈결과 -> 177
	뺄셈결과 -> 23
	곱셈결과 -> 7700
	나눗셈 몫 -> 1
	나눗셈 나머지 -> 23
	*/
	public static void main(String[] args) {
		/*0이상만 계산이 나오게하고 0이하일 경우 다시 입력하도록 해보았습니다만.....*/
		
		Scanner scanner = new Scanner(System.in);
	
		
		double arithmetic_num1=0, arithmetic_num2=0;
		do {
			System.out.println("0이상의 정수만 계산이 가능합니다.");
			System.out.print("첫번째숫자:");
			arithmetic_num1 = scanner.nextDouble();
			System.out.print("두번째숫자:");
			arithmetic_num2 = scanner.nextDouble();
		} while ((arithmetic_num1<0 || arithmetic_num2 <0) ||
				(arithmetic_num1 % 1.0!=0 || arithmetic_num2 % 1.0!=0));

		
		/*다른곳에서 찾은결과
		정수에서 1을 나누면 나머지가 0이된다.
		이걸 이용하면 정수랑 실수를 구분가능하다고한다.
		35줄 추가 arithmetic_num1 % 1.0!=0 || arithmetic_num2 % 1.0!=0
		 */
		//(해결함)아직정수형체크하는방법을 몰라서 이게 최선일듯합니다
		arithmetic((int)arithmetic_num1, (int)arithmetic_num2);
			
			
	}
	
	static void arithmetic(int num1, int num2) {
		
		System.out.println("덧셈결과 -> "+ (num1+num2));
		System.out.println("뺄셈결과 -> "+ (num1-num2));
		System.out.println("곱셈결과 -> "+ (num1*num2));
		System.out.println("나눗셈 몫 -> "+ (num1/num2));
		System.out.println("나눗셈 나머지 -> "+ (num1%num2));
		
		//prinf에서 %%가 %를 나타냄
		//System.out.printf("나눗셈 나머지:%d %% %d = %d",num1, num2,  num1%num2);

	}


}
