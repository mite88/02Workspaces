package ex15usefullclass;

import java.util.Random;

public class E07Random {

	public static void main(String[] args) {
		/*
		Random()클래스는 객체 생성시 Seed을 기반으로 난수 생성
		그래서 Seed가 동일하면 같은 패턴의 난수가 생성되는데 이를 
		가짜난수(Pseudo-random number)라고 한다.
		*/
		System.out.println("#가짜난수 : 같은 패턴의 난수만 생성됨#");
		Random random1 = new Random(32);
		for (int i = 0; i < 10; i++) {
			System.out.println(random1.nextInt(100)+" ");
		}
		
		//nextInt() : 0 ~ n-1 까지의 난수 생성
		System.out.println("#난수생성1 : 씨드없음#");
		Random random2 = new Random();
		for (int i = 0; i < 10; i++) {
			System.out.println(random2.nextInt(100)+" ");
		}
		
		/*
		Seed를 부여하려면 setSeed()메서드를 사용한다
		이때 현재 시간을 밀리세컨즈단위로 반환하는
		currentTimeMillis()를 사용하면 편리함
		*/
		System.out.println("#난수생성2 : 변화하는 시간으로 씨드지정#");
		Random random3 = new Random();
		random3.setSeed(System.currentTimeMillis());
		for (int i = 0; i < 10; i++) {
			System.out.println(random3.nextInt(100)+" ");
		}
		
		//nextInt()에 인수가 없으면 음수, 양수가 다나온다 
		System.out.println("#난수생성3 : nextInt() 인수없음#");
		Random random4 = new Random();
		for (int i = 0; i < 10; i++) {
			System.out.println(random4.nextInt()+" ");
		}
		
		
	}

}
