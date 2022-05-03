package ex17collection;

import java.util.HashSet;

import common.Teacher;

public class Ex04HashSet2 {

	public static void main(String[] args) {
		//Teacher객체를 저장할 수 있는 HashSet생성
		HashSet<Teacher> hashSet = new HashSet<Teacher>();
		
		//객체 생성 및 추가
		Teacher t1 = new Teacher("정우성", 40, "국어");
		Teacher t2 = new Teacher("황정민", 42, "영어");
		Teacher t3 = new Teacher("최민식", 44, "수학");
		
		hashSet.add(t1);
		hashSet.add(t2);
		hashSet.add(t3);
		
		//모두 다른값이므로 크기가 3
		System.out.println("hashSet의 크기:"+ hashSet.size());
		
		//Teacher클래스 정의시 별도의 오버라이딩을 하지 않으면 그냥 입력됨
		Teacher t3Same = new Teacher("이정재", 40, "국어");
		
		/*
		아래클래스에서 오버라이딩으로 정의 하였으므로 
		나이와 과목이 같기에 들어가지 않음
		*/
		System.out.println("t3Same저장여부:"+hashSet.add(t3Same));
		System.out.println("hashSet의 크기:"+hashSet.size());
	}

}
