package ex18lambda;

interface IKomsmo2{
	void studyLambda(String str);
}

public class Ex02AnonymousClass {

	public static void main(String[] args) {
		//익명클래스 
		/*
		extends 혹은 implements 키워드는 없지만 중괄호 영역은 자식
		*/
		IKomsmo2 kosmo = new IKomsmo2() {
			//상속의 절차를 익명클래스로 대체하여서 좀더 간결해짐
			@Override
			public void studyLambda(String str) {
				System.out.println(str+"을 공부하기 위해 익명클래스를 만들어요.");
			}
		};
		kosmo.studyLambda("람다식");
	}

}
