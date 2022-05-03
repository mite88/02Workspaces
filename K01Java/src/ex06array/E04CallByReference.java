package ex06array;

public class E04CallByReference {

	/*
	Call by reference(참조에 의한 호출)

	메서드를 호출시 참조값전달(다른지역에서도 동일한 메모리(heap) 참조)
	참조값만 전달하므로 프로그램의 성능향상 및 메모리 절약
	*/
	public static void main(String[] args) {

		//배열 변수생성
		int[] arr= {100, 200};
		System.out.println("[메인메소드]-Swap전 출력");
		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i]+" ");
		}
		System.out.println("주소:"+arr);
		
		callByReference(arr);
		
		System.out.println("[메인메소드]-Swap이후 출력");
		for (int i = 0; i < arr.length; i++) {
			System.out.print(arr[i]+" ");
		}
		System.out.println("주소:"+arr);
		
	}
	
	public static void callByReference(int[] ref) {
		//전달받은 참조값으로 0번과 1번 index 값을 교환
		int temp;
		temp=ref[0];
		ref[0]=ref[1];
		ref[1]=temp;
		
		System.out.println("[callByReference메서드]-Swap이후 출력");
		for (int i = 0; i < ref.length; i++) {
			System.out.print(ref[i]+" ");
		}
		System.out.println("주소:"+ref);
	}

}
