package ex02variable;

import java.util.Random;

public class E05ConstantVar {

	public static void main(String[] args) {
		/*
		 상수(변하지 않는 메모리의 종류)
		 
		 - 맨앞에 final 키워드 사용
		 - 변수는 전부대문자로, 연결된 단어가 있을시 _ 사용
		 - 선언 후 반드시 초기화를 해야함
		 - 초기화값 설정 후 바꿀수 없음
		 - 주로 프로그램에서 코드의 가독성을 높여주기 위해 사용
		 
		final int MAX_NUM = 100;
		final double PI = 3.14159;
		 */
		
		final double PI = 3.14;//상수 선언 및 초기화
		System.out.println("PI(원주율)="+ PI);
		
		//PI=3.141592; //초기화 후 변경 불가능
		
		final String NICK_NAME;
		//System.out.println("우리는 "+NICK_NAME);//초기화를 해야함 
		
		NICK_NAME = "코스모";
		System.out.println("우리는 "+NICK_NAME);
		
		//가독성을 위해 사용한 예제
		final int SCISSOR= 1;
		final int ROCK =2;
		final int PAPER =3;
		
		int computer, user;
		
		computer = 1;
		user= 3;
		System.out.println("컴퓨터가 이겼습니다.");
		
		computer =SCISSOR;
		user= PAPER;
		System.out.println("Computer Win");
			
		

	}

}
