package test;

public class Friend {
	//최상위클래스(친구) : 객체 생성x, 기본정보 저장 및 상속용
		// 멤버변수
		String name;
		String phone;
		String addr;

		// 인자생성자
		public Friend(String name, String phone, String addr) {
			this.name = name;
			this.phone = phone;
			this.addr = addr;
		}

		// 멤버메서드 : 멤버변수 전체정보 출력
		public void showAllData() {
			System.out.println("이름:" + name);
			System.out.println("전화번호:" + phone);
			System.out.println("주소:" + addr);
		}

		// 멤버메서드(오버라이딩용) : 실행부가 없음
		public void showBasicInfo() {
		}

}
