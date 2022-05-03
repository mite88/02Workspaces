package ex08Class;

public class PersonConstructor {

	/*
	생성자(Constructor)
	클래스를 인스턴스화할때 자동으로 호출되는 메서드
	자동으로 호출되며 개발자가 임의로 호출할 수 x
	반환값이 없음
	그외에는 메서드의 특성을 가지고 있음(인수전달, 오버로딩 등)
	*/
	
	String name;
	int age;
	String addr;
	
	/*
	클래스에선 반드시 하나이상의 생성자가 존재함(디폴트생성자)
	
	디폴트생성자:개발자가 생성자를 만들지 않으면 컴파일러에 의해 코드가 삽입됨
	(*생성자를 만들면 디폴트 생성자는 삽입되지 않음)
	*/
	//public PersonConstructor() {} 

	//기본생성자
	public PersonConstructor() {
		name = "이름없음";
		age = 1;
		addr = "미상";
		System.out.println("나는 생성자 1입니다"); //디버그용
	}
	
	//인자생성자
	public PersonConstructor(String name ) {
		 //여기서 this는 멤버변수를 매개변수로 초기화함을 의미
		this.name = name;
		this.age = 1;
		this.addr = "출처불명";
	}
	
	public PersonConstructor(String name, int age ) {
		//여기서 this는 오버로딩한 생성자 중 해당하는 생성자를 가르킴
		//매개변수가 3개인 생성자 호출
		this(name,age,"미상"); 
		System.out.println("나는 인자자생성자[2] 입니다.");
	}

	public PersonConstructor(String _name, int age, String addr) {
		name = _name; 
		this.age = age; //this넣은 이방법을 많이쓴다
		this.addr = addr;
		System.out.println("나는 인자자생성자[3] 입니다.");
	}
	
	//초기화용 멤버메서드 : 사실 생성자를 생성해서 사용할 필요는없음
	void initialize(String name, int age, String addr) {
		/*
		Constructor call must be the first statement in a constructor
		생성자는 호출시 한번밖에 사용이 안된다
		
		그런데 함수에 적게되면 해당 맴버메서드를 실행할때마다 
		호출한다는 것이므로 에러가 발생한다
		
		생성자 안에서는 사용이 가능하다
		*/
		//this(name,age,"미상");
		
		//this의 경우는 상관없이 사용가능하다.
		this.name = name; 
		this.age = age;
		this.addr = addr;
	}
	
	void showPersonInfo() {
		System.out.printf("%s 님의 정보 \n", this.name);
		System.out.printf("나이:  %d\n", age);
		System.out.printf("주소 : %s\n", addr);
	}

}
