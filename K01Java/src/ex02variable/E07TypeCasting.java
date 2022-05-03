package ex02variable;

public class E07TypeCasting {

	public static void main(String[] args) {
		/*
		 - 자동 형변환 : 작은 데이터를 큰 데이터에 넣을때
		 byte -> short/char -> int -> long -> float -> double
		 
		 - 강제(명시적) 형변환 : 큰 데이터를 작은 데이터에 넣을때 
		 (데이터손실 발생할 수 있음)
		 long num1 = 12345678L;
		 int num2 =(int)num1;
		 
		 */

		//자동 형변환
		byte b1 = 65;
		short s1;
		s1= b1;
		System.out.printf("b1은 %d, s1은 %d%n", b1, s1);
		
		
		//자동 형변환의 예외 : CPU는 int를 좋아해. (int보다 작은 자료형은 int로 간주함)
		int num1 =b1 + s1;
		System.out.println("num1은 "+ num1);
		
		//char(문자)에 byte(정수)는 성질이 달라 명시적 형변환 후 대입
		//char ch1= b1; //에러
		char ch2=(char)b1;
		System.out.println("b1="+b1+", ch2="+ch2);
		
		//명시적 형변환
		short s2=100;
		byte b2 =(byte)s2; 
		System.out.printf("데이터 미손실:b2=%d, s2=%d\n", b2, s2);
		
		s2=129;
		b2 =(byte)s2; //byte 범위가 -127~128 이므로 129는 다시돌아오는 수인 -127이나온다
		System.out.printf("b2=%d, s2=%d\n", b2, s2);
		
		int num3;
		double dl=3.14;
		num3=(int)dl;
		System.out.printf("데이터 손실:num3=%d, bl=%.2f %n", num3, dl);
		
		//아스키코드 활용
		char ch3='A', ch4;
		int num4=2;
		//ch4=ch3 + num4;
		ch4=(char)(ch3+num4);
		System.out.println("ch4="+ch4);
	}

}
