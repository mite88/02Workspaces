package ex03operator;

public class E04LogicOperator {
	
	public static void main(String[] args) {
		/*
		논리연산자 
		&&(And) : 둘다 true면 true
		||(Or) : 하나라도 true면 true
		!(Not): 결과의 반대
		 */
		int num1 =10, num2=20;
		
		boolean result1=(num1==100 && num2 ==20); //f and t = f
		boolean result2=(num1<12 || num2>=30); //t or f = t
		
		System.out.println("result1의 결과 : "+result1);
		System.out.println("result2의 결과 : "+result2);
		
		//!(Not)반대
		if(!(num1 == num2)) {
			System.out.println("num1과 num2는 다르다.");
		}else {
			System.out.println("num1과 num2는 같다.");
		}
	}

}
