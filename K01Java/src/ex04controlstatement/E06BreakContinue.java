package ex04controlstatement;

public class E06BreakContinue {

	public static void main(String[] args) {
		/*
		break / continue
		
		break : 가장 가까운 반복문 하나 탈출
		continue : 반복문의 처음으로 이동, continue 하위의 문장은 실행되지않음
		
		* 반복문 내에서 break / continue 를 사용할때는 반드시 조건문과 함께 기술

		*/
		
		int i=0;
		while (true) {

			i++;
			System.out.printf("[i가 %d일때]\n", i);
			
			System.out.println("continue이전 출력물");
			//조건을 만족하면 이후건 실행되지 않고 반복문 첨으로 돌아간다
			if(i%2 == 0) continue; 
			System.out.println("continue이후 출력물");
			
			System.out.println("break이전 출력물");
			//조건을 만족하면 반복문을 빠져나간다
			if(i == 3) break;
			System.out.println("break이후 출력물");
		}
		
		System.out.println("--------------------------------");
		
		for (int x = 1; x <= 5 ; x++) {
			System.out.println("x="+x);
			
			for (int y = 1; y <= 5; y++) {
				System.out.println("y="+y);
				
				if(y==3) {
					break; //가장 가까운 반복문 하나만 빠져나옴 , y=3까지만출력
				}
				
			}
		}

	}

}
