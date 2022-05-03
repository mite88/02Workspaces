package ex05method;

import java.util.Scanner;

public class E01MethodBasic {

	/*
	메서드..
	- java에서main메서드는무조건 public static void로 선언한다
	- static으로 선언된 메서드는 static로 선언된 메서드만 호출
	- 메서드 호출 후 반환값은 호출한 위치로 반환
	  (이때 메서드는 메모리에서 소멸)
	- 반환값이 없는 void
	*/
	
	//반환형 o, 매개변수 o 형태
	public static int simpleFunc(int a, int b) {
		int sum =a+b;
		return sum;
	}
	
	/*
	반환형 x, 매개변수 x 형태
	void - 반환값이 없음
	 */
	public static void menuPrint() {
		System.out.println("당신의 이름은 무엇인가요?");
		Scanner scanner =new Scanner(System.in);
		String name = scanner.nextLine();
		
		namePrint(name); //namePrint()메소드 호출
	}
	
	/*
	반환형 x, 매개변수 o 형태
	반환값이 없을 경우 실행이 종료되면 호출했던 지점으로 이동
	*/
	public static void namePrint(String n) {
		System.out.println("제 이름은 "+n+" 입니다.");
	}
	
	public static void main(String[] args) {
		//result에 simpleFunc()메소드의결과를 대입,매개변수는 같아야함
		int result=simpleFunc(1, 2); 
		System.out.println("1과 2를 전달한 결과:"+result);
		System.out.println("10과 20를 전달한 결과:"+simpleFunc(10, 20));
		
		menuPrint(); //menuPrint()메소드 호출
	}
}
