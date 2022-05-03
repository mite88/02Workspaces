package ex19thread;

/*
일반적인 클래스
하나의 클래스가 작업을 완료해야 다음 클래스의 작업 진행가능
(동시x)
*/
class NormalClass{
	String title;
	public NormalClass(String title) {
		this.title = title;
	}
	
	void classMethod() {
		for (int i = 1; i <= 10; i++) {
			System.out.printf("%s]i=%d%n", title, i);
		}
	}
}

/*
독립쓰레드(Non Daemon Thread)

메인쓰레드와 Working쓰레드(개발자가 정의한 쓰레드)
메인쓰레드 종료에도 계속 실행되고, dead상태가 되야 종료됨
*/
class NormalThread extends Thread{
	//기본생성자로 객체 생성시 JVM에서 쓰레드명 자동 부여
	public NormalThread() {} 
	
	/*
	Thread클래스의 생성자 호출시 전달하는 매개변수를 통해
	해당 이름 지정, 반환은 getName()
	*/
	public NormalThread(String title) {
		super(title);
	}
	
	/*
	쓰레드 동작중 비정상적 종료시 InterruptedException이 발생할 수 있음
	여기선 예외처리하지않고 무시함
	*/
	void threadMethod() throws InterruptedException{
		//10번반복중 2초간 block상태라 20초간 반복 
		//반복횟수 및 쓰레드명 출력
		for (int i = 1; i <= 10; i++) {
			System.out.printf("%s]i=%d%n", getName(), i);
			sleep(2000);
		}
	}
	
	@Override
	public void run() {
		try {
			threadMethod();
		} catch (Exception e) {}
	}
}

/*
데몬쓰레드(Daemon Thread)

모든독립쓰레드가 종료시 자동으로 종료되는 쓰레드

메인 메서드도 하나의 독립쓰레드라서
다른 독립쓰레드가 남아있으면 종료될때까지 프로그램이 종료된것이 아님

주로 프로그램의 보조역할로 배경음악재생, 로그자동저장 등의 업무 처리

주로 무한루프구성
*/
class DaemonThread extends Thread{
	@Override
	public void run() {
		
		//무한루프로 구성 , 별도의 탈출조건을 만들지 않아도 됨
		while(true) {
			System.out.printf("[쓰레드명:%s]Jazz가 흘러요~%n", getName());
			
			try {
				sleep(3000);
				System.out.println("3초마다 자동저장!!");
			} catch (InterruptedException e) {
				System.out.println("자동저장시 오류 발생 ㅜㅜ");
			}
		}
	}
}

public class Ex03DaemonThread {

	public static void main(String[] args) {
		/*
		일반적인 클래스의 작업(순차적 작업)
		*/
		NormalClass nt1 = new NormalClass("첫번째 클래스");
		nt1.classMethod();
		new NormalClass("두번째 클래스").classMethod();
		
		
		//독립쓰레드의 작업
		
		//쓰레드명 부여방법 - 생성자
		NormalThread yt1 = new NormalThread("1st 쓰레드");
		//쓰레드명 부여방법 - setName()메서드
		//yt1.setName("First 쓰레드");
		yt1.start();
		
		NormalThread yt2 = new NormalThread(); //JVM이 자동으로 쓰레드명 부여
		yt2.setPriority(Thread.MAX_PRIORITY); //우선순위 10
		yt2.start();
		
		/*
		데몬쓰레드의작업
		*/
		DaemonThread dt = new DaemonThread(); //독립쓰레드 생성
		dt.setName("데몬쓰레드");
		dt.setDaemon(true); //데몬쓰레드로 만들기
		dt.start();
		
		System.out.println("현재 활성화 된 상태의 쓰레드수 : "
		+Thread.activeCount());
		System.out.println("현재 실행중인 쓰레드명 : "
		+Thread.currentThread().getName());
		System.out.println("메인함수의 우선순위:"
		+Thread.currentThread().getPriority());
		System.out.println("메인함수(Main Thread)종료");
	}

}
