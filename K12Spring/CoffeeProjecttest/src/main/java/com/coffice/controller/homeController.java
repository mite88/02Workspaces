package com.coffice.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.Elements;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.*;
import java.text.*;

@Controller
public class homeController {
	public static HashMap<String, String> map;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		/*
		 * String clientId = "Kai3v2jX6XReVcr9kS_B"; // 애플리케이션 클라이언트 아이디값" String
		 * clientSecret = "frGPqLysK1"; // 애플리케이션 클라이언트 시크릿값"
		 * 
		 * String text = null; try { text = URLEncoder.encode("강남 파스쿠찌", "UTF-8"); }
		 * catch (UnsupportedEncodingException e) { throw new
		 * RuntimeException("검색어 인코딩 실패", e); }
		 * 
		 * String apiURL = "https://openapi.naver.com/v1/search/webkr?query=" + text; //
		 * json 결과 // String apiURL =
		 * "https://openapi.naver.com/v1/search/webkr.xml?query="+ text; // // xml 결과
		 * 
		 * Map<String, String> requestHeaders = new HashMap<>();
		 * requestHeaders.put("X-Naver-Client-Id", clientId);
		 * requestHeaders.put("X-Naver-Client-Secret", clientSecret); String
		 * responseBody = get(apiURL, requestHeaders);
		 * 
		 * System.out.println(responseBody);
		 */

		return "home";
	}
	
	
	@RequestMapping("/naverSmartEditor.do")
	public String naverSmartEditor() {
	
		return "naverSmartEditor";
	}

	@RequestMapping(value = "/naverSmartEditor.do", method = RequestMethod.POST)
	public String naverSmartEditorSubmit(HttpServletRequest req, Model model) {
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		System.out.println("title=" + title);
		System.out.println("contents=" + contents);
		
		model.addAttribute("submit", "폼값전송됨");
		return "naverSmartEditor";
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	@RequestMapping("crawling")
	public String startCrawl(Model model) throws IOException {
		// 크롤링 대상 url 지정
		String query = "이디야 가산벽산점";
		String url = "https://search.naver.com/search.naver?query=" + query;

		// String url = "https://m.place.naver.com/restaurant/1424423523/home";

		ArrayList<String> al1 = new ArrayList<>();

		try {
			// 해당 url에 connect
			Document doc = Jsoup.connect(url).get();
			// 페이지의 문서 데이터가 그대로 온 것을 볼 수 있음
			// System.out.println(doc);

			// 어느 위치에 추출하고자 하는 데이터가 있는지 미리 파악해두기
			// class : . // id : #
			Elements ele = doc.select(".sc_new .iU1XD.DFdUI");
			// 해당 태그 내용들이 추출된것을 확인할 수 있음
			// System.out.println(ele);

			// 레벨별로 분할하여 데이터 추출하는 것이 유지보수에 용이
			Iterator<Element> itr = ele.select("._2opOK > a").iterator();

			String url_text = ele.select("._2opOK > a").attr("href");
			String url_number = "";
			System.out.println(url_text);

			Pattern pattern = Pattern.compile("[/](.*?)[?c]");

			Matcher matcher = pattern.matcher(url_text);

			while (matcher.find()) { // 일치하는 게 있다면
				System.out.println(matcher.group(1));
				url_number = matcher.group(1);

				if (matcher.group(1) == null)
					break;
			}

			place_Jsoup(url_number);

			/*
			 * while (itr.hasNext()) { System.out.println(itr.next().text());
			 * al1.add(itr.next().text()); }
			 */
		} catch (IOException e) {
			e.printStackTrace();
		}

		model.addAttribute("al1", al1);
		return "news/news";
	}

	// 플레이스 전용 크롤링
	private void place_Jsoup(String bnum) {
		// 크롤링 대상 url 지정

		String url = "https://m.place.naver.com/restaurant/" + bnum;

		System.out.println("!!!!");

		ArrayList<String> al1 = new ArrayList<>();

		try {
			// 해당 url에 connect
			Document doc = Jsoup.connect(url).get();
			// 페이지의 문서 데이터가 그대로 온 것을 볼 수 있음
			// System.out.println(doc);

			// # 네이버 지도의 유형 분류
			String naver_map_type = doc.select("#_title > span._3ocDE").text();

			Elements element = doc.select("#app-root div.place_section[data-nclicks-area-code='qbr']");

			System.out.println(element.attr("data-nclicks-area-code"));

			Iterator<Element> ie1 = element.iterator();
//			Iterator<Element> ie2 = element.select("strong.title").iterator();
//			        
			while (ie1.hasNext()) {

				System.out.println(ie1.next().html());

				// System.out.println(ie1.next().text()+"\t"+ie2.next().text());
			}

			System.out.println("result:" + naver_map_type);

		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
