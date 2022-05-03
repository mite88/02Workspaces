package ex03operator;

public class E05ShortCircuitEvaluation {

	public static void main(String[] args) {
		
		/*
		 단락회로평가
		 
		 모든 연산자와피연자를계산하지않고 결과가 결정되는 것
		 true or x : 앞이 참인데 뒤를 해도 참이 되기때문에 계산할 필요가 없음
		 false and x: 앞부분이 거짓이라 뒤를 하더라도 거짓이라 계산할 필요가 없음
		 
		 */
		
		int num1=0, num2=0;
		boolean result;
		
		/*논리 And*/
		result = (num1+=10) < 0  && (num2 +=10 )> 0;
		System.out.println("result="+result);
		System.out.println("num1="+ num1+", num2="+num2); //num1=10, num2=0
		
		/*논리 Or*/
		result = (num1+=10) > 0  || (num2 +=10 )> 0;
		System.out.println("result="+result);
		System.out.println("num1="+ num1+", num2="+num2); //num1=20, num2=0
		
	}
}
