package ex02variable;

public class Qu01Jumsu {

	public static void main(String[] args) {
		/*
		1.국어, 영어, 수학점수 및 과목의 총점을 저장할수 있는 변수를 선언하시오.
		2.국어 89점, 영어 99점, 수학 78점을 대입한다.
		3.국영수 총합을 구해서 총점을 저장할 변수에 대입한다.
		4.총합점수를 출력한다.
		
		실행결과]
		국어:89, 영어:99, 수학:78
		총점:266
		 */
		
		int kor=89, eng=99, math=78;
		int sum=kor+eng+math;
		
		System.out.println("국어:"+kor+", 영어:"+eng+", 수학:"+math);
		System.out.println("총점:"+sum);
		
		System.out.printf("%s%d%n","총점:",sum);

	}

}
