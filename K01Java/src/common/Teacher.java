package common;

import java.util.Objects;

public class Teacher extends Person{

	private String subject;
	
	public Teacher(String name, int age, String subject) {
		super(name, age);
		this.subject = subject;
	}

	@Override
	public String toString() {
		return super.toString()+",  과목:"+subject;
	}
	
	/*
	 사용자정의 클래스 : 
	 나이와 과목이 같으면 동일 객체로 처리하기위한 오버라이딩
	*/
	
	/*
	hashCode()
	객체가 가진 고유한 주소값을 정수형으로 반환(다른객체면 다른값)
	* 객체형 멤버변수의 경우 hashCode()로 정수값으로 변환하여 사용
	*/
	@Override 
	public int hashCode() {
		//방법2개 중 아무거나 가능함
		//stbject의 경우 String 형인데 반환형이 int형이라 hashCode()로변환
		
		//정수형변수와 객체의 해시코드 값더해서 반환
		int returnCode1 = super.getAge() + this.subject.hashCode();
		System.out.println("returnCode1:"+returnCode1);
		
		//Objects 클래스의 정적메서드인 hash()활용 , 멤버변수의 갯수만큼 인수로 사
		int returnCode2 = Objects.hash( super.getAge(), this.subject);
		System.out.println("returnCode2:"+returnCode2);
		
		return returnCode2;
	}
	
	//비교대상을 정하는 것
	/*
	equals()
	객체가 가진 멤버변수 값 비교
	중복확인을 위해 두번째 오버라이딩 해야할 메서드
	*/
	@Override
	public boolean equals(Object obj) {
		Teacher teacher = (Teacher)obj;
		//나이와 과목에 대한 값이 동일한지 비교함
		if((teacher.getAge()==super.getAge()) &&
				teacher.subject.equals(this.subject)) {
			return true;  //true로 해줘야함
		}
		return false;
	}
}
