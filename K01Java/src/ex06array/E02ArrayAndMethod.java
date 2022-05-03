package ex06array;

public class E02ArrayAndMethod {

	/*
	 * 배열과 메소드 배열도 함수의 매개변수를 통해 다른 함수를 호출할 때 전달 가능
	 */
	public static void main(String[] args) {
		//배열 선언과 동시 초기화
		int[] arr = { 1, 2, 3, 4, 5 };
		//배열 선언
		int[] ref;

		System.out.println("초기화 직후 출력");
		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i] + " ");
		}
		System.out.println();

		//배열명으인수로 전달함 :배열의 참조(주소)값을 전달
		ref = addAllArray(arr, 7);
		//addAllArray()메서드에서 반환값은 처음에 전달된 배열의주소값 = ref 동일

		System.out.println("메소드 호출 후 출력");
		for (int i = 0; i < ref.length; i++) {
			System.out.print(ref[i] + " ");
		}
		System.out.println();

		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i] + " ");
		}

	}

	//매개변수로 전달된 배열의 참조값을 ar이 받음=> 동일한배열 참조
	static int[] addAllArray(int[] ar, int addVal) {
		
		for (int i = 0; i < ar.length; i++) {
			ar[i] += addVal; //ar[i] = ar[i] + addVal;
			
		}
		return ar;//참조값 그대로 반환
	}

}
