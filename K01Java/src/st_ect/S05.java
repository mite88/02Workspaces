package st_ect;

import java.util.Scanner;

/*
2231문제
분해합문제
어떤 자연수 N이 있을 때, 
그 자연수 N의 분해합은 N과 N을 이루는 각 자리수의 합을 의미한다. 

198 = 198 + 1 + 9 + 8 = 216

이문제 풀이
여기서 중요한건 생성자를찾는것으로
수 n에서 생성자는 자기자신과 각자리수의 합이기 때문에
for문을돌려서 하면될거같다
*/
public class S05 {

	public static void main(String[] args) {
		Scanner in = new Scanner(System.in);
		int result = 0; //결과값
		
		int N = in.nextInt();
		
		//좀무식함 1부터 입력수 까지돌려서 일일히 하는....
		for(int i = 0; i < N; i++) {
			int number = i; 
			int sum = 0;	// 각 자릿수 합 
			
			//10으로 나누었을때 몫이 0인걸로 자릿수 확인
			while(number != 0) {
				sum += number % 10;
				// 나머지를 출력하기때문에 1의자리수출력
				number /= 10; //몫만 남기고 다시 돌림
			}
			
			// i 값과 각 자릿수 누적합이 같을 경우 (생성자를 찾았을 경우) 
			if(sum + i == N) {
				result = i;
				break;
			}
			
			
		}	
		System.out.println(result);

	}

}
