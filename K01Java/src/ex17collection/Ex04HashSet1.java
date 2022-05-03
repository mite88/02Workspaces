package ex17collection;

import java.util.Date;
import java.util.HashSet;
import java.util.Iterator;

import common.Teacher;
/*
HashSet<E> 컬렉션
- set계열의 인터페이스를 구현한 컬렉션(집합)
- 순서x, 중복저장x
- 단, 기본클래스(String, Integer등)가 아닌 개발자가 정의한 클래스는
  hasCode, equals 메서드로 오버라이딩하여 재정의 해야함
*/
public class Ex04HashSet1 {

	public static void main(String[] args) {
		//Object로 인해 모든객체 저장 가능
		HashSet<Object> set = new HashSet<Object>(); 
		
		//다양한 기본클래스와 정의한 Teacher클래스의 객체 생성
		String varString1 = "JAVA"; 
		String varString2 = new String("KOSMO"); 
		Date varDate = new Date(); 
		int varInt = 100; //Integer
		Teacher varTeacher = new Teacher("김봉두", 55, "체육");
		
		//객체저장 : add()
		System.out.println("add 결과:"+set.add(varString1)); 
		set.add(varString2); set.add(varDate); 
		set.add(varInt); 
		set.add(varTeacher);
		System.out.println("[중복된 저장전 객체수]:"+ set.size());
		
		/*
		 기본클래스의 객체 중복저장 
		 기본클래스의 경우 별도의 오버라이딩 없이 중복 제거
		 */
		System.out.println(set.add(varString2) ?
				"저장성공 ":"저장실패"); //저장실패
		System.out.println("[중복 저장후 객체수]:"+ set.size());

		//이터레이터를 통한 객체 출력 : 순서없이 저장되어 출력됨
		Iterator itr = set.iterator(); //이터레이터 객체 생성 및 준비
		while (itr.hasNext()) { //추출할 객체있는지 확인
			Object object = itr.next(); //객체 추출
			if(object instanceof Teacher) {
				/*
				 HashSet<E>에 저장시 모두 Object형으로 자동변환되어 저장되므로
				직접정의한 클래스에 대해서만 instanceof를 통해 
				타입확인 후 다운캐스팅 후 출력
				* 다운캐스팅을 하지 않을 시 자식객체로의 접근이 불가능
				 */
				
				System.out.println("Teacher객체:"+((Teacher)object).getName());
			}else {
				System.err.println("저장된객체:"+object);
			}
		}
		 
		//포함여부확인 : set컬렉션 내의 해당 객체 있는지만확인
		System.out.println(set.contains(varString1)? 
				"varString1 있음" : "varString1 없음");
		
		//객체삭제 : set컬렉션은 인덱스가없으니 참조값을 통해서만 삭제 가능
		System.out.println(set.remove(varString2)? 
				"varString2 삭제 성공" : "varString2 삭제 실패");
		
		//전체 삭제
		set.clear();
		System.out.println("전체삭제:"+set.removeAll(set));
		System.out.println("[전체 삭제후 객체 수]:"+set.size());
		
	}

}
