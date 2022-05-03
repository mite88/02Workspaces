package ex12inheritance;

//부모클래스
class Man{
	//private : 클래스 내부에서만 가능
	private String name;
	
	//생성자들(오버로딩)
	public Man() {
		System.out.println("Man클래스 디폴트생성자 호출됨");
	}
	
	public Man(String name) {
		this.name = name;
		System.out.println("Man클래스 인자생성자 호출됨");
	}
	
	//멤버메서드 정의
	public void tellYourName() {
		System.out.println("내이름은 "+name+"입니다.");
	}
}

//자식클래스(오버로딩)
class BusinessMan extends Man{
	//멤버변수로 회사명, 직급 선언
	private String company;
	private String position;
	
	//생성자들
	public BusinessMan(String name, String company, String position) {
		//super생성자가 없으면 디폴트생성자가 자동으로 생긴다 super();
		
		//super() : 부모클래스의 생성자 호출
		super(name); //13번줄 생성자가 호출됨
		this.company = company;
		this.position = position;
		System.out.println("BusinessMan 생성자 호출");
	}
	
	//멤버메서드 정의
	public void tellYourInfo(){
		System.out.println("회사명은 "+company+"입니다.");
		System.out.println("직급은 "+position+"입니다.");
		//System.out.println("이름은 "+name+"입니다."); //private로 선언되어 접근이 안됨
		tellYourName();//부모클래스의 멤버메서드 접근 public이니 가능
	}
}

public class E01BusinessManMain {

	public static void main(String[] args) {

		BusinessMan man1 = new BusinessMan("김천국", "NAVER", "팀장");
		BusinessMan man2 = new BusinessMan("이낙원", "DAUM", "부장");
		
		man1.tellYourInfo();
		man1.tellYourName();
		
		man2.tellYourInfo();
		man2.tellYourName();
	}

}
