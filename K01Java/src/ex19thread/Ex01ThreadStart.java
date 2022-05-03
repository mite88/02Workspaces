package ex19thread;

/*
- 쓰레드 생성은 Threan클래스를 상속하는 것 부터 시작
- 현 방법은 쓰래드로 생성할 클래스가 다른 클래스를 상속할 필요가 없을때 사용함
*/
class ShowThread extends Thread{
	
	String threadName;
	
	public ShowThread(String name) {
		this.threadName = name;
	}
	
	//run()메서드 : Thread클래스의 오버라이딩한 것 으로 간접호출을 해야함
	@Override
	public void run() {
		for (int i = 1; i <= 100 ; i++) {
			System.out.println("안녕하세요.["+threadName+"]입니다.");
			/*
			Thread클래스의 static메서드로 실행의 흐름을 주어진 시간만큼
			block상태로 전환
			(1000분의 1)
			*/
			try {
				sleep(10); //0.01초만큼 block
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
}

public class Ex01ThreadStart {

	public static void main(String[] args) {
		
		//Thread 객체 생성
		ShowThread st1 = new ShowThread("쓰레드1st"); 
		ShowThread st2 = new ShowThread("Thead2nd"); 
		
		/*
		실행
		*/
		st1.start();
		st2.start();
		
		/*
		main메서드안에서 run()메서드를 직접 호출하게되면 
		실행은 되지만 쓰레드가 생기기 않으며, 
		기본 메서드처럼 작동하기에 st1.run()먼저 다하고 st2.run()가 실행된다.
		*/
		//st1.run();
		//st2.run();
	}

}
