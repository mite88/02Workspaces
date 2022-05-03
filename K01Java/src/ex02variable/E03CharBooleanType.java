package ex02variable;

public class E03CharBooleanType {

	public static void main(String[] args) {
		/*
		char 형(하나의 문자 저장)
		 
		영문, 숫자는 아스키코드(1byte)로 표현
		그 외의 문자는 유니코드(2byte)로 표현
		아스키코드와 유니코드는 문자를 2진수 형태로 표현한 것
		문자 저장 시 메모리에는 아스키코드 및 유니코드 값 저장
		코드 작성 시 ‘(싱글 쿼테이션)을 사용
		 */
		
		char ch1 = '가';
		//char chStr='가나다라';
		String chStr="가나다라"; //문자열의 경우 String를 사용, "(더블 퀘터이션)으로 감쌈
		System.out.println("ch1 = "+ ch1);
		System.out.println("chStr = "+ chStr);
		
		/*
		 아스키코드 : 1byte로 표현할 수 있는문자(숫자, 영문)를 십진수로 정의
		 예) A => 65, a => 97
		 
		 유니코드 : 1byte로 표현할 수 없는 문자(기타문자) 등을 2byte로 표현(16진수)
		 */
		char ch2 = 'A'; //65로 저장
		int num1 =2;
		int num2 = ch2 + num1; //아스키코드로 저장되어 덧셈가능
		System.out.println("num2 = "+ num2);//67
		System.out.println("(char)num2 = "+ (char)num2);//C
		
		char ch3 = (char)(ch2 + num1);
		System.out.println("ch3(문자출력) => " + ch3);
		System.out.println("ch3(아스키코드 출력) => " +(int)ch3);
		
		char ch4 = '1'; //문자형
		char ch4_1 = '1' + 1; //문자형 + 숫자형 
		System.out.println("ch4 = "+ ch4
				+ ", ch4_1 = " + ch4_1 
				+", ch4_1 = " + (int)ch4_1 );
		
		
		/*boolean 형(논리연산에서 사용) : 참, 거짓*/
		boolean bn1 = true;
		boolean bn2 = false;
		System.out.println("bn = "+ bn1 + ", bn2 = "+ bn2);
		
		/*
		 &&(논리 and) : 양쪽이 참이면 참, 그외는 거짓
		 ||(논리 or) : 한쪽이라도 참이면 참, 둘다 거짓이면 거짓
		 */
		boolean bn3 = bn1 && bn2;
		System.out.println("bn3(And) = "+ bn3);
		
		bn3 = bn1 || bn2;
		System.out.println("bn3(Or) = "+ bn3);
		
		bn3 = '가' > 30000;
		System.out.println("bn3 = "+ bn3);

	}

}
