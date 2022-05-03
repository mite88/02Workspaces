package ex18lambda;

import java.util.*;
import java.util.function.*;

public class Ex06Define2Supplier {

	public static void main(String[] args) {
	
		//0~99사이의 나수 생성 후 반환해주는 람다식 정의
		Supplier<Integer> sup = () -> {
			Random random = new Random();
			return random.nextInt(100);
		};		
		
		//추상메서드인 get() 호출
		int rNum = sup.get();  
		System.out.println("생성된난수="+ rNum);		
		
		//람다식(sup)을 통해 난수 10개 생성
		List<Integer> list = makeRandomNum(sup, 10);
		System.out.println("### print문으로 출력1");
		//값만 확인시에는 이런식으로도 출력이 가능함
		System.out.println(list);
				
		System.out.println("### foreach문으로 출력2");
		for(Integer i : list) {
			System.out.printf("%d ", i);
		}
		System.out.println();
				
		System.out.println("### 이터레이터로 출력3");
		Iterator<Integer> itr = list.iterator();
		while(itr.hasNext()) {
			System.out.print(itr.next() +" ");
		}
	}
	
	/*
	난수 생성하는 람다식과 정수를 인수로 받아 
	갯수만큼 난수 생성 후배열에 저장
	*/
	public static List<Integer> makeRandomNum(Supplier<Integer> s, 
			int cnt){		
		List<Integer> li = new ArrayList<Integer>();
		for(int i=1 ; i<=cnt ; i++) {
			
			li.add(s.get());
		}
		
		return li;
	}


}
