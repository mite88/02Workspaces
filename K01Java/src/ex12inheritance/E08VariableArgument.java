package ex12inheritance;

/*
가변인자(Variable Argument)
- 메서드 오버라이딩 대체할수 있는 문법
- 하나의 메서드로 여러가지 호출을 대체
- 필요에 따라 매개변수를 가변적으로 조정가능
- 매개변수를 2개이상 받아야해서배열로 반환
- 자료형은 모두 동일해야함
*/
public class E08VariableArgument {
	
//	static int getTotal(int param) {
//		int total = 0;
//		total += param;
//		return total;
//	}
//	
//	static int getTotal(int param1, int param2) {
//		int total = 0;
//		total += (param1+param2);
//		return total;
//	}
//	
//	static int getTotal(int param1, int param2, int param3) {
//		int total = 0;
//		total += (param1+param2+param3);
//		return total;
//	}
	
	//가변인자
	//... : param이 2개이상 인수를 받는것을 명시
	static int getTotal(int ... param) {
		int total = 0;
		for (int i = 0; i < param.length; i++) {
			total += param[i];
		}
		return total;
	}
	
	public static void main(String[] args) {

		System.out.println("getTotal(arg1)호출:"
		+getTotal(10));
		System.out.println("getTotal(arg1, arg2)호출:"
		+getTotal(10,20));
		System.out.println("getTotal(arg1, arg2, arg3)호출:"
		+getTotal(10,20,30));
		
		System.out.println("getTotal(매개변수6개)호출:"
		+getTotal(10,20,30,40,50,60));
//		System.out.println("getTotal(arg1, arg2)호출:"
//		+getTotal(10,20.3));
	}

}
