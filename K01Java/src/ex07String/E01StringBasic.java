package ex07String;

public class E01StringBasic {

	/*
	String 객체(인스턴스) 생성
	- "문자열" 인스턴화
	- 문자열은 String라는 이름의 클래스로 표현
	- heap 영역에 생성됨
	
	String 객체의 참조방식 [상단이미지 참고]
	- String 인스턴스에 저장된 문자열의 내용은 변경 불가
	- 동일한 문자열의 인스턴스는 하나만 생성해서 공유함
	
	* 객체(인스턴스)의 비교의 경우 비교는 heap의 주소값을 비교함
	  따라서 new 를 이용하여 새로 생성한걸 비교하는경우 
	  주소값이 달라 false가 됨
	*/
	public static void main(String[] args) {
		int num1=10, num2=20;
		
		//기본 자료형의 경우 비교연산자를 통해 값에 대한 비교가능
		String numResult = (num1==num2)?
				"데이터가 같다" : "데이터가 다르다";
		
		System.out.println("비교결과:"+numResult);
		
		//객체(인스턴스)의 경우 비교는 주소값을 비교한다
		
		/*
		String클래스의 객체 생성 1
		- new를 사용하는 방법
		- 항상 새로운 메모리에 저장
		*/
		String str1 = new String("Hello JAVA");
		String str2 = new String("Hello JAVA");
		
		if(str1 == str2) {
			System.out.println("str1과 str2는 참조주소 같음");		
		}else {
			System.out.println("str1과 str2는 참조주소 다름");	//출력	
		}
		
		/*
		 비교할문자열.equals(비교대상문자열) 
		 - 객체에 저장된 두 문자열이 같은지 비교
		 - Object 클래스로부터 상속받은 메서드
		 */
		if(str1.equals(str2)) {
			System.out.println("두 문자열은 동일하다");//출력	
		}else {
			System.out.println("두 문자열은 다르다");
		}
		
		/*
		String클래스의 객체 생성 2
		"문자열" 
		- 더블쿼테이션 사용하는방법
		- 같은 문자열의 경우 같은 메모리를 참조
		- 주로 사용됨
		*/
		String str3="KOSMO";
		String str4="KOSMO";
		System.out.println("equals() 메소드로 문자열 비교:"+
		str3.equals(str4)); //true	
		
		if(str3 == str4) {
			System.out.println("주소가 같다");		//출력	
		}else {
			System.out.println("주소가 다르다");		
		}
		
	}

}
