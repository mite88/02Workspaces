package utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//쿠키관련 함수들 만들기
/**
 * <pre>
 * 1. 클래스명 : CookieManager.java
 * 2. 작성일 : 2022. 5. 25.
 * 3. 작성자 : mite88
 * 4. 설명 : 
 * </pre>
 */

public class CookieManager {
    //쿠키생성(response 내장객체사용)
    public static void makeCookie(HttpServletResponse response, String cName,
            String cValue, int cTime) {
        Cookie cookie = new Cookie(cName, cValue);
        cookie.setPath("/");
        cookie.setMaxAge(cTime);
        response.addCookie(cookie);
    }

    //쿠키읽기(request 내장객체사용)
    public static String readCookie(HttpServletRequest request, String cName) {
        String cookieValue = "";   
        //쿠키 배열로 얻기
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
        	//쿠키 갯수만큼 반복함
            for (Cookie c : cookies) {
            	//쿠키명 얻기
                String cookieName = c.getName();
                if (cookieName.equals(cName)) {
                	//해당 쿠키 출력
                    cookieValue = c.getValue();
                }
            }
        }
        return cookieValue; 
    }

    //쿠키삭제(시간을 0으로 하여 삭제함)
    public static void deleteCookie(HttpServletResponse response, String cName) {
        makeCookie(response, cName, "", 0);
    }
}

