package autoscan;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
servlet-context.xml에서 component-scan으로 설정된
기본패키지에서 서비스 클래스 역할을 부여하기위한 어노테이션
스프링 컨테이너가 시작시 자동으로 빈생성 
 */
@Service
public class MyService {
	public MyService() {
		System.out.println("MyService생성자 호출");
	}
	
	/*
	 서비스 객체는 클라이언트의 요청을 처리하기 위해
	 주로 Model(DAO)를 호출하여 비즈니스 로직을 처리함
	 */
	MyDAO myDAO;
	
	@Autowired
	public void setMyDAO(MyDAO myDAO) {
		this.myDAO = myDAO;
		System.out.println("setMyDAO() 호출-MyService");
	}
	
	public void execute() {
		myDAO.selectList();
	}
}
