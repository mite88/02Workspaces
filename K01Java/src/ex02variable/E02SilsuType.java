package ex02variable;

public class E02SilsuType {

	public static void main(String[] args) {
	
		/*
		 실수 자료형(float, double)
		 
		 정수형보다  실수형이 큰자료형
		 따라서 long(정수형)과 float(실수형)를 연산시  float 형이 된다
		 */
		
		long long1 = 100;
		float float1 = 200;
		float result1 = long1 + float1; //자동 형변환 발생 (자료손실발생)
		System.out.println("long1 + float1 = "+ result1); //300.0
		
		// float와 long의 연산결과를 long로 받고싶을경우 형변환하여 연산하는방법들
		
		//float를 long로 형변환 후 연산
		long result2 = long1 + (long)float1;
		System.out.println("형변환후 연산 = "+ result2);
		// 계산결과 전체를 강제(명시적) 형변환
		long result3 = (long)(long1 + float1);
		System.out.println("계산후 형변환 = "+ result3);
		
		float f3 = 100;
		
		/*
		  Type mismatch: cannot convert from double to float
		  
		  컴파일러는 소수점이 있는 데이터의 경우 double로 인식한다
		  (단, 소수점이 없는 데이터는 float 대입이 가능)
		  
		 이경우 이것이 double타입이라는 것을 명시해야한다
		 (숫자뒤에 점미사인 F or f을붙임)
		
		 형변환이 가능하긴 하지만 권장하진 않음  
		 */
		
		//float f4 = 3.14;
		float f4=(float)3.14;
		System.out.println("f4 = "+ f4);
		
		float f5 = 3.14F;
		System.out.println("f5 = "+ f5);
		
		float f6 = f3 + f4;
		System.out.println("f6 = "+ f6);
		
		//컴퓨터의 실수는 약간의 기본적 오차가 있다.
		double d1 = 3.14;
		double d2 = f6 + d1;
		System.out.println("d2 = "+ d2);


	}

}
