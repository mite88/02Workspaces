package ex18lambda;
/*
함수형 인터페이스
- 람다식을 표현하기위해 먼저 인터페이스 생성 및 
람다식을 표현할 추상메서드를 선언

- 하나만 선언가능

@FunctionalInterface
- 함수형 인터페이스 조건검사를 하여 컴파일러에게 요청
*/
@FunctionalInterface
interface IKosmo4{
	void studyLambda(String str);
}


public class Ex04FunctionalInterface {

	/*
	정의한 람다식의 참조변수가 IKosmo4이므로 
	매개변수로 전달후 추상메서드인 studyLambda()을 통해 호출
	*/
	static void execute(IKosmo4 ko, String s) {
		/*
		main에서 선언한 람다식의 참조값을 받은 매개변수 : ko
		IKosmo4 인터페이스에정의된 추상메서드 : studyLambda(String str)
		*/
		ko.studyLambda(s);
	}
	public static void main(String[] args) {
		//IKosmo4 인터페이스를 이용하여 람다식생성
		IKosmo4 kosmo = str -> 
			System.out.println("IKosmo4를 구현받아 정의한 람다입니다."+str);
			
		//앞에서 정의한 람다식을 메서드 인수로 전달
		//* 참조값만 전달됨
		execute(kosmo, "\n람다를 매개변수로전달합니다.");
	}
}
