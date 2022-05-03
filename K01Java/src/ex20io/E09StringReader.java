package ex20io;

import java.io.*;

public class E09StringReader {

	public static void main(String[] args) {
		try {
			BufferedReader in  = new BufferedReader(	
					new FileReader("src/ex20io/string.txt"));
			
			String str;
			
			while (true) {
				//줄바꿈 등장전까지 데이터를 한번에 읽어옴
				str = in.readLine();
				
				//글이 더이상없을때까지 출력하기위한거
				if(str == null) {
					break;
				}
				/*
				 readLine()을 통해 개행정보까지 읽은것이지 
				 개행을 출력한건 아니기에 println()을함
				 */
				System.out.println(str);
				
			}
			
			in.close();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

	}

}
