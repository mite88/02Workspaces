package ex17collection;

import java.util.*;

public class Ex07AsList {

	//List컬렉션을 매개변수로 받은후 전체 출력
	public static void listPrint(String title, List<String> list) {
		System.out.println("# "+title);
		
		//출력내용이 String라서 별도 오버라이딩 필요x
		for (Object ob : list) {
			System.out.print(ob +" ");
		}
		System.out.println();
	}
	
	public static void main(String[] args) {
		String[] strArr = new String[] {"마린, 파이어뱃, 메딕, 마린"};
		/*
		 Arrays.asList()
		 일반적인 배열을 List계열의 컬렉션으로 변경하여 반환
		 단, 참조할수만 있고 변경불가
		*/
		List<String> list = Arrays.asList(strArr);
		listPrint("출력1", list);
		
		//list.add("탱크"); //에러
		
		//ArrayList<E>생성자를 통해 객체 복사하면 데이터 변경가능
		list = new ArrayList<String>(list);
		boolean isAdd = list.add("탱크");
		System.out.println("add결과:"+isAdd);
		listPrint("출력2", list);
	
		System.out.println("# 출력3");
		for (Iterator<String> itr = list.iterator(); itr.hasNext();) {
			System.out.print( itr.next()+" ");
		}
		System.out.println();
		
		//Set<E>계열의 컬렉션은 중복허용이 안됨
		HashSet<String> set = new HashSet<String>(list);
		list = new ArrayList<String>(set);
		listPrint("출력4", list);
	}

}
