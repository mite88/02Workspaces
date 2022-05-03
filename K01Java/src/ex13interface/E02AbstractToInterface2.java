package ex13interface;

/*
추상클래스 -> 인터페이스
abstract class -> interface
메서드 : public abstract 제거
멤버변수 : public static final 제거
 */
interface PersonalNumberStorageAbs2{

	void addPersonalInfo(String juminNum, String name);
	String searchPersonalInfo(String juminNum);
}


class PersonalInfoDTO2{
	private String name;
	private String juminNum;
	
	//생성자
	public PersonalInfoDTO2(String name, String juminNum) {
		this.name = name;
		this.juminNum = juminNum;
	}
	
	//getter / setter : DTO객체에서 private로 선언된 멤버변수를 설정 및 반환
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getJuminNum() {return juminNum;}
	public void setJuminNum(String juminNum) {this.juminNum = juminNum;}
	
}

/*
 자식클래스 상속, 인터페이스가 인터페이스 상속: extends
 인터페이스(구현) : implements
 */
class PersonalNumberStorageExt2 implements PersonalNumberStorageAbs2{

	PersonalInfoDTO2[] personalArr;
	int numOfPerInfo;

	public PersonalNumberStorageExt2(int arrSize) {
		personalArr = new PersonalInfoDTO2[arrSize];
		numOfPerInfo = 0;
	}
	
	
	@Override
	public void addPersonalInfo(String juminNum, String name) {
		personalArr[numOfPerInfo] = new PersonalInfoDTO2(name, juminNum);
		numOfPerInfo++;
	}


	@Override
	public String searchPersonalInfo(String juminNum) {
		for (int i = 0; i < numOfPerInfo; i++) {
			if(juminNum.compareTo(personalArr[i].getJuminNum()) == 0) {
				return personalArr[i].getName();
			}
			
		}
		return null;
	}
	
}

public class E02AbstractToInterface2 {

	public static void main(String[] args) {
		PersonalNumberStorageExt2 storage =
				new PersonalNumberStorageExt2(10);
		
		storage.addPersonalInfo("901234-2222222", "김태희");
		storage.addPersonalInfo("901234-1111111", "정지훈");
		
		System.out.println(storage.searchPersonalInfo("901234-2222222"));
		System.out.println(storage.searchPersonalInfo("901234-1111111"));
		System.out.println(storage.searchPersonalInfo("9011234-1090333"));
	}

}
