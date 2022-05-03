package ex06array;

public class E01OneDimArray01 {

	/*
	배열(Array)
	- 같은 타입의 둘이상 데이터를 저장할수 있는 메모리공간으로 
	  순차적인 메모리 공간이 할당되는 형태의 변수
	- 힙(Heap)영역에 저장, 
	- 메모리의 주소값(참조값)반환하며 해당 주소를 통해 배열에 접근함
	
	int num1, num2~~~ num10;   =>  int[] iArr = new int[10];
	
	<순차적접근>
	일반적 
	num1=num2=num3=10;
	
	배열기반
	for(int i=0; i<3; i++){
		numArr[i]=3; 
		//여기서 [i]를 index라함 
		//index의 처음은 [0] : 크기가 n인 배열은 0부터 n-1까지
	}
	
	<1차원배열>
	------------------------------
	|   1   |   2   | ~~~ |  9   |
	------------------------------
	 num[0]   num[1]  ~~~  num[8]
	 
	<선언>
	자료형[] 배열명 = new 자료형[크기];
    자료형 배열명[] = new 자료형[크기];

	int[] arrName = new int[10];
	int arrName[] = new int[10];
	
	<초기화>
	int i_arr[6] = new int[]{1,2,3,4,5,6}; // 갯수로 크기를 알수있기에 길이는 생략함
	int i_arr[6] = {1,2,3,4,5,6};
	*  초기화 없이 선언 : 정수형은 0, 실수형은 0.0, 객체배열은 null 로 초기화

	*/
	public static void main(String[] args) {
		int[] numArr = new int[3];
		//인덱스를 통해 접근후 각요소를 초기화
		numArr[0]=10;
		numArr[1]=20;
		numArr[2]=30;
		
		System.out.println("배열명(newArr)="+numArr); //메모리의 주소값
		System.out.println("newArr 2번방의 값:"+numArr[2]);
		System.out.println("===============================");
		
		/*
		변수가 여러개이므로 반복문을 이용하여 접근
		
		배열명.length : 해당배열크기 반환
		 */
		int[] arrNumber = new int[40];
		for (int i = 0; i < arrNumber.length; i++) {
			arrNumber[i] = i+10;
		}
		
		for (int i = 0; i <40; i++) {
			//배열의 각요소 출력
			System.out.println(i+"번방의 값="+arrNumber[i]);
		}
		System.out.println("===============================");
		
		/*
		객체배열: 기본자료형이 아닌 객체의 참조값을 저장하는 배열
		*/
		String[] strArr = new String[3];
		//인덱스를 통해 접근후 각요소를 초기화
		strArr[0] ="java";
		strArr[1] ="jsp";
		strArr[2] ="spring";
		
		for (int j = 0; j < strArr.length; j++) {
			System.out.println(strArr[j]);
		}

		System.out.println("===============================");
		
		System.out.println("배열의 선언과 초기화");
		System.out.println("방법1 : 배열의선언 이후 초기화");
		int[] initArr = new int[1]; //크기 1인배열선언
		initArr[0] = 100; //접근하여 초기화
		System.out.println("initArr[0] = "+initArr[0]);
	
		/*
		배열 선언과 동시에 초기화하는경우
		자바컴파일러는 초깃값 갯수를 통해 배열의 크기를 결정하므로
		이런 경우 크기는 생략해야함
		*/
		System.out.println("방법2 : 선언과 동시에 초기화1");
		//int[] initArr2 = new int[3] {1,20,300}; //에러
		int[] initArray2 = new int[] {1,20,300};
		
		/*
		배열 원소의 갯수를 통해 배열 생성 후 초기화 동시진행
		이경우 new 생략가능
		*/
		System.out.println("방법3 : 초기값만으로 선언");
		int[] initArr3= {11, 13, 17 ,19, 23};
		int arrSum = 0;
		for (int x = 0; x < initArr3.length; x++) {
			arrSum += initArr3[x];
		}

		System.out.println("배열요소의 합은 = "+arrSum);
	}

}
