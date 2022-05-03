package ex05method;

public class E02MethodType01 {
	/*
	Method
	객체지향 프로그램에서 행동 또는 동작을 의미
	어떤 하나의 업무를 처리하는 모듈(부속품)
	
	규칙
	- 메서드는 반드시 class안에 정의
	- 메서드안에 또다른 메서드 정의 x
	- 반환타입이 없으면 void
	- 이름의 규칙은 변수명과 동일(ex. addCalculate())
	
	<이름의 규칙>
	
	   구분           예시       규칙
	---------------------------------------------------------------------------
	변수/메서드    simpleFune    첫번째첫글자만 소문자 이후 단어첫글자는 대문자(Camel Case)
	클래스         SimpleFunc    첫글자대문자(Upper Case)
	패키지         simple.func   중간에 .(닷) 첫글자 전부 소문자
	상수           SIMPLE_FUNC	 중간에 _(언더바) 전부 대문자
	*/

	
	/*
	 * 형태1] 매개변수X 반환값X
	 */

	static void noParamNoReturn() {
		System.out.println("==메뉴를 선택하세욤==");
		System.out.println("1.열기, 2.계속하기, 3.종료");
		System.out.println("=====================");
	}

	/*
	필요에 따라 실행부가 없는 메서드를 정의하는 경우가 있음
	(추상클래스에서 설명할 예정)
	*/
	static void noParamNoReturn2() {

	}

	//메서드 오버로딩 - 같은 메서드명이라도 매개변수가 다르면 가능함
	static void noParamNoReturn2(int a) {

	}

	static void noParamNoReturn3() {
		int returnValue = 89;
		System.out.println("[return문 이전]");
		
		//다음줄 return; 아래는 실행안되고 함수종료,단 마지막라인에 있다면 조건문이 없어도 됨
		// return;

		if (returnValue % 2 == 0) {
			System.out.println(returnValue + "는 짝수");
			return; //조건문과함께 작성 - 특정조건때 끝내도록 설정함
		}
		System.out.println(returnValue + "는 홀수");
		System.out.println("[return문 이후]");

	}

	public static void main(String[] args) {
		//메서드호출
		noParamNoReturn();
		noParamNoReturn2();
		noParamNoReturn3();
	}

}
