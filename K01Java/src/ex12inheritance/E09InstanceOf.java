package ex12inheritance;

class Box{
	public void boxWrap() {
		System.out.println("Box로 포장합니다");
	}
}

class PaperBox extends Box{
	public void paperWrap() {
		System.out.println("PaperBox로 포장합니다");
	}
}

class GoldPaperBox extends PaperBox{
	public void goldWrap() {
		System.out.println("GoldPaperBox로 포장합니다");
	}
}


public class E09InstanceOf {
	

	/*
	부모타입의 매개변수로 자식의 매개변수를 받지 못하는경우
	각 타입에 따른 메서드를 모두 정의해야한다
	따라서 부모가 자식을 참조하는것이 편리하다
	*/
	static void weapBox(Box b) {};
	static void PaperBox(Box b) {};
	static void GoldPaperBox(Box b) {};
	/*
	instanceof연산자를 통해 형변환 가능 여부를 판단하는이유는
	전달된 매개변수를 최상위 클래스인Box타입으로 받고 있어서이다
	
	Box타입으로 인수를 받으면 자도영으로 형변환(업캐스팅)이 되어 
	자식클래스의 맴버메소드로르호출할 수 없다 
	
	이때 자식의 멤버메서드를 호출 시강제형변환(다운캐스팅)이 필요함
	
	전달된 인수의 각 타입으로 형변환이 가능한지 판단후
	다운캐스팅을 진행 그리고 각클래스의 멤버메서드를 호출
	*/
	static void wrapBox(Box b) {
		if(b instanceof GoldPaperBox) {
			((GoldPaperBox) b).goldWrap();
		}else if(b instanceof PaperBox) {
			((PaperBox) b).paperWrap();
		}else if(b instanceof Box) {
			b.boxWrap();
		}
	}
	
	public static void main(String[] args) {
		Box box1 = new Box();
		PaperBox box2 = new PaperBox();
		GoldPaperBox box3 = new GoldPaperBox();
		
		//각 타입의 인수를 부모타입은 Box로받을수 있음 ->상속관계
		wrapBox(box1);
		wrapBox(box2);
		wrapBox(box3);
		
		//객체와의 상속관계 x
		String str = new String("나는누구?");
		//wrapBox(str);
	}

}
