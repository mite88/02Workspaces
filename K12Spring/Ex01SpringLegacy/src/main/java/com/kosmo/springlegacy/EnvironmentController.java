package com.kosmo.springlegacy;

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
		
		//스프링 컨테이너 생성
		ConfigurableApplicationContext ctx = new GenericXmlApplicationContext();
		//Environment 객체 생성
		ConfigurableEnvironment env = ctx.getEnvironment();
		//외부파일 읽을 준비
		MutablePropertySources propertySources = env.getPropertySources();

		String adminIdStr="";
		String adminPwStr="";
		
		try {
			/*
			classpath
			해당 키워드는 프로젝트 배포시 classes폴더 하위로
			Export 되는 경로이며 프로젝트에서 작성한 Java파일 및 xml설정 파일들이 포함
			*/
			String envPath = "classpath:EnvAdmin.properties";
			
			//외부파일 경로를 통해 addLast()메서드로 프로퍼티 소스 읽기
			propertySources.addLast(new ResourcePropertySource(envPath));
			//파일 내용을 읽어 변수에 저장함
			adminIdStr = env.getProperty("admin.id");
			adminPwStr = env.getProperty("admin.pw");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//Model 객체 저장후 view로 전달
		model.addAttribute("adminID", adminIdStr);
		model.addAttribute("adminPW", adminPwStr);
		
		return "05Environment/main1";
	}
}
