package ex15usefullclass;

import java.time.*;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

public class E06LocalDateTime {

	public static void main(String[] args) {
		
		LocalDate localDate = LocalDate.now();
		System.out.println("오늘날짜:"+localDate);
		
		LocalTime localTime = LocalTime.now();
		System.out.println("현재날짜:"+localTime);
		
		//날짜+시간 
		LocalDateTime monent = LocalDateTime.now();
		System.out.println("지금:"+monent);
		
		//날짜와 시간의 서식 적용
		DateTimeFormatter format1 = 
				DateTimeFormatter.ofPattern("yyyy년 MM월 dd일");
		DateTimeFormatter format2 = 
				DateTimeFormatter.ofPattern("HH시 mm분 ss초");
		DateTimeFormatter format3 = 
				DateTimeFormatter.ofPattern("오늘은 M월 W번째주, d번째날, F번째 E요일");
	
		//지정서식 출력
		System.out.println("서식1 : "+monent.format(format1));
		System.out.println("서식1 : "+monent.format(format2));
		System.out.println("서식1 : "+monent.format(format3));
		
		//특정 날짜 지정 : LocalDate.of(년, 월, 일)
		LocalDate xMas = LocalDate.of(localDate.getYear(), 12, 25);
		System.out.println("크리스마스 : "+xMas.format(format1));
		
		//Period클래스(x개월 x일 형태로 표시) : 두 날짜 사이 간격
		Period period = Period.between(localDate, xMas);
		System.out.println(period.getMonths()+"개월 "+period.getDays()+"일 남음");
		
		//ChronoUnit클래스(전체 중 남은....) : 특정 시간 단위로 차이를 구함
		System.out.println(ChronoUnit.MONTHS.between(localDate, xMas)+"개월 남음");
		System.out.println(ChronoUnit.DAYS.between(localDate, xMas)+"일 남음");
		
		//현재 기준으로 이전/이후 날짜 구함
		System.out.println("5일전 : "+monent.minusDays(5));
		System.out.println("3일후 : "+monent. plusDays(5));
		System.out.println("2개월후 : "+monent.plusMonths(5));
		System.out.println("1년후 : "+monent.plusYears(5));
		System.out.println("1년2개월3일후"+monent.plusYears(1).plusMonths(2).plusDays(3));
		
	}

}
