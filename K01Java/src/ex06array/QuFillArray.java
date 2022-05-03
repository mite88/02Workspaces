package ex06array;

import java.util.Scanner;

public class QuFillArray {

	/*
	길이가 10인 배열을 선언한 후 총 10개의 정수를 입력받아 순서대로 저장한다. (첫번째배열)
	그리고 순서대로 저장된 숫자들을 홀수는 배열의 앞에서부터 채워나가고 
	짝수는 배열의 끝에서부터 채워나간다.(두번째배열)
	
	실행결과]
	1번째 정수를 입력하세요:2
	2번째 정수를 입력하세요:4
	....
	9번째 정수를 입력하세요:5
	10번째 정수를 입력하세요:1
	순서대로입력된결과
	2 4 5 3 2 9 7 8 5 1 
	홀수/짝수 구분입력결과
	5 3 9 7 5 1 8 2 4 2 


	*/
	public static void main(String[] args) {

		Scanner scanner = new Scanner(System.in);
		int[] num_array = new int[10]; 
		int[] num_array_result = new int[10]; 
		
		int left_num=0, right_num= (num_array.length-1), num=0;
		
		for (int i = 0; i < num_array.length; i++) {
			System.out.print((i+1)+"번째 정수를 입력하세요:");
			num_array[i]=scanner.nextInt(); 
		}
		
		System.out.println("순서대로입력된결과");
		for (int j = 0; j < num_array.length; j++) {
			
			System.out.print(num_array[j]+" ");	
		}
		System.out.println();
		
		for (int r1 = 0; r1 < num_array.length; r1++) {
			num=num_array[r1];
				
			//System.out.println(right_num);
				if(num_array[r1] % 2 == 1) {	//홀수
					/*num_array_result[left_num]=num;
					left_num++;*/
					num_array_result[left_num++]=num;
				}else {    //짝수
					num_array_result[right_num]=num;
					right_num--;
				}
				
			
		}
		
		System.out.println("홀수/짝수 구분입력결과");
		for (int i = 0; i < num_array_result.length; i++) {
			System.out.print(num_array_result[i]+" ");
			
		}

	}
	


}
