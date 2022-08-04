package com.kosmo.jsonrestapi;

import java.util.*;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JSONController {
	@RequestMapping("/jsonUse/jsonView.do")
	@ResponseBody
	public Map<String, Object> responseBodyView() {
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("String", "나는 문자욜");
		map.put("Number", 1004);
		map.put("Message", "JSON은 Jackson의존설정이 필요함");

		ArrayList<String> list = new ArrayList<String>();
		list.add("Collection");
		list.add("되게편함");
		list.add("배열보다 좋음");

		map.put("Collection", list);

		return map;
	}
}