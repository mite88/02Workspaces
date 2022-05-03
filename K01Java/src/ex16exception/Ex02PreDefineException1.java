package ex16exception;

public class Ex02PreDefineException1 {
	
	public static void main(String[] args) {
		System.out.println("### ArrayIndexOutOfBoundsException ###");
		int[] intArr = new int[2]; //크기가 2인 배열 선언
		
		/*
		예외가 발생할 수 있는 지역을 try문으로 먼저 묶음
		예외가발생하면 JVM(자바가상머신)은 해당 예외에 관련된 객체를 만들어
		프로그램쪽으로 전달
		이때  catch절에서 예외객체를 잡아주는것을 예외처리하고 한다
		
		만약 예외객체를 잡아주지 않으면 비정상적인 종료로 이어지게 됨
		*/
		try {
			intArr[0]= 100;
			System.out.println("0번방은:"+intArr[0]);
			intArr[1]= 200;
			System.out.println("0번방은:"+intArr[1]);
			
			//예외 발생 : 자바가상머신이 예외객체를 생성하여 throw함
			intArr[2]= 300;
			System.out.println("0번방은:"+intArr[2]);
			
		} catch (ArrayIndexOutOfBoundsException e) {
			//JVM이 throw한 예외객체를 catch절에서 처리 
			//이로써 해당 예외가 발생하더라도 실행은 유지됨
			
			//예외메세지1 : 임의로 출력
			System.out.println("예외가 발생했어요");
			
			//예외메세지2 : 간락설명
			System.out.println("예외메세지:"+e.getMessage());
			
			//예외메세지3 : 상세설명
			e.printStackTrace();
		}
		
		System.out.println("0번방 재출력:"+intArr[0]);
		System.out.println("### ArrayIndexOutOfBoundsException발생후 ###");
	}
}
