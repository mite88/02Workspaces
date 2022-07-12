package com.kosmo.springlegacy;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;

import di.AnnotationBean;
import di.Circle;
import di.Person;

@Controller
public class DIController {
	@RequestMapping("/di/mydi1.do")
	public ModelAndView mydi1(Model model) {

		//Model객체에 속성저장및 View 경로를 동시에 설정할 수있는 객체
		ModelAndView mv = new ModelAndView();
		//XML설정파일 위치 설정(배포시 classes하위로 이동됨)
		String configLocation = "classpath:my_di1.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		//컨테이너에 생성된 빈을 getBean() 메서드를 통해 주입받음
		Circle circle = ctx.getBean("circle", Circle.class);
		
		//경로 및 객체 저장
		mv.setViewName("04DI/mydi1");
		mv.addObject("circle", circle);

		return mv;
	}

	@RequestMapping("/di/mydi2.do")
	public ModelAndView mydi2(Model model) {
		ModelAndView mv = new ModelAndView();

		//XML설정 파일 기반으로 생성된 컨텍스트로 빈 주입
		String configLocation = "classpath:my_di2.xml";
		AbstractApplicationContext ctx = new GenericXmlApplicationContext(configLocation);
		Person person = ctx.getBean("person", Person.class);
		mv.setViewName("04DI/mydi2");
		mv.addObject("person", person.getInfo());

		return mv;
	}

	//어노테이션을 통한 빈 생성 및 주입
	@RequestMapping("/di/mydi3.do") 
	public ModelAndView mydi3(Model model) {
		ModelAndView mv = new ModelAndView();
		
		//어노테이션을 통새 생성된 빈 주입을 위해스프링 컨테이너 생성함
		AbstractApplicationContext aCtx = new AnnotationConfigApplicationContext(
		AnnotationBean.class);
		
		//메서드명을 통해 생성한 참조변수로 빈을 주입받음
		Circle circle1 = aCtx.getBean("circleBean", Circle.class); 
		Person person1 = aCtx.getBean("personBean", Person.class);
		
		mv.setViewName("04DI/mydi3"); 
		mv.addObject("person", person1.getInfo()); 
		mv.addObject("circle", circle1);
		
		return mv;
	}
}