package ex09package; //패키지 선언부 : 현재클래스의 위치

//임포트 선언부 : 다른클래스를 선언
import java.util.Date; 
import ex09package.kosmo.util.CommonUtil;

public class PackageMain {

	public static void main(String[] args) {
		/*
		하나의 클래스안에서 패키지는 다르나 캍은 이름의 클래스를
		사용해야한다면
		
		1. 클래스명 앞에 패지 전체 기술(풀경로)
		2. 하나의 클래스를 import하고 다른 하나는 패키지명 전체를 적는다
		*/
		Date utilDate = new Date();
		System.out.println("utilDate="+utilDate);
		
		java.sql.Date sqlDate =
			new java.sql.Date(utilDate.getTime());
		System.out.println("sqlDate="+sqlDate);
		
		/*
		ex09package 하위에 ex09package.kosmo.util패키지가 생기지만
		이두개는 다른 패키지로 인식함
		*/
		String strValue="987654321";
		boolean isNum = CommonUtil.isNumber(strValue);
		if(isNum ==true) {
			System.out.println("문자열은 숫자입니다");
		}else {
			System.out.println("숫자가 아닙니다");
		}
		System.out.println(
				ex09package.kosmo.util.CommonUtil.isNumber("백20"));
	}
}
