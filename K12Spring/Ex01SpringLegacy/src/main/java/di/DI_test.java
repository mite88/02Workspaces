
/**
 * <pre>
 * 1. 클래스명 : DI_test.java
 * 2. 작성일 : 2022. 7. 12.
 * 3. 작성자 : mite88
 * 4. 설명 : 의존성테스트(결합도 및 독립성)
 * </pre>
 */

package di;

class Persons{
	String name;
	int age;
	
	/*
	 * public Persons() {
		System.out.println("public 생성자");
	}
	*/
	
	private Persons() {
		System.out.println("private 생성자");
	}
}


public class DI_test {
	/*
	public static void aPerson() {
		//결합도가 높은 코드 : private으로 바꾸는 순간 문제가 생김
		Persons p1= new Persons();
		p1.age=11;
		p1.name="성유겸";
	}
	*/
	
	//결합도가 낮은 코드 : 미리 생성된 객체를 주입받아 사용, private으로 써도 접근가능
	public static void nPerson(Persons p2) {
		p2.age=11;
		p2.name="성유겸";
	}

}
