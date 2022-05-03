package ex17collection;

import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

/*
HashMap<K, V>
Map<T>인터페이스를 구현한 컬렉션 클래스
- key value의 쌍으로 객체 저장
- 키값은 중복x , 중복시 덮어씀
- 키값으로 검색하므로 다른컬렉션에 비해 속도빠름
*/
public class Ex05HashMapMain {

	public static void main(String[] args) {

		// Map컬랙션 생성, Key와 value 모두 String임
		HashMap<String, String> map = new HashMap<String, String>();

		// 객체저장
		System.out.println("name이라는 키값으로 저장된 이전의 값:" + map.put("name", "26"));

		int number = 20;
		// map.put("age", number); // HashMap<String, String> 인데 안맞음
		map.put("age", String.valueOf(number));
		map.put("gender", "62");
		map.put("address", "남자");
		System.out.println("저장된 객체수:" + map.size()); // 4개

		// 중복저장 : key값이 동일할 경우 값이 바뀐다
		System.out.println("name이라는 키값으로 저장된 이전의 값 : " + map.put("name", "최길동")); // 덮어씀
		System.out.println("키값으로 중복 저장후 객체수:" + map.size()); // 4개

		/*
		 * 출력 : 키값을 아는 경우 - get(키값)
		 */
		System.out.println("키값을 알때:" + map.get("name"));

		/*
		 * 출력 : 키값을 모르는 경우 - keySet() 호출하여 키값을 Set컬렉션으로 얻기 - 확장 for문으로 해당 반환값 추출하여 저장된 값
		 * 추출
		 * 
		 * Map계열의 컬렉션은 처음부터 확장 for문사용 불가능
		 */
		Set<String> keys = map.keySet();
		System.out.println("[확장for문 적용]");
		for (String key : keys) {
			String value = map.get(key);
			System.out.println(String.format("%s:%s", key, value));
		}

		/*
		 * 이터레이터를 통한 출력 - keySet()을 통해 키값 얻고 반복출력
		 */
		System.out.println("[이터레이터 사용하기]");
		Set<String> keys2 = map.keySet();
		Iterator<String> it = keys2.iterator();

		while (it.hasNext()) {
			String key = it.next();// key값
			String value = map.get(key);// value값
			System.out.println(String.format("%s:%s", key, value));
		}
		// Value 만 얻을때 : values()메서드 사용
		System.out.println("[value값들만 출력하기]");
		
		//values()메서드의 반환타입은 Collection<T>
		Collection<String> values = map.values();

		for (String value : values) {
			System.out.println(value);
		}

		/*
		 존재유무확인
		 containsKey(), containsValue()
		 */
		System.out.println(map.containsKey("name") ? "name키값이 있다" : "name키값이 없다");
		System.out.println(map.containsKey("account") ? "account키값이 있다" : "account키값이 없다");
		System.out.println(map.containsValue("남자") ? "남자있다" : "남자없다");
		System.out.println(map.containsValue("여자") ? "여자있다" : "여자없다");

		// 삭제 : key값을 통해 삭제
		System.out.println("삭제된객체:" + map.remove("age"));
		System.out.println("[age키값을 삭제 후 출력]");
		for (String key : keys) {
			System.out.println(String.format("%s:%s", key, map.get(key)));
		}

		// 전체 삭제 : clear()만 가능
		map.clear();
		System.out.println("전체삭제 후 객체수:" + map.size());

	}

}
