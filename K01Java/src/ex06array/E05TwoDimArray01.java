package ex06array;

import java.util.Iterator;

public class E05TwoDimArray01 {

	/*
	2차원 배열
	
	int[][] arr2 = new int[3][2];
	            ___________________________
	           | arr2[0][0] |  arr2[0][1] | 
	arr2  ---> | arr2[1][0] |  arr2[1][1] | 
	           | arr2[2][0] |  arr2[2][1] |  
	            ￣ ￣ ￣ ￣ ￣ ￣ ￣ ￣ ￣ 
	
	접근 시 중첩 for문 필요
	*/
	public static void main(String[] args) {
		/*
		아래와 같이 2차원배열을 초기화시 
		세로(행)3, 가로(열)4인 배열이 생기고, 
		요소가 없는 부분은 null(빈값)로 채워진다.
		*/
		int[][] arr = {
				{1, 2},
				{3, 4, 5},
				{6, 7, 8, 9}
		};
		
		System.out.println("배열의 가로크기: "+arr.length);
		
		for (int i = 0; i < arr.length; i++) {
			System.out.printf("%d행의크기 : %d%n", i, arr[i].length);
		}
		
		/*
		배열 생성시 크기가 지정되어 있는 경우 : 전체가 0으로 채워짐
		2차원 배열에서 자리수가 부족한 경우 : null로 채워짐
		*/
		
		int[] arr2 =new int[5];
		arr2[0]=1;
		
		System.out.println("arr2:"+arr2); //주소값
		
		//0으로채워지는것처럼보이지만 아스키코드0(\0)은 null이다
		System.out.println("arr2[1]:"+arr2[1]); //원소

		
		System.out.println("배열 출력하기");
		System.out.println("arr[0][1]:"+arr[0][1]);
		//해당 index의 값이 null 이므로 ArrayIndexOutOfBoundsException 에러가 발생
		System.out.println("arr[0][3]:"+arr[0][3]); 
	}

}
