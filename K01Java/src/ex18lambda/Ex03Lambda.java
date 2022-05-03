package ex18lambda;

interface IKomsmo3{
	void studyLambda(String str);
}


/*
람다식으로 구현
: 객체 지향 프로그램에서는 메서드를 선언시 반드시 클래스를 정의해야하는데
이러한 불편함때문에 최근 함수형 프로그래밍(Functional Pragramming)
의 장점이 대두되었고,이런 java문법의 단점을 보완하기위해 
JDK1.8버전부터 람다식을 지원하게됨
 */
public class Ex03Lambda {

	public static void main(String[] args) {
		/*
		1. 함수명 제거(부모로 부터 오버라이딩해서 동일한건 아니까...)
		2. 람다식을 표현(소괄호(부모) 중괄호(자식)사이 ->(참조) )
		*/
		IKomsmo3 kosmo1 = (String str) -> {
			System.out.println(str+"을 드디어써보네요.");
		};
		kosmo1.studyLambda("람다식");
		
		IKomsmo3 kosmo2 = str -> System.out.println(str+"완전 간단...!!");
		kosmo2.studyLambda("람다식");
		
	}

}
