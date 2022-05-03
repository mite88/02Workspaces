package st_ect;

import java.util.Scanner;

/*
베르트랑 공준은 임의의 자연수 n에 대하여, n보다 크고, 
2n보다 작거나 같은 소수는 적어도 하나 존재한다는 내용을 담고 있다.

이 명제는 조제프 베르트랑이 1845년에 추측했고, 
파프누티 체비쇼프가 1850년에 증명했다.

예를 들어, 10보다 크고, 20보다 작거나 같은 소수는 4개가 있다. 
(11, 13, 17, 19) 또, 14보다 크고, 28보다 작거나 같은 소수는 3개가 있다. (17,19, 23)

자연수 n이 주어졌을 때, n보다 크고, 2n보다 작거나 
같은 소수의 개수를 구하는 프로그램을 작성하시오. 
*/
public class S03Bertrand {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int num = sc.nextInt(); //수입력
		
		/*
		 0,1 은 소수가 아닌데 출력에서 1이 그대로 되는걸로봐서
		 0만함
		 */
		while(num!=0) {
			int count = 0;			
			
			// n보다 크고, 2n보다 작거나  같은 소수
			for(int i = num + 1; i <= num * 2; i++) {
				boolean bl = false;
				for(int j = 2; j < i; j++) {
					/*
					 소수가 1하고 자기자신만 가지는거라
					 최소숫자인2~ n-1까지 해서 나누어 지는거 걸려냄
					 */
					if(i % j == 0) { 
						bl = true;
						break;
					}
				}
				if(!bl) count++;
			}
			
			System.out.println(count);
			num = sc.nextInt();
		}
		

	}

}
