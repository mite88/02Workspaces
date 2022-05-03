package ex15usefullclass;

class MyClass {
	int data;
	 
	 public MyClass(int data) {
		this.data = data;
	}
	/*
	toString() : 객체를 가진 데이터를 문자열로 반환
	*/
	@Override
	public String toString() {
		//정수를 문자열로 변환하여 반환
		return "data="+String.valueOf(data);
	}
	 
	/*
	equals() : 객체간의 비교를 위해 오버라이딩한 메서드
	객체가 가진 멤버변수 값에 대한 비교를 하여 동일여부판단
	*/
	//equals메서드의 매개변수 타입을 모든 객체 대상으로....
	@Override
	public boolean equals(Object obj) {
		/*매개변수로 전달된 객체를 받으면 업캐스팅이 되므로 
		다운캐스팅시킴
		
		이때 전달된 객체가 MyClass형이 아니면 비교대상이 
		되지 않으므로 상속관계에 있는지 instanceof를 통해 판단
		 */
		
		//매개변수가 MyClass 맞으면....
		//여기선 부모타입으로 자식맴버에 접근하기위해 다운캐스팅함
		if(obj instanceof MyClass) {
			MyClass mc = (MyClass)obj;
			
			if(mc.data == this.data) {
				System.out.println("MyClass-멤버동일함");
				return true;
			}else {
				System.out.println("MyClass-멤버다름");
				return false;
			}
		}else {
			/*매개변수로 전달된 객체가 MyClass의 인스턴스가 
			 아닐시 비교대상이 아님
			 */
			System.out.println("MyClass객체아님");
			return false;
		}
	}
 }
public class E04Object3Equals {

	public static void main(String[] args) {
		//객체2개생성
		MyClass mc1 = new MyClass(10);
		MyClass mc2 = new MyClass(10);
		
		//참조값 비교
		System.out.println("[두 객체를 equles()메서드로 비교]");
		if(mc1 == mc2) {
			System.out.println("인스턴스 참조값(주소값)이 같다"); 
		}else {
			System.out.println("인스턴스 참조값(주소값)이 다르다");//출력
		}
	
		System.out.println(mc1.equals(mc2)? "같다" : "다르다");//같다
		
		System.out.println("[두 객체를 toString()메서드로 호출]");
		System.out.println("mc1.toString()=>"+mc1.toString());
		System.out.println("mc2=>"+mc2);
	}
}
