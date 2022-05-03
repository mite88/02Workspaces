package ex05method;

import java.util.Scanner;

public class E05MethodType04_1 {

	/*
	형태4] 매개변수O 반환값O : 가장많이 사용되는 형태
	
	시나리오]
	인원수를 매개변수로 전달받아 인원수 만큼 
	나이를 입력받아 그 나이의 합을 반환하는 메서드
	*/
	public static void main(String[] args) {
		int sumOfAge=getTotlalAge(5);
		System.out.println("입력받은 나이의 합은?"+sumOfAge);

	}
	
	static int getTotlalAge(int personCnt) {
		Scanner scanner = new Scanner(System.in);
		int sumAge=0;
		
		for (int i = 0; i <= personCnt; i++) {
			System.out.print(i+"번째 사람의 나이:");
			int age =scanner.nextInt();
			sumAge += age;
		}
		
		return sumAge;
	}

}
