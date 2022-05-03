package ex18lambda;

import java.util.Arrays;
import java.util.List;
import java.util.function.Predicate;

/*
Java에서 제공하는 기본 함수형인터페이스의 종류
차이점은 매개변수 유무와 리턴값

Predicate<T> : 매개변수ㅇ, 리턴값 Boolean
Supplier<T> : 매개변수 x, 리턴값 ㅇ
Consumer<T> : 매개변수 ㅇ, 리턴값 x
Function<T, R> : 매개변수ㅇ, 리턴값 ㅇ
*/
public class Ex06Define1Predicate {
	public static void main(String[] args) {

		Human p1 = new Human("케이윌", "남", 80);
		Human p2 = new Human("에일리", "여", 77);
		Human p3 = new Human("임재범", "남", 97);
		Human p4 = new Human("아이유", "여", 99);
		
		/*
		인터페이스에 정의된 test() 추상메서드를 오버라이딩 하여
		아래와 같은 람다식 정의
		
		매개변수로 Human객체로 전달하고 남자인 경우 true
		*/ 
		Predicate<Human>pre = h -> {
			//getter()를 통해 멤버변수값 가져오고 판단
			return h.getGender().equals("남");
		};
		
		System.out.println("pre.test(p1):"+pre.test(p1));
		System.out.println("pre.test(p2):"+pre.test(p2));
		
		//인자로 주어진 객체를 List컬렉션으로 반환(값변경x, 참조만됨)
		List<Human> list1 = Arrays.asList(p1,p2,p3,p4);
		
		/*
		추상메서드를 통해 매개변수의 타입 유추가 가능하기에 String 생략
		
		h -> h.getGender().equals("남")
		
		이렇게도 생략이 되지만 가독성이 떨어져 아래와 같이 매개변수의
		타입이라도 적는게 좋음
		
		(Human b) -> b.getGender().equals("여")
		
		해당 람다식으로 조건을 판단하여 boolean값을 반환함
		*/
		
		
		double maleAvg = avg(h -> h.getGender().equals("남"), list1);
		System.out.println("남자 평균:"+maleAvg);
		
		double femaleAvg = avg((Human b) -> b.getGender().equals("여"), list1);
		System.out.println("여자 평균:"+femaleAvg);
	}
	
	//매개변수로 성별 판단하는 람다식, List컬렉션 전달
	public static double avg(Predicate<Human> ph, List<Human> li) {
		int pCount = 0;
		int tCount = 0;
		
		//컬렉션에 저장된 Human객체 만큼 반복함
		for (Human h : li) {
			//람다식을 통해Human객체의 성별 판단
			if(ph.test(h)) {
				pCount++; //조건에 맞으면 ++시킴
				tCount +=h.getScore();//점수합산
			}
		}
		
		//평균값 구함
		return (double) tCount / pCount;
	}
}
