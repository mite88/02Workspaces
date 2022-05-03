package ex16exception;

public class Ex02PreDefineException6 {
	 
	public static void main(String[] args)  {	
  
		Object object = new Object();
		try {
			/*
			Object 클래스를 단독 생성한 경우
			다른 클래스와의 상속관계가 전혀 없는 상태라서
			형변환이 안되기때문에 예외가 발생
			*/
			String strObject = (String)object;
		}
		catch(ClassCastException e) {
			System.out.println("형변환 할 수 없습니다.");
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		System.out.println("==ClassCastException발생후==");
			
		System.out.println("끝~~~");
		
		String str = "형변환되나요?";
		boolean castFlag = myClassCasting(str);
		if(castFlag==true)
			System.out.println("됩니다요..");
		else
			System.out.println("안되네요..ㅜㅜ;");
				 
	}////end of main	
	
	/*
	 String객체가 인수로 전달되어 매개변수를 통해 
	 Object로 자동형변환되었으므로
	 여기선 상속관계가 확인된다
	 
	 매개변수 o는 현재 String타입이기 때문에
	 instanceof를 통해 String로 확인이 되며
	 이경우 다운캐스팅도 가능해짐
	 */
	public static boolean myClassCasting(Object o) {
		if(o instanceof String) {
			return true;
		}
		else {
			return false;
		}
	}
}

