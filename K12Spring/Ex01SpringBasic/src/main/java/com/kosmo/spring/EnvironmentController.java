package com.kosmo.spring;

import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.io.support.ResourcePropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EnvironmentController {
 
	@RequestMapping("/environment/main1")
	public String main1(Model model) {
		//1.스프링 컨테이너 생성
		ConfigurableApplicationContext ctx = new GenericXmlApplicationContext();
		//2.스프링 컨테이너를 기반으로 Environment 객체 생성
		ConfigurableEnvironment env = ctx.getEnvironment();
		//3.Environment 객체를 기반으로 외부파일을 읽을 준비를 한다. 
		MutablePropertySources propertySources = env.getPropertySources();

		String adminIdStr = "";
		String adminPwStr = "";
		try {
			/*
			classpath : 해당 키워드는 프로젝트를 배포했을때 classes폴더 하위로
				Export되는 경로를 가리킨다. 프로젝트에서 작성했던 Java파일이나 
				XML 설정 파일등이 포함된다. 
			 */
			String envPath = "classpath:EnvAdmin.properties";
			//4.외부파일의 경로를 통해 addLast()메서드로 프로퍼티소스를 읽어온다. 
			propertySources.addLast(new ResourcePropertySource(envPath));
			//5.파일의 내용을 읽어 변수에 저장한다. 
			adminIdStr = env.getProperty("admin.id");
			adminPwStr = env.getProperty("admin.pw");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		//Model객체에 저장한 후 View로 전달하기
		model.addAttribute("adminID", adminIdStr);
		model.addAttribute("adminPW", adminPwStr);

		return "05Environment/main1";
	}
	
	
	
	 
	
}
