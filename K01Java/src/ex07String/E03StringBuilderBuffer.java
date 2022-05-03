package ex07String;

public class E03StringBuilderBuffer {

	/*
	StringBuffer or StringBuilder
	
	- 문자열 저장 및 변경을 위한 메모리 공간을 지니는 클래스
	- 문자열 추가시 새롭게 생성된 메모리에 문자열을 저장되는데 
	  기존 메모리가 소멸되고 생성되는 걸 막기위해 
	  기존 메모리에 문자열을 변경하며 문자열의 변경이 잦은 경우 사용함
	  
    - 문자열 데이터 추가 : append메소드 / 삽입 : insert메소드 제공
    - 주로 Thread(쓰레드)에 안전한 StringBuffer를 사용함

	*/
	public static void main(String[] args) {
		StringBuffer strBuf = new StringBuffer("AB");
		
		//append메소드 : 문자열추가
		strBuf.append(25); //정수 추가
		strBuf.append("Y").append(true); //문자열과 boolean 값 연결
		System.out.println("strBuf="+strBuf);
		
		//insert메소드 : 중간에 문자열추가
		strBuf.insert(2, false); //2번째 index에 boolean 값 삽입
		strBuf.insert(strBuf.length(),'Z'); //마지막 내용(전체길이) 뒤에 문자 추가
		System.out.println("strBuf="+strBuf);
		
		System.out.println("String과 StringBuffer의 참조값 비교");
		String str1="코스모";
		String str2="코스모";
		
		if (str1 == str2) {
			System.out.println("연결전:주소값동일"); //출력
		}else {
			System.out.println("연결전:주소값다름");
		}
		
		str1 = str1 + " 영원하라";
		if (str1 == str2) {
			System.out.println("연결후:주소값동일");
		}else {
			System.out.println("연결후:주소값다름"); //출력
		}
		//기본 메모리는 16이지만 저장할 문자열이 늘어나면 알아서 확장
		StringBuffer buf = new StringBuffer();
		System.out.println("buf="+buf);
		System.out.println("저장된 문자열크기 : "+buf.length());
		System.out.println("기본 버퍼크기 : "+buf.capacity());
		
		buf.append("KOSMO");
		System.out.println("buf="+buf);
		System.out.println("저장된 문자열크기 : "+buf.length());
		System.out.println("기본 버퍼크기 : "+buf.capacity());
		
		buf.append(" 금일은 StringBuffer 공부중임")
		.append(" 오늘은 수욜~~~^^");
		System.out.println("buf="+buf);
		System.out.println("저장된 문자열크기 : "+buf.length());
		System.out.println("기본 버퍼크기 : "+buf.capacity());
		
		
	}

}
