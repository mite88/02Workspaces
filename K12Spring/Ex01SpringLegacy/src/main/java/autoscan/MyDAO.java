package autoscan;

import org.springframework.stereotype.Repository;
/*
servlet-context.xml에서 component-scan으로 설정된 기본패키지에서
모델 클래스 역할을 부여하기위한 어노테이션
프프링 컨테이너 시작시 자동으로 빈생성
 */
@Repository
public class MyDAO {
	public MyDAO() {
		System.out.println("MyDAO 생성자 호출");
	}
	
	public void selectList() {
		System.out.println("게시판리스트 출력");
	}
}
