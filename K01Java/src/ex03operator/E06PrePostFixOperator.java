package ex03operator;

public class E06PrePostFixOperator {

	public static void main(String[] args) {

		/*
		 증감연산자 
		 주로반복문에 사용한다.
		 위치에따라 전위(Prefix), 후위(Postfix)로 표현한다.
		 
		 ++var : 1을 더하고 나서계산 
		 var-- :계산후 1을뺀다
		 
		 int num1 =7; 일경우
		 
		 1. num2 = ++num1;  1먼저 증가하고 대입되므로 num2는 8
		 2. num2 =num1++; 대입 후 1이 증가하므로 num2는 7
		 */
		
		
		
		/*
		         num1 num2, num3
		 초기값 :  7    
		 31번줄 :  8   8          (num1값을 1을 먼저 증가 후 num2에 대입)
		 32번줄 :  7         7    (num1값을 1을 먼저 감소 후 num3에 대입)
		 */
		int num1=7, num2, num3;
		
		num2= ++num1; 
		num3= --num1; 
		System.out.println("전위 증가 / 감소시");
		//num1=7, num2=8, num3=7 
		System.out.printf("num1=%d, num2=%d, num3=%d %n%n", num1, num2, num3);
		
		
		/*
        		num1 num2, num3
		초기값 :  7    
		45번줄 :  8   7          (num1값을 num2값에 대입 후 num1 값을 1 증가)
		46번줄 :  7         8    (num1값을 num3값에 대입 후 num1 값을 1 감소)
		*/
		num1=7;
		num2= num1++; 
		num3= num1--;
		System.out.println("후위 증가 / 감소시");
		//num1=7, num2=7, num3=8 
		System.out.printf("num1=%d, num2=%d, num3=%d %n%n", num1, num2, num3);
		
	}

}
