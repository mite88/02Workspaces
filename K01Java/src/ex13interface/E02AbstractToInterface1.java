package ex13interface;

//프로젝트 전체의 기준의 역활을 하는 추상클래스
abstract class PersonalNumberStorageAbs{
	//추상메서드 (하위 클래스는 반드시 오버라이딩 해야함)
	public abstract void addPersonalInfo(String juminNum, String name);
	public abstract String searchPersonalInfo(String juminNum);
}

/*
DTO(Data Transfer Object)
데이터를 저장하고 전송하기 위한 객체
(해당프로그램에서는 한사람의 정보를 저장하는용도임)
*/
class PersonalInfoDTO{
	private String name;
	private String juminNum;
	
	//생성자
	public PersonalInfoDTO(String name, String juminNum) {
		this.name = name;
		this.juminNum = juminNum;
	}
	
	//getter / setter : DTO객체에서 private로 선언된 멤버변수를 설정 및 반환
	public String getName() {return name;}
	public void setName(String name) {this.name = name;}
	public String getJuminNum() {return juminNum;}
	public void setJuminNum(String juminNum) {this.juminNum = juminNum;}
	
}

//추상클래스를 상속하여 저장 및 검색 기능 구현
class PersonalNumberStorageExt extends PersonalNumberStorageAbs{

	//정보저장용 객체배열 과 은덱스 카운터용으로 사용할 멤버변수
	PersonalInfoDTO[] personalArr;
	int numOfPerInfo;
	
	//생성자
	public PersonalNumberStorageExt(int arrSize) {
		personalArr = new PersonalInfoDTO[arrSize];
		numOfPerInfo = 0;
	}
	
	//오버라이딩(필수) : 주민번호와 이름을 받아 DTO객체 생성 후 객체배열 저장
	@Override
	public void addPersonalInfo(String juminNum, String name) {
		personalArr[numOfPerInfo] = new PersonalInfoDTO(name, juminNum);
		numOfPerInfo++;
	}

	//오버라이딩(필수) : 주민번호를 방아 객체배열 중 일치한 정보 검색 후 결과 출력
	@Override
	public String searchPersonalInfo(String juminNum) {
		//DTO객체의 멤버변수는 private라서 외부 접근이 불가하므로 getter을 통해 접근
		for (int i = 0; i < numOfPerInfo; i++) {
			if(juminNum.compareTo(personalArr[i].getJuminNum()) == 0) {
				return personalArr[i].getName();
			}
			
		}
		//결과 없으면 null
		return null;
	}
	
}

public class E02AbstractToInterface1 {

	public static void main(String[] args) {
		PersonalNumberStorageExt storage =
				new PersonalNumberStorageExt(10);
		
		storage.addPersonalInfo("901234-2222222", "김태희");
		storage.addPersonalInfo("901234-1111111", "정지훈");
		
		System.out.println(storage.searchPersonalInfo("901234-2222222"));
		System.out.println(storage.searchPersonalInfo("901234-1111111"));
		System.out.println(storage.searchPersonalInfo("9011234-1090333"));
	}

}
