package ex19thread;

//쓰레드2개 공용으로 사용할 클래스
class SumMulti{
	
	int num;
	
	public SumMulti() {
		num =0; 
	}
	
	//메서드 호출시 전달되는 매개변수 값 누적해서 멤버변수에 더함
	public void addNum(int n) {
		num += n;
	}
	
	//멤버변수반환
	public int getNum() {
		return num;
	}
}

class MultAdderThread extends Thread{
	//앞에서 정의한 공유객체를 멤버변수로 선언
	SumMulti sumInst;
	int start, end;
	
	//생성자
	public MultAdderThread(SumMulti sum, int s, int  e) {
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

public class Ex05Sync1Error {

	public static void main(String[] args) {
		//하나의 객체를 2개의 쓰레드가 공유
		SumMulti s = new SumMulti();
		MultAdderThread mat1 = new MultAdderThread(s, 1, 5000);
		MultAdderThread mat2 = new MultAdderThread(s, 5001, 10000);
		
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
