package ex12inheritance;
/*
Is-a(X는 Y의 일종이다)
상속으로 표현하기 적합
*/

//컴퓨터 : 기본적인 컴퓨터 환경 제공하여 내용계산
class Computer{
	String owner;

	//디폴트생성자
	//public Computer() {} 
	//생성자
	public Computer(String name) {
	owner = name;
	}
	
	/*
	private 접근지정자로 선언된 멤버메서드는 
	외부클래스 나 상속받은 클래스에서 접근불가능
	
	public로 선언된 메서드를 통해 간접 호출
	상속관계서 protected로도 호출
	*/
	private void keyboardTouch() {
	System.out.println("키보드를 통해서 입력한 ");
	}
	private void calculate() {
	System.out.println("요청된 내용을 계산한다");
	}
	
	public void calculateFunc() {
	keyboardTouch(); 
	calculate();
	}

}

//컴퓨터를 상속한 노트북클래스 : 연산기능+휴대성(배터리 멤버변수추가)
class NotebookComputer extends Computer {

	int battary;
	
	//생성자
	public NotebookComputer(String name, int initCharge) {
		super(name); //super은 부모부터생성되어야하므로 순서를 지켜야함
		battary = initCharge;
	}
	
	//배터리충전
	public void charging() {
		battary += 5;
	}
	
	//휴대하면서 컴퓨터하는거
	public void movigCal() { 
		if(battary < 1) {
			System.out.println("배터리가 방전되어 사용불가");
		return;
		}
		System.out.println("이동하면서 ");
		
		//private 멤버메서드라서 안됨
		//keyboardTouch();
		//calculate();
		calculateFunc();
		
		battary -= 1;//배터리차감
	}	

}
//태블릿 노트북 : 컴퓨터연산+휴대가능+펜으로 드로잉
class TableNotebook extends NotebookComputer{
	//태블릿을 사용하기 위한 펜슬을 표현한 멤버변수
	String registPencil;
	
	//생성자
	public TableNotebook(String name, int initCharge, String pen) {
		super(name, initCharge);
		registPencil = pen;
	}
	
	//태블릿 사용을 위해 베터리량 체크 및 등록된 펜인지 확인하는 멤버메서드
	public void write(String penInfo) {
		
		if(battary<1) {
			System.out.println("배터리가 방전되어 사용불가");
			return;
		}
		
		//A.compareTo(B):String클래스에 정의된 메서드,문자열비교(true는 0)
		if(registPencil.compareTo(penInfo) != 0) {
			System.out.println("등록된 펜이 아닙니다");
			return;
		}
		//부모클래스에 정의된 메서드 호출
		movigCal();
		System.out.println("스크린에 펜으로 그림을 그린다");
		battary -=1;
	}
	
}

public class E04ISAInheritance {

	public static void main(String[] args) {
		//객체 생성
		NotebookComputer noteBook = new NotebookComputer("공유", 5);
		TableNotebook tablet = new TableNotebook("이동욱", 5, "ISE-1234");
		
		System.out.println("==노트북컴퓨터사용==");
		noteBook.movigCal();
		noteBook.movigCal();
		noteBook.movigCal();
		noteBook.movigCal();
		noteBook.movigCal();
		noteBook.movigCal();
		noteBook.movigCal();
		noteBook.movigCal();
		
		
		
		System.out.println("==ISE-1234 펜으로 테블릿사용==");
		tablet.write("ISE-1234");
		System.out.println("==XYZ-9876 펜으로 테블릿사용==");
		tablet.write("XYZ-9876");
	}

}
