package ex17collection;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.Scanner;

import common.Student;

public class Ex03ArrayList2 {

	public static void main(String[] args) {
		//arrayList로 해도 자료구조만 차이날뿐 구현 방법엔 차이가 없음
		//컬렉션 생성 시 Student형의 타입매개변수 사용
		LinkedList<Student> list2= new LinkedList<Student>();
		
		//객체 생성
		Student st1 = new Student("정우성", 10, "2018");
		Student st2 = new Student("원빈", 20, "2017");
		Student st3 = new Student("장동건", 30, "2016");
		Student st4 = new Student("공유", 40, "2015");
		
		//컬렉션에 인스턴스 추가
		list2.add(st1);
		list2.add(st2);
		list2.add(st3);
		list2.add(st4);
		list2.add(st2); //동일객체 추가 가능

		//일반for문을 이용하여 객체 출력
		System.out.println("[출력1- 일반for문]");
		for (int i = 0; i < list2.size(); i++) {
			//toString()메서드를 오버라이딩 하여서 이렇게만 해도 출력이됨
			System.out.println(list2.get(i)); //get()메서드로 객체 접근
		}
		
		//객체의 참조값을 통해 삭제 시 앞에 있는 객체 1개가 삭제됨
		boolean removeOK = list2.remove(st2);
		System.out.println("인스턴스를 통한 삭제:"+removeOK);
		
		System.out.println("[출력2- 이터레이터");
		Iterator<Student> it2 = list2.iterator();
		while (it2.hasNext()) {
			System.out.println(it2.next());	
		}
		
		//삭제할 객체의 이름을 받은 후 해당 객체 검색하여 삭제하는 기능
		int idx = 0;
		Scanner scanner = new Scanner(System.in);
		System.out.print("삭제할 이름을 입력하세요:");
		String removeName = scanner.nextLine();
		for (Student st : list2) {
			//이름 검색 시 getter을 통해 접근함, Student객체에 저장된 name와 일치하는지 비교함
			if(removeName.equals(st.getName())) {
				list2.remove(st); //일치하는 객체의 참조값 찾아서 삭제함
				break;
			}
		}
		System.out.println("현재 객체수:"+list2.size());
		//삭제시 참조값이 반환되어 삭제된 객체의 정보를 출력가능
		System.out.println("삭제된 객체의 이름:"+list2.remove(2).getName());
		
		System.out.println("[출력3- 확장for문]");
		for (Student st : list2) {
			System.out.println(st);
		}

	}

}