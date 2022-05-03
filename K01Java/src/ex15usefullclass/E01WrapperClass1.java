package ex15usefullclass;
/*
Wrapper 클래스
- 기본자료형의 데이터를 인스턴스화할때 사용하는 클래스
- Boxing / Unboxing를 통해 기본자료형의 데이터를 객체화
*/
public class E01WrapperClass1 {
	public static void main(String[] args) {
	    //이전까지의 계산방식
		int num1 = 10;
		int num2 = 20;
		int result = num1 + num2;
		System.out.println("result="+result);
		
	    /*
		이전방식(호환성땜에 남겨놈)
		JDK1.4이전 방식으로 기본자료형을 박싱처리한 객체에 대해 산술연산을 진행할때
	    다시 언박싱하기 위해 intValue()와 같은 메서드를 호출해야 했음
		*/
		Integer n10obj = new Integer(10);
		Integer n20obj = new Integer(num2);
		int result2= n10obj.intValue() + n20obj.intValue();
		System.out.println("result2="+result2);
		
		Integer resultObj = new Integer(result2);
		System.out.println("결과값을 byte형 값으로 변경:"
				+resultObj.byteValue());
		System.out.println("결과값이 이진수로 변경:"
				+Integer.toBinaryString(result2));
		
		 //현재방식  : 오토박싱 or 오토언박싱 지원으로 인해 기본자료형 변수 선언과 동일하게 기술가능
		Integer numObj1 = 100;
		Integer numObj2 = 200;
		int num3 = numObj1;
		int result3 = numObj1 - numObj2;
		System.out.println("오토언박싱 이후 연산결과:"+result3);
		
		System.out.println("int형의 최대값:"+Integer.MAX_VALUE);
		System.out.println("int형의 최소값:"+Integer.MIN_VALUE);
		System.out.println("10진수를 2진수로:"+Integer.toBinaryString(10));
		System.out.println("10진수를 8진수로:"+Integer.toOctalString(10));
		System.out.println("10진수를 16진수로:"+Integer.toHexString(10));
	}
}
