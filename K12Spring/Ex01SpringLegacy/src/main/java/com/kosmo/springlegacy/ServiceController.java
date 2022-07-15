package com.kosmo.springlegacy;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import autoscan.LottoService;
import autoscan.LottoVO;
import autoscan.MyService;

/*
servlet-context.xml에서 component-scan으로 설정된 패키지에서
컨트롤러 클래스 역할울 부여하기 위한 어노테이션으로 스프링 컨테이너 
시작시 자동으로 빈 생성됨
*/
@Controller
public class ServiceController {
	
	/*
	서비스 객체를 자동으로 주입받음
	 @Autowired는 멤버변수, 생성자,setter에서 사용가능
	 또한 스프링 컨테이너에서 미리 생성되어 있어야하함 
	*/
	MyService myService;
	
	@Autowired
	public void setMyService(MyService myService) {
		this.myService = myService;
		System.out.println("setMyService()호출 - ServiceController");
	}
	
	/*
	 요청명에 대한 매핑처리. 
	 컨트롤러는 요청을 분석 후 적절한 서비스객체를 호출함
	 이때 컨트롤러가 받은 모든 요청을 전달함 
	 */
	@RequestMapping("/service/myService.do")
	private String myService() {
		myService.execute();
		
		return "07Service/myService";
	}
	
	@Autowired
	private LottoService lottoService;
	
	@RequestMapping("/service/myLotto.do")
	private String myLotto(LottoVO lottoVO, Model model) {
		lottoVO = lottoService.getLottoProcess(lottoVO.getUserLottoNum(), lottoVO);
		
		return "07Service/myLotto";
	}
}
