package ex03operator;

public class E02BokhapOperator {

	public static void main(String[] args) {
		
		/*
		 복합대입연산사
		 산술연산자와 대입연산자를 연결해놓은 형태
		 좌측의 값을 연산하여 좌측의 변수에 대입
		 문법구조상 항상 현재의 타입을 유지하려는 특성이있음
		 */
		double e =3.1;
		e += 2.1; //5.2
		e *= 2; //10.4
		e += e; //e+e=e 20.4
		
		System.out.println("e의 결과값 : "+e);
		
		int n=5;
		//n= n * 2.7; //정수 * 실수 = 실수
		n= (int)(n * 2.7);// 강제 형변환 5*2.7 = 13.5인데int형으로 형변환해서 5
		//대입연산자로 하면 에러는 안나지만 n이 int형이기 때문에 정수형이 된다
		n *=2.7; //13*2.7 =35.1인데 int형이라 35
		System.out.println("n의 결과값 : "+n);
		
	}
}
