package com.kosmo.websocket;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class homeController {
	public static HashMap<String, String> map;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {

		return "home";
	}

	@RequestMapping(value = "/Notification/01WebNoti.do", method = RequestMethod.GET)
	public String webNoti() {

		return "02Notification/01WebNoti";
	}

	// 웹소켓채팅
	@RequestMapping(value = "/Notification/02WebSocket.do", method = RequestMethod.GET)
	public String webSocket() {
		return "02Notification/02WebSocket";
	}

	@RequestMapping(value = "/Notification/02WebChat.do", method = RequestMethod.GET)
	public String webChat() {

		return "02Notification/02WebChat";
	}

	@RequestMapping(value = "/Notification/02WebChatur.do", method = RequestMethod.GET)
	public String webChatUI() {
		return "O2Notification/02WebChatUI";
	}

	// 웹소켓+웹노트
	@RequestMapping(value = "/Notification/03SendMain.do", method = RequestMethod.GET)
	public String webMain() {
		return "02Notification/03SendMain";
	}

	@RequestMapping(value = "/Notification/03SendMessage.do", method = RequestMethod.GET)
	public String webMessage(HttpSession session, HttpServletRequest req) {
		
		//파리미터사용
		session.setAttribute("chat_id", req.getParameter("char_id"));
		session.setAttribute("chat_room", req.getParameter("chat_room"));
		
		return "02Notification/03SendMessage";
	}

}
