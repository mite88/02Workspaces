package utils;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
//js파일 넣기용 - 알림+위치이동
import javax.servlet.jsp.JspWriter;

/**
 * <pre>
 * 1. 클래스명 : JSFunction.java
 * 2. 작성일 : 2022. 5. 25.
 * 3. 작성자 : mite88
 * 4. 설명 : 
 * </pre>
 */
public class JSFunction {
	
	public static void alertLocation(String msg, String url, JspWriter out) {
        /*
         java 클래스에선 JSP내장객체 사용이 불가하여
         매개변수로 전달하여 사용(여기선 JspWriter타입으로 받은 후 사용했음)
         */
		try {
            String script = ""  
                          + "<script>"
                          + "    alert('" + msg + "');"
                          + "    location.href='" + url + "';"
                          + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    }

    public static void alertBack(String msg, JspWriter out) {
        try {
            String script = ""
                          + "<script>"
                          + "    alert('" + msg + "');"
                          + "    history.back();"
                          + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    }
    
    public static String alertMsg(String msg, JspWriter out) {
    	 String script = "";
        try {
        	script = ""
                  + "<script>"
                  + "    alert('" + msg + "');"
                  + "    history.back();"
                  + "</script>";
            out.println(script);
        }
        catch (Exception e) {}
    	 
    	return script;
    }
    
    ////////////////////////////////////////////////////////////////
    /*
    JS함수를 실행하기위해 작성하므로
    out내장객체 대신 response내장객체를 통해 컨텐츠 타입 설정 후 js코드 출력
    */
    public static void alertLocation(HttpServletResponse resp ,String msg, String url) {
     
		try {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = resp.getWriter();
            String script = ""  
                          + "<script>"
                          + "    alert('" + msg + "');"
                          + "    location.href='" + url + "';"
                          + "</script>";
            writer.println(script);
        }
        catch (Exception e) {}
    }

    public static void alertBack(HttpServletResponse resp ,String msg) {
        try {
        	resp.setContentType("text/html;charset=UTF-8");
			PrintWriter writer = resp.getWriter();
            String script = ""
                          + "<script>"
                          + "    alert('" + msg + "');"
                          + "    history.back();"
                          + "</script>";
            writer.println(script);
        }
        catch (Exception e) {}
    }
    
}

