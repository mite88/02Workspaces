package ex01start;

public class E02SystemOutPrintln {

	public static void main(String[] args) {
		/*
		 
		 출력 
		 System.out.println() : 자동줄바꿈
		 System.out.print():줄바꿈x(줄바꿈시 \n)
		 System.out.printf():포멧(서식)에 맞게 출력,줄바꿈x(줄바꿈시 \n or %n)
		 */
		
		
		//정수형 변수를 선언한 후 100으로 초기화
		int num1=100;
		
		//문자열과 변수를 출력
		System.out.println("num1="+num1);
		System.out.print("num1="+num1+"\n");
		System.out.printf("num1=%d%n",num1);
		
		//정수, 실수 출력
		System.out.println(7);
		System.out.println(3.14);
		
		/*
	  	+:숫자(덧셈), 문자열이 존재 할 경우(글자결합)
	  
	 	print()문에서의 +기호의 역할
	 	-숫자끼리는 실제 덧셈 연산
	 	-문자열, 숫자, 실수 등으로 서로성격이 다른 데이터끼리는 연결
		 */
		
		//숫자 + 숫자  : 덧셈연산
		System.out.println(3+5);
		System.out.println(3.5+5.1);
		
		//숫자 + 문자열 or 문자열+문자열 : 단순출력 
		System.out.println("3+5="+8);
		System.out.println(3.15+"는 실수입니다.");
		System.out.println("3+5"+"의 연산결과는 8입니다.");

		System.out.println("num1은 "+num1+" 입니다.");

	}

}
