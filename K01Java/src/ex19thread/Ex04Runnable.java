package ex19thread;


class Sum{
	int num;
	
	public Sum() {
		num =0; 
	}
	
	//메서드 호출시 전달되는 매개변수 값 누적해서 멤버변수에 더함
	public void addNum(int n) {
		num += n;
	}
	
	public int getNum() {
		return num;
	}
}

/*
쓰레드 생성2
Runnable인터페이스를 이용하여 쓰레드 클래스를 정의
*/
class AdderThread extends Sum implements Runnable{

	int start, end;
	
	public AdderThread(int s, int  e) {
		start = s;
		end = e;
	}

	//start~end 하면서 부모클래스 addNum()을 호출해 누적합 구함
	@Override
	public void run() {
		for (int i = start; i <= end; i++) {
			System.out.println("i="+i);
			addNum(i);
		}
	}

	
}

public class Ex04Runnable {

	public static void main(String[] args) {

		/*
		Runnable 인터페이스를 구현한 클래스의 인스턴스를 대상으로
		쓰레드 생성
		- 결국 Thread클래스를 통해 쓰레드를 생성하게 됨
		*/
		AdderThread at1 = new AdderThread(1, 500);
		AdderThread at2 = new AdderThread(501, 1000);
		
		Thread thread1 = new Thread(at1);
		Thread thread2 = new Thread(at2);
		
		thread1.start();
		thread2.start();
		
		try {
			/*
			생성된 쓰레드가 하나의 작업을 완료하기를 기다리는
			기능 수행
		
			*/
			thread1.join();
			thread2.join();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("1~1000까지의 합:"+(at1.getNum()+at2.getNum()));
	}

}
