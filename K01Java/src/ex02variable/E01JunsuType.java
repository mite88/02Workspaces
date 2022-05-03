package ex02variable;

public class E01JunsuType {

	public static void main(String[] args) {
		
		/*
		 정수형 (byte, short, int, long)
		 
		 일반적으로 CPU는 정수형 연산을 할때 int형을 가장 빨리 처리함
		 (정수형을 쓸땐 대부분 int)
		 */
		 
		int int1 = 100; //int형 변수 int1 선언 후 100으로 초기화
		int int2 = 200;
		int result1 = int1 + int2; //int1+int2의 결과가 result1에 대입
		System.out.println("int1 + int2 = " + result1);
		
		/*
		 정수형은 나누기해서 실수가 나와도 정수형이 나온다
		 (* 파이션은 나누면 실수가 나오기도 한다.)
		 / : 몫  % : 나머지
		 */
		result1 = int1 / int2;
		System.out.println("int1 / int2 =" + result1); //0이 출력
		
		//같은타입으로 여러 변수를 할당시 ,로 가능하다
		
		//int형보다 작은 자료형(byte, short)의 연산은 CPU는 int형으로 변환하여 연산
		byte byte1 = 50, byte2 = 55;
		int result2 = byte1 + byte2;
		System.out.println("byte1 + byte2 =" + result2);
		
		short short1 = 60, short2 = 70;
		int result3= short1 + short2;
		System.out.println("short1 + short2 =" + result3);
		
		/*
		 한쪽이 작은 자료형의 경우 큰 자료형을 따라감(데이터 손실)
		 (단 byte형와 short형은 int형에 최적화된 CPU특성으로 인해 예외)
		 */
		
		long long1 = 1000, long2 = 2000;
		long result4 = int1 + long2;
		System.out.println("int1 + long2 ="+ result4);

		//long끼리의 연산은 기본규칙에 따름
		result4 = long1 + long2;
		System.out.println("long1 + long2 ="+ result4);
		
		/*
		 The literal 2200000000 of type int is out of range  에러발생
		 
		 보통 자바컴파일러는 정수형은 기본적으로 int로 인식하는데 
		 long3의 값경우 int의 범위를 벗어나서 생긴다.
		 
		 이경우 이것이 long타입이라는 것을 명시해야한다
		 (숫자뒤에 점미사인 L or l을붙임)
		 
		 이와같이 대입을 위해 입력되는 숫자도 자료형을 기반으로 메모리에 저장되고,
		 이를 '리터럴(literal)'이라고한다
		 */
		
		//long long3 = 2200000000;

		long long4 = 2200000000L;
		long long5 = 2200000000l;
		
		System.out.println("long4="+ long4);

	}

}
