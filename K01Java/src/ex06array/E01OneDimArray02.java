package ex06array;

import java.util.Iterator;
import java.util.Random;

public class E01OneDimArray02 {

	/*
	난수만들기
	*/
	public static void main(String[] args) {
		//난수 생성방법1
		double rndNumber = Math.random();
		System.out.println("생성된난수[실수]"+rndNumber);
		
		//정수형은 100을곱하면 됨
		int intNumber= (int)(Math.random()* 100);
		System.out.println("생성된난수[정수]"+intNumber);
		
		//난수 생성방법2
		/*
		Random 클래스 이용
		nextInt()메서드를 사용하여 정수형 난수 생성가능
		 */
		Random random = new Random();
		System.out.println("생성된 난수:"+random.nextInt());
		System.out.println("==================================");
		
		System.out.println("1~45사이의 난수 생성"+
		((int)((Math.random()*100) % 45)+1));
		
		System.out.println("==================================");
		
		System.out.println("크기가 6인 배열에 난수 입력");
		int[] lottoNum = new int[6];

		
		for (int i = 0; i < lottoNum.length; i++) {
			lottoNum[i] = ((int)((Math.random()*100) % 45)+1);
		}
		for (int i = 0; i < lottoNum.length; i++) {
			System.out.printf("%d ", lottoNum[i]);
		}

		
	}

}
