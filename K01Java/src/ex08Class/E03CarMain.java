package ex08Class;
//자동차를 추상화한 클래스
class Car{
	
	//멤버상수
	public static final String AUTO="자동";
	public static final String MANUAL="수동";
	
	//멤버변수
	String carGear = AUTO;//미션
	String carModel;//모델명
	int carYear;//연식
	Human owner;//소유주
	
	//멤버메서드
	void drive() {
		/*
		owner는 객체라서 이름 출력시 "참조변수.name"이런식으로 적어야함
		*/
		System.out.println(owner.name+"이(가)"+carModel+"을 운전한다.");
	}
	
	/*
	초기화 메서드1
	매개변수 없는 형태 항상고정된 값으로만 객체르 초기화 할수있음
	 */
	void initialize() {
		carModel="람보르기니";
		carYear=2017;
		owner = new Human();
		owner.name="캡틴로져스";
		owner.age=30;
		owner.energy =10;
	}
	
	//오버로딩
	/*
	초기화진행 역활은 같지만매개변수를 통해 다양한 형태의 객체로 초기화가능
	*/
	void initialize(String model, int year, String name, int age, int energy) {
		carModel = model;
		carYear=year;
		/*
		또 다른 객체가 멤버변수를 정의되어있어서 
		객체를 생성 후 각각의 멤버변수를 초기화해야함
		*/
		owner = new Human();
		owner.name=name;
		owner.age=age;
		owner.energy =energy;
	}
	
	void showCarInfo() {
		System.out.println("[차량정보]");
		System.out.printf("모델명:%s%n",carModel);
		System.out.printf("연식:%d%n",carYear);
		System.out.printf("기어:%s%n", carGear);
		
		//소유주를 표현하는 owner 객체의 showState()을 호출함
		owner.showState();
	}
	
}
public class E03CarMain {

	public static void main(String[] args) {
		//자동차1 객체 생성
		Car car1= new Car();
		//아직까지 Human타입의 owner객체는 메모리에 생성되지 x
		System.out.println("초기화 메서드 호출전");
		//System.out.println("car1.owner="+car1.owner);//car1.owner=null
		//car1.drive(); //예외발생 : Human객체 생성없이 출력을 시도하여 런타임에러남
		
		System.out.println("초기화 메서드 호출후");
		//초기화 메서드호출로 Human()객체가 생성 및 초기화
		car1.initialize();
		
		/*
		해당 초기화 메서드는 항상 고정된 값만 초기화 되기에
		확장성이 없음(실무에선 이와같이 정의하지x)
		*/
		car1.drive();//정상
		car1.showCarInfo();//정상
		
		//자동차2 객체 생성
		/*
		객체 생성 후 멥버변수에 직접 접근하여 초기화
		
		2개이상의 객체생성시 초기화코드 중복사용해야하므로
		코드 낭비가 많음(실무에선 이와같이 정의하지x)
		*/
		Car car2 = new Car();
		car2.carGear=Car.MANUAL;
		car2.carModel="밴틀리";
		car2.carYear=2018;
		
		car2.owner =new Human();
		car2.owner.name="토니스타크";
		car2.owner.age=52;
		car2.owner.energy=8;
		
		System.out.println("");
		car2.showCarInfo();

		System.out.println("자동차정보와 소유자정보 같이보기");
		car2.showCarInfo();
		
		//세번째 자동차객체 생성
		/*
		매개변수가 있는 초기화 메서드를 사용하여 객체초기화
		이 경우 매개변수를 통해 다양한 값을 전달 할 수있으므로
		여러형태의 객체 생성 가능
		중복코드를줄일 수 있어 효율적임
		*/
		Car car3 = new Car();
		car3.initialize("스포츠카", 2012, "성유겸", 8, 10);
		car3.showCarInfo();
	}

}
