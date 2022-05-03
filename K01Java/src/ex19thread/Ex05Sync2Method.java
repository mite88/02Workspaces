package ex19thread;

//쓰레드2개 공용으로 사용할 클래스
class SumMulti2{
	
	int num;
	
	public SumMulti2() {
		num =0; 
	}
	
	/*
	동기화방법 1 : 동기화메서드(메서드전체 동기화)
	
	synchronized 선언으로 정확한 결과가 나오지만
	실행기간이 길어진다
	
	그래서 필요한 부분에 대해서마 동기화를 하는것이 좋다
	 */
	/*
	synchronized public void addNum(int n) {
		num += n;
	}
	*/
	
	/*
	동기화방법 2 : 동기화블럭(필요한 코드만 동기화)
	
	조금 더 좋은 성능 기대
	 */
	public void addNum(int n) {
		synchronized(this) {
			num += n;
		}
	}
	
	//멤버변수반환
	public int getNum() {
		return num;
	}
}

class MultAdderThread2 extends Thread{
	//앞에서 정의한 공유객체를 멤버변수로 선언
	SumMulti2 sumInst;
	int start, end;
	
	//생성자
	public MultAdderThread2(SumMulti2 sum, int s, int  e) {
		sumInst = sum;
		start = s;
		end = e;
	}

	//start~end 하면서 부모클래스 addNum()을 호출해 누적합 구함
	/*
	쓰레드를 통해 반복적으로 공유객체인 sumInst의 addNum()호출
	이경우 동기화 처리가 없어서 동시에 접근이 어려우므로 이상한결과가 나옴
	 */
	@Override
	public void run() {
		for (int i = start; i <= end; i++) {
			sumInst.addNum(i);
		}
	}
}

public class Ex05Sync2Method {

	public static void main(String[] args) {
		//하나의 객체를 2개의 쓰레드가 공유
		SumMulti2 s = new SumMulti2();
		MultAdderThread2 mat1 = new MultAdderThread2(s, 1, 5000);
		MultAdderThread2 mat2 = new MultAdderThread2(s, 5001, 10000);
		
		mat1.start();
		mat2.start();
		
		try {
			mat1.join();
			mat2.join();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("1~10000까지의 합:"+s.getNum());
	}

}
