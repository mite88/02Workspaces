package ex06array;

public class QuNumberCounter {

	/*
	
	다음에 주어진 answer 배열에는 1~4까지의 정수가 여러개 저장되어 있다. 
	배열 전체의 데이터를 읽어서 각 정수가 몇개씩 있는지 카운트하여 
	counter 배열에 순서대로 저장하시오.

	샘플코드]
	int[] answer = { 1,4,4,3,1,4,4,2,1,3,2  };
	int[] counter = new int[4];
	
	
	실행결과]
	counter[0] => 3
	counter[1] => 2
	counter[2] => 2
	counter[3] => 4


	*/
	public static void main(String[] args) {
		int[] answer = { 1,4,4,3,1,4,4,2,1,3,2  };
		int[] counter = new int[4];
		
		int[] temp_counter = new int[10];//중간값저장용 - 추가
	
		/*for (int i = 0; i < answer.length; i++) {
				
			counter[((answer[i]) - 1)] =(counter[((answer[i]) - 1)] +1);
		
		}*/
		
		//answer 배열내의 값을 돌면서 카운터한 값을 중간 저장하기(temp_counter)
		/*
		설명이 맞을련지 모르겠지만 ....
		
		temp_counter을 선언 및 초기화 시켜 0으로 초기화 시키고
		answer배열내의 값을 돌면서  
		answer배열내의 숫자와 해당 index의 숫자를 매치시켜 
		같을시 숫자를 플러스시키는방식 
		
		*/
		/*for (int i = 0; i < answer.length; i++) {
			temp_counter[answer[i]]++; 
		}
	
		
		//거기중 해당하는 숫자만 추출하기
		for (int c = 0; c < counter.length; c++) {

			//System.out.println(temp_counter[c+1] != 0);
			//0이 아닌숫자 찾아서 counter배열에 저장하기용
			if(temp_counter[c+1] != 0) {
				counter[c] = temp_counter[c+1];
			}
	
		}*/
		
		//실제 수업에서 제시한내용 - 아 ㅇㅊㅇ 넘어렵게 생각한건가 
		for (int i = 0; i < answer.length; i++) {
			//특정 인덱스의 원소를 1증가 시킴
			if(answer[i]==1) counter[0]++;
			if(answer[i]==2) counter[1]++;
			if(answer[i]==3) counter[2]++;
			if(answer[i]==4) counter[3]++;
		}
		
	
		for (int i = 0; i < counter.length; i++) {
			//System.out.println("counter["+i+"] =>"+counter[i]);
			//완성된 출력문에서 서식문자 및 변수를 이용하여 하나씩 수정하는것이 좋음
			System.out.printf("counter[%d] %d의 갯수 => %d%n",i, i+1,counter[i]);
		}

	}

}
