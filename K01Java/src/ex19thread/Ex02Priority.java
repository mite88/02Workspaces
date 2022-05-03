package ex19thread;

/*
우선순위
setPriority(우선순위) : 우선순위지정
getPriority() : 우선순위 반환
*/
class MessageSendingThread extends Thread{
	String message;

	//이름저장
	public MessageSendingThread(String message) {
		this.message = message;
	}
	
	//이름저장+우선순위
	public MessageSendingThread(String message, int pri) {
		this.message = message;
		setPriority(pri);
	}
	
	@Override
	public void run() {
		//쓰레드100번 반복출력(우선순위)
		for (int i = 1; i <= 1000 ; i++) {
			System.out.println("message"+i+"("+getPriority()+"");
			
			/*
			sleep메서드를 사용하면 실행중 잠깐씩 블럭상태로 전환되어 
			우선순위가 낮은쓰레드도 실행될 수 있는 기회가 생김
			*/
			try {
				sleep(1);
			} catch (InterruptedException e) {
				System.out.println(e.getMessage());
			}
		}
	}
}

public class Ex02Priority {

	public static void main(String[] args) {
		//우선순위가 부여되지 않은상태에서 우선순위는 5(알아서 분배함)
		//상수대신 정수로 적어도 됨
		MessageSendingThread tr1= new MessageSendingThread("첫번째", Thread.MAX_PRIORITY); //우선순위 : 10
		MessageSendingThread tr2= new MessageSendingThread("두번째", Thread.NORM_PRIORITY); //우선순위 : 5
		MessageSendingThread tr3= new MessageSendingThread("세번째", Thread.MIN_PRIORITY); //우선순위 : 1
		
		tr1.start();
		tr2.start();
		tr3.start();
	}

}
