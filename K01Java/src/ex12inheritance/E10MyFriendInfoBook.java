package ex12inheritance;

import java.util.Iterator;
import java.util.Scanner;

//최상위클래스(친구) : 객체 생성x, 기본정보 저장 및 상속용
class Friend{
	//멤버변수
	String name;
	String phone;
	String addr;
	
	//인자생성자
	public Friend(String name, String phone, String addr) {
		this.name = name;
		this.phone = phone;
		this.addr = addr;
	}
	
	//멤버메서드 : 멤버변수 전체정보 출력
	public void showAllData() {
		System.out.println("이름:"+name);
		System.out.println("전화번호:"+phone);
		System.out.println("주소:"+addr);
	}
	
	//멤버메서드(오버라이딩용) : 실행부가 없음
	public void showBasicInfo() {}
	
}

//자식클래스(고딩친구) 
class HighFriend extends Friend{
	//자식에서 확장한 멤버변수
	String nickname;

	//생성자
	public HighFriend(String name, String phone, String addr
			,String nickname) {
		super(name, phone, addr);//부모객체받기..
		this.nickname = nickname;
	}
	
	//오버라이딩 : 고딩친구 전체정보 출력
	@Override
	public void showAllData() {
		System.out.println("==고딩친구(전체정보)==");
		super.showAllData();//부모의멤버호출
		System.out.println("별명:"+nickname);
	}
	
	//오버라이딩 : 고딩친구 간략정보 출력
	@Override
	public void showBasicInfo() {
		System.out.println("==고딩친구==");
		System.out.println("별명:"+nickname);
		System.out.println("전번:"+phone);
	}
	
}

//자식클래스 : 대학친구
class UnivFriend extends Friend{
	//멤버변수
	String major;
	
	//인자생성자
	public UnivFriend(String name, String phone, String addr,
			String major) {
		super(name, phone, addr);
		this.major = major;
	}
	
	@Override
	public void showAllData() {
		System.out.println("==대딩친구(전체정보)==");
		super.showAllData();
		System.out.println("전공:"+major);
	}
	
	@Override
	public void showBasicInfo() {
		System.out.println("==대딩친구=="); 		
		System.out.println("이름:"+name);
		System.out.println("전화번호:"+phone);
	}
	
}

/*
핸들러(매니저)클래스 : 해당 프로그램에 기능을 담당하는클래스
*/
class FriendInfoHandler{
	//멤버변수
	/*
	 친구정보(객체 참조값)저장할 Friend(부모) 객체 배열
	 
	 부모타입으로 객체 배열 생성시 그 하위타입의
	 모든객체를 저장할 수있어 편리함
	(여기선 High,Univ 객체 저장)
	 */
	private Friend[] myFriends;
	private int numOfFriends; //객체배열 인덱스용(친구데이터 갯수용)
	
	public FriendInfoHandler(int num) {
		/*
		 매개변수 num의 크기로 객체 배열 생성
		 (생성시 크기가 정해지면  null로 초기화되서 0으로 초기화)
		 */
		myFriends = new Friend[num];
		//최초엔 0으로 인덱스초기화
		numOfFriends = 0;
	}
	
	//새친구 추가
	public void addFriend(int choice) {
		/*
		next()와 nextLine의 차이
		next() : 뛰어쓰기 전까지 입력
		nextLine() : 뛰어쓰기 입력(문장전체 입력)
		*/
		
		//기본정보입력을 위한 객체 및 변수 생성
		Scanner scan = new Scanner(System.in);
		String iName, iPhone, iAddr, iNickname, iMajor;
		
		//기본정보 입력(공통) 
		/*
		해당프로그램에선 Friend 클래스를 통해 객체를 생성하지 않으며 
		상속용으로 만들어짐
		
		아래의 공통정보는 Friend 클래스의 멤버변수를 초기화
		*/
		System.out.println("이름:"); iName = scan.nextLine();
		System.out.println("전화번호:"); iPhone = scan.nextLine();
		System.out.println("주소:"); iAddr = scan.nextLine();
		
		/*
		1. 공통정보를 추가로 입력
		2. 객체배열에 저장(index)
		3. numOfFriends++ //배열에 저장후 증가됨
		*/
		if(choice == 1) {
			//기본정보 입력(고딩)
			System.out.println("별명:"); iNickname = scan.next();
			
			//객체 생성 및 참조변수 저장후 객체배열에 추가
			HighFriend high =
					new HighFriend(iName, iPhone, iAddr, iNickname);
			myFriends[numOfFriends++] = high;
		}else if(choice == 2) {
			//기본정보 입력(대딩)
			System.out.println("전공:"); iMajor = scan.nextLine();
			//객체 생성 및 참조변수 저장후 객체배열에 추가
			myFriends[numOfFriends++] = new UnivFriend
					(iName, iPhone, iAddr, iMajor);
		}
		
		/*
		각 객체 생성 및 초기화 후 객체배열 추가시 Friend타입으로 자동형변환됨
		부모타입의 참조변수로 자식객체를 참조 가능하기때문에 기능구현함
		*/
		System.out.println("친구정보 입력이 완료되었습니다");
	}

	//친구전체정보출력
	/*
	- 친구정보 추가시 High, Univ객체를 배열저장
	- 입력시  Friend타입으로 자동형변환됨
	- 출력시 배열의 객체수만큼 정보 출력
	- 출력을 위한 멤버메서드는 상속관계에서 오버라이딩되어 
	  참조변수 영향없이 자식객체가 정의한 맴버메서드가 호출
	  (저장된객체는 Friend지만 오버라이딩에 의해 형변환할 필요x->원하는 정보출력)
	*/
	public void showAllData() {
		//System.out.println("numOfFriends"+numOfFriends);
		for (int i = 0; i < numOfFriends; i++) {
			myFriends[i].showAllData();
			
		}
		System.out.println("==전체정보가 출력되었습니다==");
	}

	//친구간략정보출력
	public void showSimpleData() {
		for (int i = 0; i < numOfFriends; i++) {
			myFriends[i].showBasicInfo();
			
		}
		System.out.println("==간략정보가 출력되었습니다==");
	}

	//검색
	public void searchInfo() {
		boolean isFind = false; //검색한 정보존재여부
		Scanner scan = new Scanner(System.in);
		System.out.print("검색할 이름을 입력하세요:");
		String searchName = scan.nextLine();
		
		//객체배열을 반복하여 검색
		for (int i = 0; i < numOfFriends; i++) {
			//배열의 각 인덱스에 저장된 객체의 참조값으로 멤버변수 접근
			//compareTo(), equals() : 문자열 일치여부
			if(searchName.compareTo(myFriends[i].name) == 0) {
				myFriends[i].showAllData();
				System.out.println("**귀하가 요청하는 정보를 찾았습니다**");
				isFind = true;//정보찾으면 true
			}
			
		}if(isFind == false) {//정보없으면 false
			System.out.println("**찾는 정보가 없습니다**");
		}
	}//end of searchInfo

	//삭제
	public void deleteInfo() {
		Scanner scan = new Scanner(System.in);
		System.out.print("삭제할 이름을 입력하세요:");
		String deleteName = scan.nextLine();
		int deleteIndex = -1; //삭제 인덱스용, 초기값은 인덱스가 0부터이므로 -1로 함
		
		//삭제할 객체찾기용 
		for (int i = 0; i < numOfFriends; i++) {
			//삭제할 데이터 검색
			if(deleteName.compareTo(myFriends[i].name) == 0) {
				myFriends[i] = null; //자료삭제용으로 null로하고
				deleteIndex = i; //삭제한 인덱스값 저장
				numOfFriends--; //전체 배열수 감소
				break;//반복문빠져나가기
			}
		}
		
		if(deleteIndex == -1) {
			System.out.println("==삭제된 데이터가 없습니다==");
		}else {
			//삭제한 인덱스 뒤에 내용의 인덱스를 땡기기 위한 반복문
			for (int i = deleteIndex; i < numOfFriends; i++) {
				//현인덱스의 배열내용을 이전인덱스 배열로 옮기는 작업
				myFriends[i] = myFriends[i+1]; 
			}
			
			System.out.println("==데이터("+deleteIndex+"번)가 삭제되었습니다==");
		}
	}


}//end of addFriend

public class E10MyFriendInfoBook {
	
	//메뉴 (매개변수x, 반환값x) : 출력용
	public static void menuShow() {
		System.out.println("#######메뉴를 입력하세요#######");
		System.out.print("1.고딩친구입력 ");
		System.out.println("2.대딩친구입력");
		System.out.print("3.전체정보출력 ");
		System.out.println("4.간략정보출력");
		System.out.print("5.검색 ");
		System.out.print("6.삭제 ");
		System.out.println("7.프로그램종료");
		System.out.print("메뉴선택>>>");
	}

	//시작점(Entry point) : 전반적인 흐름에 대해서기술하는것이 좋음
	public static void main(String[] args) {
		//사용자 입력을 위한 객체 생성
		Scanner scan = new Scanner(System.in);
		//기능을 담당하는 핸들러(매니저)클래스의 객체 생성
		//Friend타입의 객체배열에 100명정보 저장
		FriendInfoHandler handler = new FriendInfoHandler(100);
		
		//무한루프 = for(;;) 가능하지만 반복횟수가정확하지 않아서 잘사용안함
		//break문으로 반복문 탈출이 가능하기때문에 자주이용
		while (true) {
			//메뉴출력
			menuShow();
			
			int choice = scan.nextInt(); //숫자로 메뉴 선택
			
			//선택한 메뉴에 대한 메서드 호출
			switch (choice) {
			//고딩/대딩친구입력
			case 1: case 2:
				handler.addFriend(choice);
				break;//switch문탈출
		
			case 3:
				//전체정보
				handler.showAllData();
				break;
				
			case 4:
				//간략정보
				handler.showSimpleData();
				break;
				
			case 5:
				//검색
				handler.searchInfo();
				break;
				
			case 6:
				//삭제
				handler.deleteInfo();
				break;
				
			case 7:
				System.out.println("프로그램종료");
				return;//main 종료
			}//switch end

		}//while end
	}//main end

}
