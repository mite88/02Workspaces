package ex06array;

public class E03CallByValue {

	/*
	Call by value(값에 의한 호출)
	
	메서드 호출과 관련
	매개변수를 통해 값 전달시 메모리의 "복사"를 통해값 전달
	스택영역만 사용함
    main과호출된 메서드는 서로 다른지역이므로 서로에게영향이 없음
	*/
	public static void main(String[] args) {
		int first =100, second=200;
		
		System.out.println("[main메소드 안 - 호출 전]"+
		"first="+first+", second="+second);
		callByValue(first, second);
		
		/*매개변수로 전달된 값이 복사되어 다른지역의 메서드내에서만 변경되므로
		  main메서드에선 기존값유지
		*/
		System.out.println("[main메소드 안 - 호출 후]"+
				"first="+first+", second="+second);
		
	}
	
	public static void callByValue(int fNum, int sNum) {
		/*
		Swap(교환) : 
		2개의 변수가 할당받은 값을 서로 교환하며 임시변수(temp) 하나가 추가로 필요
		 */
		int temp;
		temp=fNum;
		fNum=sNum;
		sNum=temp;
		
		//해당 메서드 안에서는 값이 변경된 후 출력
		System.out.println("[callByValue메소드안]"+
				"first="+fNum+", second="+sNum);
	}

}
