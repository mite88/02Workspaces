package ex04controlstatement;

public class E01If03 {

	public static void main(String[] args) {

		/*
		조건문(비교식 or 논리식) - if ~ if else ~ else 문
		 
		if(조건식1) {  // 조건식1이 true일 경우 실행
		  실행문;
		} else if(조건식2){ // 조건식2이 true일 경우 실행
		  실행문;
		}else {     // 위 조건식이 무두 false일 경우 실행
		  실행문;  
		}
		
		조건문(비교식 or 논리식) - 삼항 연산자
		변수 = 조건식 ? 값 or 연산식(true일 경우) : 값 or 연산식(false일 경우);
		*/
		
		/*
		 시니라오
		 
		 국,영,수 점수의 평균값을 구하는 학저 출력
		 90점 이상 A학점 ~ 60점 미만 F학점
		 */
		int kor=99, eng=70, math=64;
		double avg = (kor+eng+math) / 3.0;
		System.out.println("평균점수는(그대로):"+avg);
		System.out.printf("평균점수는(소수2자리):%.2f\n",avg); //77.67
		
		if(avg >= 90) {
			System.out.println("A학점");
		}else if(avg >= 80) {
			System.out.println("B학점");
		}else if(avg >= 70) {
			System.out.println("C학점");
		}else if(avg >= 60) {
			System.out.println("D학점");
		}else{
			System.out.println("F학점. 학사경고 ㅜㅠ");
		}
		
		System.out.println("잘못된 조건식의 if문");
		
		/*
		 77.67이 첫번째 조건에 만족하기때문에 아래조건식은 실행되지않음
		 그래서 큰범위부터 if문을 한다.
		 */
		if(avg >= 60) {
			System.out.println("D학점");
		}else if(avg >= 70) {
			System.out.println("C학점");
		}else if(avg >= 80) {
			System.out.println("B학점");
		}else if(avg >= 90) {
			System.out.println("A학점");
		}else{
			System.out.println("F학점. 학사경고 ㅜㅠ");
		}
		
		/*만약 범위가 애매할 경우 구간을 정해주는 것이좋다*/
		if(avg >= 60 && avg <70) {
			System.out.println("D학점");
		}else if(avg >= 70 && avg <80) {
			System.out.println("C학점");
		}else if(avg >= 80 && avg <90) {
			System.out.println("B학점");
		}else if(avg >= 90) {
			System.out.println("A학점");
		}else{
			System.out.println("F학점. 학사경고 ㅜㅠ");
		}
		
	}

}
