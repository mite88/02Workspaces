package utils;
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
    
    
    
}

