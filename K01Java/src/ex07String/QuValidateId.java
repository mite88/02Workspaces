package ex07String;

import java.util.Scanner;

public class QuValidateId {

	/*
	사용자로 부터 아이디를 입력받은 후 다음 조건에 만족하는지 
	확인할 수 있는 프로그램을 작성하시오.
	
	아이디는 8~12자 사이로만 사용할 수 있다. (length() 메서드 활용)
	영문과 숫자로만 입력할 수 있다. (charAt() 메서드 활용)
	특수기호, 공백, 그 외 모든 문자는 입력할 수 없다. 
	위 조건에 만족하면 true, 만족하지 않으면 false를 반환한다. 
	메서드명 : boolean idValidate(String inputId)
	힌트 : (idChar>='a' && idChar<='z') 이와 같은 조건을 사용하면 된당^^*
	
	실행결과]
	아이디를 입력하세요 : kosmo12
	사용할 수 있는 아이디입니다. 
	
	아이디를 입력하세요 : ko^smo 99
	사용할 수 없습니다.
	*/
	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.print("아이디를 입력하세요 : ");
		String id = scanner.nextLine();
		
		if(idValidate(id)) { //true
			System.out.println("사용할 수 있는 아이디입니다. ");
		}else { //false
			System.out.println("사용할 수 없습니다.");
		}
	}
	
	static boolean idValidate(String inputId) {

		boolean result = false;
		int idSize = inputId.length();
		
		
		if(idSize >=8 && idSize <=12) {
			
			//단어 길이만큼 하나씩 비교하기위해 반복문 작성
			for (int i = 0; i < idSize; i++) {
				char index_char = inputId.charAt(i);
				
				if((index_char>='a' && index_char<='z') ||
				(index_char>='A' && index_char<='Z' ) || 
				(index_char>='0' && index_char<='9' )) {
					result=true;
				}else {
					//하나라도 해당되는게 없으면 false로 함수끝내버림
					return false;
				}
				
			}
		}
		
		return result;	

	}

}
