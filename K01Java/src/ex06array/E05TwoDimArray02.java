package ex06array;

public class E05TwoDimArray02 {

	public static void main(String[] args) {

		//3행 4열의 2차원 배열 선언
		int[][] arr2Dim = new int[3][4];
		
		//각 행,열크기만큼 반복하면서 배열 초기화
		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 4; j++) {
				arr2Dim[i][j] = i + j;
			}
		}
		
		//초기화된 데이터 출력 
		/*
		 배열명.length:배열의 행크기
		 배열명[index].length :배열의 열크기
		 */
		for (int n = 0; n < arr2Dim.length; n++) {
			for (int m = 0; m < arr2Dim[n].length; m++) {
				System.out.print(arr2Dim[n][m]+" ");
			}
			System.out.println();
		}
		
		/*
		시나리오]
		다음 절차에 따라 프로그램을 작성하시오
		1. 2차원배열 생성(2*4)
		2. 난수를 이용하여 배열 초기화
		3. 배열 전체요소를 매개변수로 전달된 정수만큼 증가
		4. 증가되기 전, 후 배열 출력
		5. 다음 메소드명으로 구현 twoDimPlus()
		*/
		
		//2행 4열 2차원 배열 생성
		int[][] twoArray = new int[2][4];
		
		//난수로 각원소 초기화
		for (int i = 0; i < twoArray.length; i++) {
			for (int j = 0; j < twoArray[i].length; j++) {
				twoArray[i][j] = (int)(Math.random() * 100);
			}
		}
		
		System.out.println("===초기화 후====================");
		showArray(twoArray);
		twoDimPlus(arr2Dim, 10);
		
		System.out.println("===메소드 호출 후====================");
		showArray(twoArray);
	}
	
	//배열의 참조값을 통해모든 원소 반복하여 출력
	static void showArray(int[][] arr2) {
		for (int i = 0; i < arr2.length; i++) {
			for (int j = 0; j < arr2[i].length; j++) {
				System.out.printf("%-3d", arr2[i][j]);
			}
			System.out.println();
		}
	}

	//2차원 배열에 전달된 정수크기만큼 각 원소 증가
	static void twoDimPlus(int[][] arr2, int plusNum) {
		for (int i = 0; i < arr2.length; i++) {
			for (int j = 0; j < arr2[i].length; j++) {
				arr2[i][j] += plusNum;
			}
		}
	}
}
