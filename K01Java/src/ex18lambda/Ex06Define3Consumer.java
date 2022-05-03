package ex18lambda;

import java.util.function.*;

public class Ex06Define3Consumer {
	public static void main(String[] args) {
		 
		//String타입의 매개변수를 출력만 하는 기능의람다식
		Consumer<String> c1 = (String s) -> {
			System.out.println(s +" 는(은) 가수입니다.");
		};
		c1.accept("케이윌");
				
		//매개변수 타입생략
		Consumer<String> c2 = t -> {
			System.out.println(t +" 는(은) 과일입니다.");
		};
		c2.accept("Strawberry");	
	}

}
