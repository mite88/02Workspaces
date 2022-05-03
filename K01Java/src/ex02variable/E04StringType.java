package ex02variable;

public class E04StringType {

	public static void main(String[] args) {

		int number;
		number = 99;
		
		/*
		 String 는 자료형이 아닌 클래스로 형변환이 안됨
		 - 기본자료형 : Stack영역
		 - 참조형(클래스) 변수 : Heap영역
		 "로감싸서 표현 
		 */
		//int stringNumber1 = (int)"100";
		//String stringNumber2 = (String)100;
		
		String strNumber = "100";
		System.out.println(strNumber + number);
		
		//클래스는 new키워드를 이용해 객체를 생성한다
		String newString = new String("new 키워드 사용");
		System.out.println(newString);
		
		//문자열 + 문자열
		String stringBasic = "클래스지만";
		String plusString = "기본자료형처럼 사용";
		System.out.println(stringBasic + " " +plusString);
		
		int kor = 100, eng = 99, math = 98;
		System.out.println("총점 : " + kor+eng+math);
		System.out.println("총점 : " + (kor+eng+math)); //우선순위를 이용하여 나타내는방법
	}

}
