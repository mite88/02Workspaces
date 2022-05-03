package ex05method;

import java.util.Iterator;
import java.util.Scanner;

public class E05MethodType04_2 {

	/*
	형태4] 매개변수O 반환값O
	
	시나리오]
	여러개의 숫자를 입력받은 후 최대값을 구하는 메서드
	
	단, 숫자의 갯수는 매개변수로 전달받고
	숫자의 갯수만큼 Scanner 클래스를 통해 입력받기
	입력받은 숫자중 최대값을 찾아서 반환하도록 정의
	*/
	public static void main(String[] args) {
		
		int maxValue1 = returnMaxNumber(4);
		System.out.println("최대값1:"+maxValue1); 
		
		//int maxValue2 = returnMaxNumber(6);
		System.out.println("최대값2:"+ returnMaxNumber(6)); 

	}
	
	//main에서 전달한 인수는 매개변수 numberCnt가 받아 해당 메서드에 사용
	static int returnMaxNumber(int numberCnt){
		//최대값 저장을 위한 변수
		Scanner scanner = new Scanner(System.in); 
		
		int maxVal = 0;
		
		for (int i = 0; i <=numberCnt; i++) {
			System.out.print("정수를 입력하세요:");
			int inputNum=scanner.nextInt();
			
			/*if(i==1) {
				//입력받은 정수중 최대값을 찾아야되서 기준값을 설정하기위해 할당
				maxVal = inputNum;
			}else {
				//새롭게 입력한 값이 이전값보다 크면 교체
				if(maxVal < inputNum) {
					maxVal = inputNum;
				}
			}*/
			
			if(i==1 && maxVal < inputNum) {
					maxVal = inputNum;
			}
		}
		
		return maxVal;
	}

}
