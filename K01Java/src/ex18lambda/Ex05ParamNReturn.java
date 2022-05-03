package ex18lambda;

import java.util.Iterator;
import java.util.Random;

//매개변수 ㅇ 반환타입 x
@FunctionalInterface
interface StringConcat{
	//두문자열 연결하여 출력
	public void makeString(String s1, String s2);
}

//매개변수 x 반환타입 ㅇ
@FunctionalInterface
interface RandomNumber{
	//난수생성
	public int randomNum();
}

//매개변수 ㅇ 반환타입 ㅇ
@FunctionalInterface
interface GugudanRange{
	//두정수만큼의구구단을 2단배열로 반환
	public String[][] guguString(int tn1, int n2);
}

//매개변수 x 반환타입 x
@FunctionalInterface
interface MenuPrint{
	//메뉴출력
	public void onlyPrint();
}

public class Ex05ParamNReturn {

	public static void main(String[] args) {
		System.out.println("### 람다식1");
		String s1="안녕하세요?";
		String s2="람다식입니다.";
		
		/*
		 2개의매개변수(String)를 추상메서드를 통해 유추가능해서 
		 람다식에선 생략
		 
		 메서드명 제거 후 괄호 사이에 화살표 삽입하여 정의
		 
		 호출시 부모인터페이스의 추상메서드 makeString() 이용
		 */
		StringConcat sc = (a, b) -> {
			System.out.println(a+" "+b);
		};
		
		sc.makeString(s1, s2);
		
		/*
		 매개변수가 없는 람다식 정의로 인해
		 소괄호는 비어있음
		 */
		System.out.println("\n### 람다식2");
		RandomNumber randomNumber = () -> {
			Random random = new Random();
			return random.nextInt(100);
		};
		
		//반환값이 있으므로 좌측항의 변수로할당
		int rNumber = randomNumber.randomNum();
		System.out.println("생성된 난수"+rNumber);
		
		System.out.println("\n### 람다식3");
		//2차원배열 선언후 구구단을 각 원소에 삽입
		GugudanRange gugudanRange = (num1, num2) ->{
			
			String[][] gugudan = new String[9][9];
			//num1~num2단까지출력
			for (int i = num1; i <=num2 ; i++) {
				for (int j = 1; j <= 9; j++) {
					gugudan[i-1][j-1] = i+"*"+j+"="+(i*j);
				}
			}
			
			//배열의 참조값 반환
			return gugudan;
		};
		
		//람다식 호출도 마찬가지 이차원배열의 반환값가짐
		String[][] returnStr = gugudanRange.guguString(4, 6);
		for (int i = 4; i <=6 ; i++) {
			for (int j = 1; j <= 9; j++) {
				System.out.print(returnStr[i-1][j-1]+" ");
			}
			System.out.println();
		}
		
		//단순히 문자열만 출력하는 람다식 
		System.out.println("\n### 람다식4");
		MenuPrint menuPrint = () -> {
			System.out.println("메뉴를 출력합니다.");
		};
		menuPrint.onlyPrint();

	}

}
