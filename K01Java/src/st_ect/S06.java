package st_ect;

import java.io.*;
import java.util.*;

/*
1920 정수찾기

여기서 보면 첫번째엔 몇개를 입력할지쓰는거고
*/
public class S06 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int n = sc.nextInt(); //몇개 입력할지 정함
		
		ArrayList<Integer> arr = new ArrayList<>(); //입력한 수저장용
		
		//n번짜기 돌려줌
		for (int i = 0; i < n; i++)
			arr.add(sc.nextInt()); //처음입력한거저장함
		
		int m = sc.nextInt(); //2번째 수 입력용
		
		//System.out.println("arr:"+arr);
		
		for (int i = 0; i < m; i++) {
			//배열을 현재입력한 수만큼돌려 입력한수가 있는지확인용

			if (arr.contains(sc.nextInt()))
				System.out.println(1);
			else
				System.out.println(0);
		}
		sc.close();
	}

}
