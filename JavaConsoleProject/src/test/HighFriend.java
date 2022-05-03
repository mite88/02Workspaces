package test;

public //자식클래스(고딩친구) 
class HighFriend extends Friend {
	// 자식에서 확장한 멤버변수
	String nickname;

	// 생성자
	public HighFriend(String name, String phone, String addr, String nickname) {
		super(name, phone, addr);// 부모객체받기..
		this.nickname = nickname;
	}

	// 오버라이딩 : 고딩친구 전체정보 출력
	@Override
	public void showAllData() {
		System.out.println("==고딩친구(전체정보)==");
		super.showAllData();// 부모의멤버호출
		System.out.println("별명:" + nickname);
	}

	// 오버라이딩 : 고딩친구 간략정보 출력
	@Override
	public void showBasicInfo() {
		System.out.println("==고딩친구==");
		System.out.println("별명:" + nickname);
		System.out.println("전번:" + phone);
	}

}