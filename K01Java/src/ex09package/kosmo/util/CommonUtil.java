package ex09package.kosmo.util;

import java.util.Iterator;

public class CommonUtil {
	/*
	인수로 전달된 문자열을 검사하고 숫자가 아닌 문자인경우 false
	모두숫자면 true
	*/
	public static boolean isNumber(String strValue) {
		if(strValue.length() ==0) {
			return false;
		}
		
		for (int i = 0; i < strValue.length(); i++) {
			int acode = strValue.codePointAt(i);
			
			if(!(acode>='0' && acode<='9')) {
				return false;
			}
			
		}
		return true;
	}
}
