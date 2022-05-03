package ex10accessmodifier;

import ex10accessmodifier.cal.Calculator;
/*
외부에서 접근이 가능한 프로그램을 대표할 클래스를public로 선언하고
내부에서 기능을 담당하는 클래스는 주로 default(생략함)로 선언
*/
public class E04CalculatorMain {

	public static void main(String[] args) {
		
		Calculator cal = new Calculator();
		
		System.out.println("10+20="+ cal.addTwoNumber(10, 20));
		System.out.println("55+98="+ cal.addTwoNumber(55, 98));
		System.out.println("100-77="+ cal.subTwoNumber(100, 77));
		
		cal.showOpratingTimes();
	}
}

