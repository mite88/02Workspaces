package ex02variable;

public class E06EscapeSequence {

	public static void main(String[] args) {
		/*
		prinf()의 이스케이프 시퀀스
		
		\n : 줄바꿈
		\t : 탭(Tab)
		\" : 큰 따옴표
		\\ : 역슬래쉬
		%f : 실수
		%c : 문자
		%s : 문자열
		%d : 10진수 정수
		%o : 8진수 정수
		%x : 16진수 정수
		%n : 줄바꿈
		
		* %뒤에 숫자 및 문자를 삽입시 정렬을 맞추어서 입력이 가능해진다.
		(+ 우측정렬 / -좌측정렬)
		
		*/
		
		//\t : 탭(Tab)
		System.out.println("4월엔 벚꽃~~!");
		System.out.println("4월엔\t벚꽃~~!");
		
		//\n : 줄바꿈
		System.out.print("KOSMO에 오신걸 환영합니다. \n");
		System.out.print("열심히\n해봅시다. \n");
		
		//\" : 큰 따옴표 - 문자열 사이에 더블쿼테이션 표현시사용
		//System.out.println("나는 "개발자"가 되고싶어요.");
		System.out.println("나는 \"개발자\"가 되고싶어요.");

		
		int kor = 81, eng =97, math=79;
		
		System.out.printf("국어:%d, 영어:%d, 수학:%d %n", kor, eng, math);
		System.out.println("\n국어:"+kor+"영어:"+eng+"수학:"+math);
		
		//정렬하여 지정하기 (+ 우측정렬 / -좌측정렬)
		//%n : 줄바꿈,  %f : 실수
		double avg= (kor+eng+math) / 3.0; //정수와 실수의 연산 :실수
		System.out.printf("평균점수:%f %n", avg);
		
		System.out.printf("국어:%d, 영어:%d, 수학:%d, 평균:%f %n"
				,  kor, eng, math, avg);
		System.out.printf("국어:%6d, 영어:%6d, 수학:%6d, 평균:%7.2f %n"
				,  kor, eng, math, avg);
		System.out.printf("국어:%-6d, 영어:%-6d, 수학:%-6d, 평균:%-7.2f %n"
				,  kor, eng, math, avg);
		

	}

}
