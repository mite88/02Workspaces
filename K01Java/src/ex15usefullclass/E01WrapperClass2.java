package ex15usefullclass;

import java.util.Iterator;

public class E01WrapperClass2 {

	public static void main(String[] args) {
		/*parseInt() : 숫자형식의 문자열을 정수로 변경*/
		String strNumber = "1000";
		System.out.println("10+strNumber="+(10+strNumber));
		System.out.println("10+strNumber를 숫자로 변경"
		+10+Integer.parseInt(strNumber));
		System.out.println("10+strNumber를 숫자로 변경"
				+10+Integer.valueOf(strNumber));
		
		//문자열이 있어 정수로 표현할수 x
		String money = "120원";
		//System.out.println("120원"+Integer.parseInt(money));
		
		/*parseDouble() : 숫자형식의 문자열을 정수로 변경*/
		/*실수형태의 문자열을 숫자 변경시 parseInt()x*/
		String floatString = "3.14";
		//System.out.println(Integer.parseInt(floatString));
		System.out.println("실수형(float)형으로 변경:"
				+Float.parseFloat(floatString));
		System.out.println("실수형(double)형으로 변경:"
				+Double.parseDouble(floatString));
		
		/*codePointAt():문자열에서 특정인덱스에 해당되는 한문자를 아스키코드로*/
		System.out.println("ABCD에서 3번쩨 인덱스 D의 아스키코드");
		System.out.println(Character.codePointAt("ABCD", 3));
		
		/*isDigit() :인자가 숫자인지 판단*/
		System.out.println("isDigit()를 통한 숫자 판단");
		System.out.println(Character.isDigit('A')?"숫자임":"숫자아님");
		System.out.println(Character.isDigit(50)?"숫자임":"숫자아님");
		System.out.println(Character.isDigit('7')?"숫자임":"숫자아님");
		
		/*isLetter():문자인지 판단(기호나 숫자형은 false)*/
		System.out.println("isLetter()메서드를 통한 문자 판단");
		System.out.println(Character.isLetter('가'));
		System.out.println(Character.isLetter('A'));
		System.out.println(Character.isLetter('#'));
		System.out.println(Character.isLetter('9'));

		/*isWhitespace():공백판단*/
		System.out.println("isWhitespace() 메서드 공백문자 판단");
		System.out.println(Character.isWhitespace('A'));
		System.out.println(Character.isWhitespace(' '));
		
		/*isLowerCase():소문자판단 / isUpperCase():대문자판단*/
		System.out.println("알파벳 대소문자 판단");
		System.out.println(Character.isLowerCase('A'));
		System.out.println(Character.isUpperCase('z'));
		System.out.println(Character.isLowerCase('a'));
		System.out.println(Character.isUpperCase('Z'));
		System.out.println(Character.isLowerCase('가'));
		
		
		
		//시나리오
		/*
		주어진 문자열안에 몇개의 공백문자(스페이스)가 있는지 판단
		참고)toCharArray(): 문자열을 char형의 배열로 반환
		*/
		
		String whiteString ="h e l l o";
		int whiteCount =0;
		
		//문자열을 char형배열로...
		char[] chArr = whiteString.toCharArray();
		
		for (int i = 0; i < chArr.length; i++) {
			if(Character.isWhitespace(chArr[i])) {
				whiteCount++;
			}
		}
		
		System.out.println("whiteCount:"+whiteCount);
	}

}
