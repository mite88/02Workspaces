package ex03operator;

public class E03BeekyoOperator {
	
	public static void main(String[] args) {
		/*
		 관계(비교)연산자 
		 좌우측항의 값을 비교하는 연산자
		 */
		
		int num1=10,num2=20;
		
		if(num1 > num2) {
			System.out.println("num1이 더 큽니다.");
		}else {
			System.out.println("num2이 더 큽니다.");
			
		}
		
		if(num1 != num2) {
			System.out.println("num1과 num2는 다르다.");
		}else {
			System.out.println("num1과 num2는 같다.");
		}
	}

}
