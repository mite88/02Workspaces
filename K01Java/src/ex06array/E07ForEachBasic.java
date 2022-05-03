package ex06array;

public class E07ForEachBasic {

	/*
	for-each문(Enhanced For / 향상된 for문)
	
	배열의 일부가 아닌 전체를 참조할때 주로 사용하는 for문
	참조의 목적으로만 사용해야하고, 값의 변경은 허용하지 않음
	코드가 짧고 간결함
	
	for (int i = 0; i < array.length; i++) {
		System.out.print(" " + array[i]);
	}
	------------↓--------------------------           
	for(int i : array) { 
		System.out.print(" " + i);
	 }

	*/
	public static void main(String[] args) {
		//1차원배열 선언 및 초기화
		int[] arr = {1,2,3,4,5};
		int sum =0;
		
		//일반 for문
		for (int i = 0; i < arr.length; i++) {
			sum += arr[i];
		}
		System.out.println("기본for문을 이용한 한계:"+sum);
		
		//배열 arr의 원소를 순서대로 하나씩 참조하며, 참조할 원소가없을때까지 출력
		sum=0;
		for (int e : arr) {
			System.out.print(e+" ");
			sum += e;
		}
		System.out.println("\nforeach문을 이용한 한계:"+sum);
		
		
		/*
		(43줄) b++;을 하고 출력해서 출력은 제대로 1씩 증가한 값이 나오지만 
		(50줄) foreach문은 참조만 하기에 실제 배열의 값이 바뀐건 아님
		 */
		System.out.println("배열arr의 요소값 1 증가시키기");
		for (int b : arr) {
			b++; 
			System.out.print(b+" "); 
		}
		
		System.out.println();
		System.out.println("배열arr의 요소 재출력하기");
		for (int c : arr) {
			System.out.print(c+" "); 
		}
		System.out.println();
		
		System.out.println("2차 배열을 foreach문으로 출력하기");
		int[][] twoDim= {
				{1,2,3,4},
				{10,20,30,40},
				{100,200,300,400}
		};
		
		for (int[] a : twoDim) {
			for (int b : a) {
				System.out.print(b+" "); 
			}
			System.out.println();
		}
	}

}
