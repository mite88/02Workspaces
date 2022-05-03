package ex16exception;

import java.sql.Date;

public class Ex02PreDefineException4 {
	//정적변수 생성, 하지만 객체는 생성하지 않은상태
	static Date toDay;
	
	public static void main(String[] args)  {	
		
		System.out.println("### NullPointerException ###");
		/*
		 참조변수가 null인상태에서 출력시 
		 toString()메서드로 인해 문자열 형태로 null 출력되어
		 예외가 발생하지 않음
		 */
		System.out.println("toDay="+ toDay);
		try {			
			//인스턴스 변수는 생성했지만 참조할 객체가 없는경우 예외가 발생
			System.out.println(toDay.getTime());
		}
		catch(NullPointerException e) {
			System.out.println("toDay 참조변수는 null입니다.");
			System.out.println("예외메세지:"+ e.getMessage());
		}
				 
	}////end of main	
	 
}

