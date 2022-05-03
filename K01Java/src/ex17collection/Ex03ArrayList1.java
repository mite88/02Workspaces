package ex17collection;

import java.util.ArrayList;
import java.util.Iterator;

/*
ArrayList<E>
- List계열의 컬렉션
- 데이터중복 허용, 저장 순서 보장
- 접근시 get(),iterator() 이용
- 배열처럼 index를 통한 저장 및 접근가능
*/
public class Ex03ArrayList1 {

	public static void main(String[] args) {
		//String객체를 저장할 수 있는 List컬렉션 생성
		//* LinkedList도 내부구조만 다를뿐 사용법은 같음
		ArrayList<String> list = new ArrayList<String>();
		//LinkedList<String> list = new LinkedList<String>();
		//Vector<String> list = new Vector<String>();
		
		/*
		객체저장 및 삽입 : add()
		add(객체) / add(인덱스, 객체)
		* 인덱스를 건너뛰어서 저장하면 에러발생함
		* 해당인덱스에 객체가 저장된 상태에서 사용 시 끼워넣기가 가능
		*/
		list.add("소녀시대");
		list.add("빅뱅");
		list.add("트와이스");
		list.add(3, "워너원");
		//list.add(5, "소방차ㅋㅋㅋ");//에러
		
		/*
		저장된 객체수(리스트 크기) : size()
		(배열의 length와 동일)
		*/
		list.add(list.size(),"오마이걸");
		list.add(list.size(),"방탄소년단");
		System.out.println("중복 저장전 객체수:"+list.size());  //6
		
		//중복저장: List는 배열의 특성을 가지고있어 index로 구분하여 중복저장됨 
		//저장성공시 true
		System.out.println(list.add("트와이스") ? "중복저장됨" : "중복저장안됨");
		System.out.println("중복 저장후 객체수 : " + list.size());  //7
		
		//출력 - 일반 for문 :접근시 get()메서드 사용
		System.out.println("[일반for문사용]");
		for (int i = 0; i < list.size(); i++) {
			System.out.print(list.get(i)+" ");
		}
		
		//출력 - 확장 for문 : 전체 요소반복(가장많이 사용됨)
		System.out.println("\n[확장for문사용]");
		for (String obj : list) {
			System.out.print(obj+" ");
		}
		
		/*
		출력 - Iterator(반복자)
		1. 컬렉션에 저장된 내용을 Iterator객체에게 알려주기 위해 객체 생성
		2. hasNext()로 반환할 객체가 있는지검사
		3. next()로 해당 객체 반환
		4. 모든 객체 반환시 false반환하여 탈출
		*/
		System.out.println("\n[반복자(Iterator) 사용]");
		Iterator<String> itr = list.iterator();
		while (itr.hasNext()) {
			System.out.print(itr.next()+" ");
		}
		System.out.println("\n=====================\n");
		
		//덮어쓰기(수정) : set(index, 객체);
		list.set(4, "오마이걸>덮어쓰기");
		for (String obj : list) {
			System.out.print(obj+" ");
		}
		System.out.println("\n=====================\n");
		
		//삽입(끼워넣기) : add(삽입 할 index, 객체);
		//해당 인덱스에 객체 삽입 및 자동으로 밀려남(인덱싱)
		list.add(4,"블랙핑크>삽입하기");
		for (String obj : list) {
			System.out.print(obj+" ");
		}
		System.out.println("\n=====================\n");
		
		//포함여부확인 : contains(객체) - 존재 여부만 확인
		System.out.println(list.contains("빅뱅") ? "빅뱅 있음" : "빅뱅없음");
		System.out.println(list.contains("블랙핑크") ?
				"블랙핑크 있음" : "블랙핑크 없음");
		System.out.println("\n=====================\n");
		
		/*
		 삭제 - remove(index);
		  
		 삭제 후 인덱스 자동재부여, 
		 삭제 성공시 해당 객체를 반환해서 어떤 객체가 삭제되었는지 확인가능
		 */
		//삭제1 :index로 삭제
		Object obj = list.remove(2);
		System.out.println("삭제된객체:"+obj);
		System.out.println("\n=====================\n");
		
		//삭제2 : indexof()로 해당 객체의 인덱스를 찾은 후 삭제
		int index = list.indexOf("빅뱅");
		System.out.println("빅뱅의 index="+index);
		list.remove(index);
		System.out.println("\n=====================\n");
		
		//삭제3 : 객체의 참조값을 통해 삭제
		System.out.println(list.remove("방탄소년단") ? "삭제성공(방탄)" : "삭제 실페(방탄)");
		System.out.println(list.remove("오마이걸") ? "삭제성공(오마이걸)" : "삭제 실패오마이걸)");
		System.out.println("삭제후 출력");
		for (String ob : list) {
			System.out.print(ob+" ");
		}
		System.out.println();
		
		System.out.println("\n=====================\n");
		
		//전제삭제 - removeAll(객체) or 객체.clear()
		list.removeAll(list);
		list.clear();
		System.out.println("전체삭제후 객체수 : "+list.size());
		System.out.println("\n=====================\n");
	}

}
