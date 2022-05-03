package st_ect;

import java.io.*;
import java.util.Scanner;

/*
 15651문제
 풀이
 - 1부터 N까지 자연수 중에서 M개를 고른 수열
 - 같은 수를 여러 번 골라도 된다.
 
 결과를 보니
 1~N 사이에 자연수의 경우의 수를 다 뽑는 결과가 나옴 
*/


public class S04mandn {
	static int[] arr;
	static int N, M;

	public static void main(String[] args) {

		Scanner scan = new Scanner(System.in);
		N = scan.nextInt();
		M = scan.nextInt();
		arr = new int[M];

		solution(0);

	}

	public static void solution(int index) {

		//길이가 M이 되면 현재까지 돌린거에서 다음으로 이동함
		if (index == M) {
			for (int s : arr) {
				System.out.print(s + " ");
			}
			System.out.println();

		} else {
			//깊이를 1씩 증가시키면서 재귀호출
			//1부터 N까지 for문을 돌림
			for (int i = 1; i <= N; i++) {
				arr[index] = i; //배열에 추가
				//1더해서 다음자연수를 돌리기 위한 ....N까지 함수가 돌려질것음
				solution(index + 1); 
		
			}
		}	

	}

}

