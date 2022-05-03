package test;

import java.util.*;


public class MyFriendInfoBook {
	
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
