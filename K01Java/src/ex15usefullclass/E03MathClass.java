package ex15usefullclass;

/*
JAVA의 규칙 
- java.lang패키지는 자동 import
- 모든 클래스는  Object클래스를 직/간접적으로 상속
*/
import java.lang.*;

public class E03MathClass extends Object{

	public static void main(String[] args){

		System.out.println("원주율:"+Math.PI);
		
		float f= -3.14f;
		double d = -100.9;
		int num = 10;
		
		/*
		Math클래스
		- java.lang패키지에 정의된 클래스
		- 수학과 관련된 일련의 작업들을 처리하는 메서드 정의
		- 메서드는 static로 선언되어 객체생성없이 클래스명으로 즉시사용 가능
		*/
		
		System.out.println("### 절대값 ###");
		System.out.println("Math.abs:"+Math.abs(f));
		System.out.println("Math.abs:"+Math.abs(d));
		System.out.println("Math.abs:"+Math.abs(num));
		
		System.out.println("### 올림 ###");
		System.out.println("Math.ceil:"+Math.ceil(3.4));//4.0
		System.out.println("Math.ceil:"+Math.ceil(-3.4));//-3.0
		System.out.println("Math.ceil:"+Math.ceil(3.9));//4.0
		
		System.out.println("### 내림 ###");
		System.out.println("Math.floor:"+Math.floor(3.4));//3.0
		System.out.println("Math.floor:"+Math.floor(-3.4));//-4.0
		System.out.println("Math.floor:"+Math.floor(3.9));//3.0
		
		System.out.println("### 반올림 ###"); //소수점첫째자리에서 반올림
		System.out.println("Math.round:"+Math.round(3.49999));
		System.out.println("Math.round:"+Math.round(3.54444));
		System.out.println("Math.round:"+Math.round(-1.4));
		System.out.println("Math.round:"+Math.round(-1.5));
		System.out.println("Math.round:"+Math.round(-3.51));
		
		System.out.println("### 최대/최소 ###");
		System.out.println("Math.max:"+Math.max(100,99));
		System.out.println("Math.min:"+Math.min(100,99));
		
		System.out.println("### 난수 ###");
		System.out.println((int)(Math.random()*45)+1);
		
		System.out.println("### 거듭제곱 ###");
		System.out.println("2의 10승은? :"+Math.pow(2,10));
		
	}

}
