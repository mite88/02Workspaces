package mybatis;

import org.springframework.stereotype.Service;

//회원인증 처리를 위한 서비스객체
@Service
public interface MybatisMemberImpl {
	
	//로그인 처리를 위한 추상메서드
	public MemberVO login(String id, String pass);	
} 
