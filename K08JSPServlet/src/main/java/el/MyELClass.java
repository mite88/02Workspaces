package el;

public class MyELClass {
	//주민등록번호로 성별 판단
	public String getGender(String jumin) {
		String returnstr = "";
		//주민등록번호에서 ("-")다음문자의 인덱스 찾기
		int beginIdx = jumin.indexOf("-")+1;
		//성별관련 문자잘라냄
		String genderStr = jumin.substring(beginIdx, beginIdx+1);
		//문자열을 정수형으로 형변환
		int genderInt = Integer.parseInt(genderStr);
		
		if(genderInt == 1 || genderInt == 3) {
			returnstr = "여자";
		}else if(genderInt == 2 || genderInt == 4) {
			returnstr = "남자";
		}else {
			returnstr="주민번호 오류입니다.";
		}
		return returnstr;

	}
	
	//숫자판단
	public static boolean isNumber(String value) {
		//String타입의 인수를 char형의 배열로 반환
		char[] chArr = value.toCharArray();
		//문자크기 만큼 반복
		for (int i = 0; i < chArr.length; i++) {
			//각 인덕스의 문자의 아스키고드값을 확인하고 숫자를벗어나면 false
			if(!(chArr[i] >= '0' && chArr[i] <= '9')) {
				return false;
			}
		}
		
		//모든문자가 숫자면 true
		return true;
	}
	
	//구구단
	public static String showGugudan(int limitDan) {
		/*
		String클래스의 경우 문자열 변경마다 새로운 메모리를 할당하여 
		문자열 변경이 많은 경우는 StringBuffer클래스를 사용함
		 */
		
		StringBuffer sb = new StringBuffer();
		
		try {
			sb.append("<table border='1'>");
			for (int i = 2; i <= limitDan; i++) {
				sb.append("<tr>");
				for (int j = 1; j <= 9; j++) {
					sb.append("<td>"+i+"*"+j+"="+(i*j)+"</td>");
				}
				sb.append("</tr>");
			}
			sb.append("</table>");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return sb.toString();
	}
	
}
