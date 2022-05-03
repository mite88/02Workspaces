package ex20io;

import java.io.*;
/*
직렬화
Circle클래스를 입출력의 대상으로 파일로 저장하기 위해
Serializable 인터페이스를 구현하여 정의
이렇게 인스턴스가 파일의 형태로 저장되는걸 말하고
상속이 되는 경우라면 부모쪽에만 implements를 하면됨
*/
class Circle implements Serializable{
	int xPos, yPos; //원의 중심점인 좌표
	double radian; //반지름
	
	public Circle(int xPos, int yPos, double radian) {
		super();
		this.xPos = xPos;
		this.yPos = yPos;
		this.radian = radian;
	}
	
	public void showCircleInfo() {
		System.out.printf("좌표[%d, %d]", xPos, yPos);
		System.out.println("반지름:"+radian);
	}
	
}

public class E11ObjectSerializable {

	public static void main(String[] args) {
		try {
			//인스턴스를 파일로 저장하기위해 출력스트림사용
			ObjectOutputStream out =
					new ObjectOutputStream(
							new FileOutputStream("src/ex20io/circle.obj"));
			
			//Circle인스턴스 생성 후 파일 저장
			out.writeObject(new Circle(1, 1, 2.4));
			out.writeObject(new Circle(2, 2, 4.8));
			
			//Java에서 제공하는 기본클래스는 별도 처리없이 직렬화 가능
			out.writeObject(new String("String타입의 오브젝트"));
			out.close();
			
			/*
			역직렬화
			
			인스턴스의 역직렬화를 위한 스트림생성 및
			readObject()로 복원
			*/
			ObjectInputStream in =
					new ObjectInputStream(
							new FileInputStream("src/ex20io/circle.obj"));
			
			//저장때 Object기반으로 했으니 복원시엔 원래 자료형으로 형변환해야함
			Circle c1 = (Circle)in.readObject();
			Circle c2 = (Circle)in.readObject();
			String message = (String)in.readObject();
			in.close();
			
			//개발자가 직접정의한 클래스는 별도 멤버메서드로 출력
			c1.showCircleInfo();
			c2.showCircleInfo();	
			
			//기본클래스는 즉시 출력가능
			System.out.println("String 오브젝트:"+ message);
			
		}catch (ClassNotFoundException e) {
			System.out.println("파일없음");
		}catch (FileNotFoundException e) {
			System.out.println("파일없음");
		}catch (IOException e) {
			System.out.println("IO오류발생");
		}
	}

}
