package test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.Scanner;

public class FriendInfoHandler {
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
	
}