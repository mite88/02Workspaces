package ex06array;

public class E06ArrayInit {

	/*
	배열 생성시 크기가 지정되어 있는 경우 : 전체가 0으로 채워짐, 생성과 동시에 초기화
	2차원 배열에서 자리수가 부족한 경우 : null로 채워짐
	*/
	
	public static void main(String[] args) {
		
		int[] arr = new int[3];
		System.out.println("arr[0]"+arr[0]);
		
		int[][] arr2= new int[3][4];
		System.out.println("arr2[0][0]="+arr2[0][0]);
		
		int[] arrDim = {1, 2, 3};
		System.out.println("arrDim[0]="+arrDim[0]);
		
		int[][] arr2Dim = {
				{1},
				{2, 3}
		};

		System.out.println("arr2Dim[0][0]="+arr2Dim[0][0]);
		System.out.println("arr2Dim[0][1]="+arr2Dim[0][1]);
	}

}
