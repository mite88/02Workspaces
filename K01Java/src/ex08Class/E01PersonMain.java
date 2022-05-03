package ex08Class;

/*
추상화(abstraction)

현실세계의 사물을 클래스로 형상화 하는것
(여기서 Person는 "사람"의 일반적인 사항을 클래스로 추상화 하고있음)
*/
//클래스 선언 : 첫글자는 대문자
class Person{
	/*
	멤버 변수 : 속성(데이터)
	*/
	String name="정우성";
	int age = 47;
	String gender ="남자";
	String job ="배우";
	
	/*
	맴버 메서드: 객체의 동작 및 행의 표현
	
	클래스 외부에서 호출시 객체의 참조변수를 통해 호출하며 
	멤버메서드 내에서 즉시 사용 가능
	*/
	void eat() {
		/*
		클래스에서 생성된 맴버변수는 맴버메서드에서 사용가능함
		*/
		System.out.printf("%s가(이) 식사를 한다 %n",name);
	}
	
	void sleep() {
		System.out.printf("나이가 %d인 %s가(이) 잠자고 있다 %n",age,name);
	}
}

/*
public 클래스는 하나만 사용 가능하며 자바파일명과 public 클래스명은 같아야함
 */
public class E01PersonMain {

	public static void main(String[] args) {
		
		/*
	    Person클래스를 통해 인스턴스 생성하며,할당된 주소값을반환 
		좌측항의 참조변수가그값을 할당받음
		*/
		Person person = new Person();
		
		//객체의 참조변수를 이용해 멤버메서드 호출함
		person.eat();
		person.sleep();
	}

}
