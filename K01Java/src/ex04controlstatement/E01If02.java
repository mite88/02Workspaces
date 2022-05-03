package ex04controlstatement;

public class E01If02 {

	public static void main(String[] args) {
		/*
		조건문(비교식 or 논리식) - if~else 문
		 
		if(조건식) {  // 조건식이 true일 경우 실행
		  실행문;
		} else {     // 조건식이 false일 경우 실행
		  실행문;
		}
		
		조건문(비교식 or 논리식) - 삼항 연산자
		변수 = 조건식 ? 값 or 연산식(true일 경우) : 값 or 연산식(false일 경우);
		
		*/
		
		int num = 120;
		//120을 2로 나누면 0이라서 true
		if(num%2 == 0) {
			System.out.println("짝수입니다.");
		}else {
			System.out.println("홀수입니다.");
		}
		
		String numberResult = (num%2 == 0) ? "짝수임" : "홀수임";
		System.out.println("숫자 "+num+"은 "+numberResult);
		
		/*
		 시나리오
		 
		 숫자를 홀/짝인지 먼저 판단 후 100 이상이지를 판단하는
		 프로그램을 if~else문으로 작성하시오.
		*/
		
		int num2 = 120;
		
		 
		if(num2%2 == 0) {
			
			if(num2 >= 100) {
				System.out.println("짝수이면서 100이상");
			}else {
				System.out.println("짝수이면서 100미만");
			}
			
		}else {

			if(num2 >= 100) {
				System.out.println("홀수이면서 100이상");
			}else {
				System.out.println("홀수이면서 100미만");
			}
		}	
		
		
		//다른방법으로
		String numberResult1=(num2%2 == 0) ? "짝수이면서 ":"홀수이면서 ";
		String numberResult2=(num2 >= 100) ? "100이상":"100이하";
		
		System.out.println(numberResult1+numberResult2);
		

	}

}
