package ex15usefullclass;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/*
Calendar클래스를 통해 얻은 객체를 초로 변환 후
매개변수로 전달된 날짜서식으로 변경한 문자열 반환

getTime() :  서버기준시인 1970-01-01을 기준으로 현재까지의 시간을 초단위로 반환
*/
public class E05Date {
	public static String myDateFormat(Calendar c, String formatStr) {
		Date date = c.getTime();
		return new SimpleDateFormat(formatStr).format(date);
	}

	public static void main(String[] args) {
		//Calendar클래스는 대표적인 싱근톤 객체라 new로 생성하지 않음
		Calendar calendar = Calendar.getInstance();
		/*
		월과 분을 표현하는 이니셜이 동일해서
		월은 대문자, 분은 소문자로 표현함
		*/
		String nowStr1 = myDateFormat(calendar, "yyyy-MM-dd HH:mm:ss");
		System.out.println("현재:" + nowStr1);

		String nowStr2 = myDateFormat(calendar, 
				"오늘은 M월의 W번째주, d번째 날, F번째 E요일");
		System.out.println("현재2:" + nowStr2);

		//현재날짜의 전/후를 구하기 위한 메서드 , 음수시 과거날짜 구함
		calendar.add(Calendar.DATE, 3);
		calendar.add(Calendar.MONTH, 2);
		calendar.add(Calendar.YEAR, 1);

		String nowStr3 = myDateFormat(calendar, "yyyy년 MM월 dd일");
		System.out.println("1년2개월3일후:" + nowStr3);

		//올해 크리스마스까지 남은 날짜 계산
		//두가지 서식의 날짜를 파싱하여 날짜객체를 통해 계산
		String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		String future = "2022/12/25";
		// System.out.println(today+" "+future);

		//
		long result = myDiffDate(today, future);
		System.out.println(today + "에서 " + future + "까지 남은날짜:" + result);
	}

	
	public static long myDiffDate(String today, String future) {
		long diffDays = 0;
		try {
			//각 날짜 서식을 적용하여 날짜객체로 변환
			Date formateToday = new SimpleDateFormat("yyyy-MM-dd").parse(today);
			Date formateFuture = new SimpleDateFormat("yyyy/MM/dd").parse(future);
			
			/*getTime()로 부터 얻은 시간이 총 13자리 정수값인데 
			 1~10 : 순수한초
			 11~13 : 밀리세컨즈
			 * 1000으로 나누어서 뒤에 3자리를 없애면 순수한 초만남아
			 남은 날짜를 구할수 있음
			 */
			diffDays = (formateFuture.getTime() - formateToday.getTime())
				/(24*60*60*1000);
		} catch (Exception e) {
			
		}
		return diffDays;
	}
}
