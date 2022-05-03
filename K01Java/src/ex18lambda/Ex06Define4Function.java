package ex18lambda;

import java.util.*;
import java.util.function.*;

public class Ex06Define4Function {
	public static void main(String[] args) {


		//매개변수는 String, 반환값은 Integer인 람다식 정의, 문자열길이 반환
		Function<String, Integer> func = (String s) -> {
			return s.length();
		};
		
		System.out.println("Lambda 문자열길이="+ func.apply("Lambda"));
		System.out.println("LambdaExpression 문자열길이="
		+ func.apply("LambdaExpression"));
		
		System.out.println("================================");
		
		//Human객체 생성 후 List<E>컬렉션으로 반환
		Human p1 = new Human("케이윌", "남", 80);
		Human p2 = new Human("에일리", "여", 77);
		Human p3 = new Human("임재범", "남", 97);
		Human p4 = new Human("아이유", "여", 99);
		List<Human> list = Arrays.asList(p1, p2, p3, p4);
		
		//Human객체를 인수로 받아, 점수(score) 반환하는 람다식
		Function<Human, Integer> getFunction = (Human h) -> {
			return h.getScore(); 
		};
		int score = getFunction.apply(p1);
		System.out.println("p1의점수:"+ score);
		
		//foreach문으로 컬렉션 전체반복 및 출력
		System.out.println("### list에 저장된 객체의 점수 출력");
		for(Human h : list) {
			System.out.println(h.getName() + " 의 점수 : "+ getFunction.apply(h));
		}		
	}

}
