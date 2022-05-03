package ex20io;

import java.io.*;
import java.util.*;



class Friend implements Serializable{
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

//자식클래스(고딩친구) 
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

//자식클래스 : 대학친구
class UnivFriend extends Friend {
	// 멤버변수
	String major;

	// 인자생성자
	public UnivFriend(String name, String phone, String addr, String major) {
		super(name, phone, addr);
		this.major = major;
	}

	@Override
	public void showAllData() {
		System.out.println("==대딩친구(전체정보)==");
		super.showAllData();
		System.out.println("전공:" + major);
	}

	@Override
	public void showBasicInfo() {
		System.out.println("==대딩친구==");
		System.out.println("이름:" + name);
		System.out.println("전화번호:" + phone);
	}

}

class FriendInfoHandler {
	//기존의 객체배열 저장방식을 List계열의 컬렉션으로 변경
	ArrayList<Friend> myFriends; //부모인 Friend타입의 객체 저장
	
	/*
	List<E>계열의 컬렉션은 인덱스가 있지만 자동 인덱싱이 되니 
	인덱스저장용 변수필요없음
	*/
	//numOfFriends = 0;
	
	public FriendInfoHandler(int num) {
		myFriends = new ArrayList<Friend>(); //멤버변수로 선언한  List컬랙션의 객체 생성
	}

	//새친구 추가
	public void addFriend(int choice) {
		Scanner scan = new Scanner(System.in);
		String iName, iPhone, iAddr, iNickname, iMajor;

		//공통정보
		System.out.println("이름:"); iName = scan.nextLine();
		System.out.println("전화번호:"); iPhone = scan.nextLine();
		System.out.println("주소:"); iAddr = scan.nextLine();

		//추가정보
		/*
		List<E>계열의 컬렉션 객체 추가 : add(), 자동인덱싱부여
		*/
		if (choice == 1) {
			System.out.print("별명:"); iNickname = scan.nextLine();

			HighFriend high = new HighFriend(iName, iPhone, iAddr, iNickname);
			myFriends.add(high);
		} else if (choice == 2) {
			System.out.print("전공:"); iMajor = scan.nextLine();
			myFriends.add(new UnivFriend(iName, iPhone, iAddr, iMajor));
		}

		System.out.println("친구정보 입력이 완료되었습니다");
	}//// end of addFriend

	//친구전체정보출력 - 일반for문
	public void showAllData() {
		//size()메서드를 통해 컬렉션에 저장된 객체의 갯수만큼출력
		for (int i = 0; i < myFriends.size(); i++) {
			myFriends.get(i).showAllData();
		}
		System.out.println("==전체정보가 출력되었습니다==");
	}

	//친구간략정보출력 - 확장for문
	public void showSimpleData() {
		//ArrayList<E>에는 Friend타입의 객체가 저장되어 확장for문시 사용
		for (Friend fr : myFriends) {
			fr.showBasicInfo(); //오버러이딩된 메서드출력함

		}
		System.out.println("==간략정보가 출력되었습니다==");
	}

	//검색
	public void searchInfo() {

		boolean isFind = false;// 검색한 정보가 있는지 확인하기 위한 변수
		Scanner scan = new Scanner(System.in);

		System.out.print("검색할 이름을 입력하세요:");
		String searchName = scan.nextLine();

		//Iterator를 이용하여 검색
		Iterator<Friend> itr = myFriends.iterator();

		while (itr.hasNext()) {
			Friend fr = itr.next();
			//searchName.equals(fr.name) 도가능함
			if (searchName.compareTo(fr.name) == 0) {
				fr.showAllData();
				System.out.println("**귀하가 요청하는 정보를 찾았습니다**");
				isFind = true;
			}
		}

		if (isFind = false)
			System.out.println("**찾는 정보가 없습니다**");
	}

	//친구정보 삭제
	public void deleteInfo() {
		Scanner scan = new Scanner(System.in);
		System.out.print("삭제할 이름을 입력하세요:");
		String deleteName = scan.nextLine();
		int deleteIndex = -1;
		
		for (Friend fr : myFriends) {
			if (deleteName.compareTo(fr.name) == 0) {
				myFriends.remove(fr);
				deleteIndex = 1;
				break;
			}
		}

		if (deleteIndex == -1) {
			System.out.println("==삭제된 데이터가 없습니다==");
		} else {
			System.out.println("==데이터가 삭제되었습니다==");
		} //// end of deleteInfo
	}
	
	/*
	연습문제1] 친구정보를 파일로 직렬화하기 위한 메서드를 정의하시오. 
		현재 친구의 정보를 List컬렉션에 저장되고 있다. 프로그램을 종료할때
		저장된 모든 친구의 정보를 파일로 저장할 수 있는 메서드를 정의하시오
		파일명 : myfriend_info.obj
		메서드명 : saveFriendInfo()
		※ 해당 메서드는 FriendInfoHandler 클래스에 추가하면 된다. 

	연습문제2] 프로그램을 다시 시작하면 문제1에서 직렬화 했던 파일을 역직렬화해서
		복원하시오. 만약 3명의 정보가 저장되었다면 다시 시작한 직후 정보출력을 하면
		3명의 정보가 출력되어야 한다. 
		메서드명 : readFriendInfo()
		※ 해당 메서드는 FriendInfoHandler 클래스에 추가하면 된다.

	*/
	
	//프로그램 종료
	public void saveFriendInfo() {

		try {
			ObjectOutputStream out =
					new ObjectOutputStream(
							new FileOutputStream("src/ex20io/myfriend_info.obj"));

			//out.writeObject(myFriends); //내가 한거
			
			//선생님께서 ...
			for (Friend f : myFriends) {
				out.writeObject(f);
			}
			
			out.close();

		}catch (FileNotFoundException e) {
			System.out.println("파일없음");
		}catch (IOException e) {
			System.out.println("IO오류발생");
		}
		
	}
	
	//출력
	public void readFriendInfo() {
		try {
			
			//역직렬화
			FileInputStream fis =new FileInputStream("src/ex20io/myfriend_info.obj");
			ObjectInputStream in =new ObjectInputStream(fis);
			
			//내가 쓴거
			//myFriends = (ArrayList<Friend>)in.readObject();
			
			//선생님이쓰신거
			while (true) {
				//복원한 객체는 Friend로 형변환하고
				Friend fr = (Friend)in.readObject();
				//List컬렉션에 추가
				myFriends.add(fr);
				
				if(fr == null) break;//객체없으면 끝
			}

		in.close();


		}catch (ClassNotFoundException e) {
			System.out.println("파일없음");
		}catch (FileNotFoundException e) {
			System.out.println("파일없음");
		}catch (IOException e) {
			System.out.println("IO오류발생");
		}
	}
	
}
public class E12MyFriendSerializable {
	
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
		
		handler.readFriendInfo(); //직렬화된 파일있을때 복원하여 컬렉션저장
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
				handler.saveFriendInfo();
				System.out.println("프로그램종료");
				return;//main 종료
			}//switch end

		}//while end
	}//main end

}
