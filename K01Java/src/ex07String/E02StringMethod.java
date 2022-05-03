package ex07String;

public class E02StringMethod {

	public static void main(String[] args) {
		System.out.println("String 클래스의 주요 메서드");
		
		String str1 = "Welcome to java";
		String str2 = "자바야 놀자";
		
		//length() : 문자열의 길이
		System.out.println("str1의 길이:"+str1.length());
		System.out.println("str2의 길이:"+str2.length());
		System.out.println("오늘은 좋은".length()); //이것도 출력됨
		
		System.out.println("============================");
		
		//charAr(인덱스) : 특정 index의 문자하나를 반환
		System.out.println("str1의 두번째문자:"+str1.charAt(1));
		System.out.println("str2의 두번째문자:"+str2.charAt(1));
		
		//주민등록번호를 이용하여 성별판단하는 프로그램
		
		String juminNum = "190419-5000000";
		//앞의 문자열의 8번째문자(index는 7번째)이 성별에 해당되는 문자
		if (juminNum.charAt(7)=='1' || juminNum.charAt(7)=='3') {
			System.out.println("남자입니다");
		}else if (juminNum.charAt(7)=='2' || juminNum.charAt(7)=='4') {
			System.out.println("여자입니다");
		}else if (juminNum.charAt(7)=='5' || juminNum.charAt(7)=='6') {
			System.out.println("외국인입니다");
		}else {
			System.out.println("주민번호가 잘못되었습니다.");
		}
		
		System.out.println("============================");
		
		//codePointAt(인덱스) : 해당인덱스에 해당되는 문자의 아스키(유니)코드 출력
		System.out.println("str1 첫번째 문자의 아스키코드:"+str1.codePointAt(0));
		System.out.println("str2 첫번째 문자의 아스키코드:"+str2.codePointAt(0));
		
		/*
		compareTo() : 문자열비교(앞부터차례대로), 
		앞문자열이 크면 양수, 뒷문자열이 크면 음수, 0이면 같음
		*/
		String str3="A";
		String str4="B";
		System.out.println(str3.compareTo(str4));//-1
		System.out.println(str4.compareTo(str3));//1
		System.out.println("ABC".compareTo("ABC") ==0 ?
				"문자열이 같다" : "문자열이 다르다");//0
		
		System.out.println("============================");
		
		//concat() : 문자열연결
		System.out.println("JAVA".concat(" WORLD").concat(" GO"));
		System.out.println("JAVA WORLD GO");
		
		System.out.println("============================");
		
		//contains() : 특정문자열 포함여부확인
		System.out.println(str1.contains("To"));//false
		System.out.println(str1.contains("to")); //true
		
		/*
		해당문자열이 이메일 형식인지 검사하는 프로그램
		*/
		String email1="hong@ikosmo.co.kr";
		if(email1.contains("@") && email1.contains(".")) {
			System.out.println("이메일 형식임");
		}else {
			System.out.println("이메일형식이 아님");
		}
		
		System.out.println("============================");
		
		//endsWith() : 특정문자로 끝나는지 ...
		//startWith() : 특정문자로 시작하는지 ...
		System.out.println("www.daum.net".endsWith("net")); //true
		System.out.println("naver.com".endsWith("http")); //false
		
		System.out.println("============================");
		
		//format() - 서식지정용(System.out.printf()), 주로웹용으로 사용
		System.out.printf("국어:%d, 영어:%d, 수학:%d%n", 81, 92, 100);
		
		String formatStr = String.format("국어:%d, 영어:%d, 수학:%d%n",
				81, 92, 100);
		System.out.println(formatStr);
		
		System.out.println("============================");
		
		
		/*
		 indexOf() : 문자열이 포함여부확인 + 몇번째(index)있는지 알려줌
		 * index 는 0부터이므로 포함이 안되어있다면 -1로 잡음
		 */
		System.out.println(str1.indexOf("ava"));
		System.out.println(str1.indexOf("J"));
		System.out.println(email1.indexOf("@") != -1 ?
				"이메일형식맞음" : "이메일형식아님");
		
		juminNum = "120403-3012345";
		int index= juminNum.indexOf("-")+1;

		if (juminNum.charAt(index) == '3') {
			System.out.println("남자");
		} else {
			System.out.println("여자");
		}
		
		System.out.println("============================");
		
		//lastIndexOf() : indexOf()랑 같은데 마지막 요소부터 찾음  ex)확장자
		System.out.println(str1.lastIndexOf("ava"));
		System.out.println(str1.lastIndexOf("J"));
		System.out.println("indexOf"+str1.indexOf("a")); //12
		System.out.println("lastIndexOf"+str1.lastIndexOf("a"));//14
		
		System.out.println("============================");
		
		//replace : 해당문자열이 있으면 다른 문자열로 변경
		System.out.println("J를 G로 변경하기");
		System.out.println(str1.replace("J", "G"));
		System.out.println("java를 KOSMO로 변경하기");
		System.out.println(str1.replace("java", "KOSMO"));
		
		System.out.println("============================");
		
		//split() : 문자열을 해당 문자열로 쪼개서 String타입의 배열로 저장함
		String phoneNumber = "010-1234-5678";
		String[] phoneArr = phoneNumber.split("-");
	
		for (int i = 0; i < phoneArr.length; i++) {
			System.out.printf("phoneArr[%d]=%s%n", i, phoneArr[i]);
		}
		
		//구분자로 사용한 문자열이 없으면 문자열 전체가 반환 = 배열크기가 1이됨
		phoneArr = phoneNumber.split("%");
		for (int i = 0; i < phoneArr.length; i++) {
			System.out.printf("phoneArr[%d]=%s%n", i, phoneArr[i]);
		}
		
		System.out.println("============================");
		
		/*
		substring() : 문자열을 해당 index 기준으로 자르기
		 
		substring(시작index) - 인덱스부터끝까지
		substring(시작index, 종료index) -해당부분만
		 */
		System.out.println(str1.substring(3));
		System.out.println(str1.substring(3, 7));
		
		//파일명에서 확장자를 자르는 프로그램작성
		String filename = "my.file.images.jpg";
		int beginIndex = filename.lastIndexOf(".") + 1;
		System.out.println("파일의 확장자는 : "+filename.substring(beginIndex));
		
		System.out.println("============================");
		}

}
