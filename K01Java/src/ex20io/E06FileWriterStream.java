package ex20io;

import java.io.*;

public class E06FileWriterStream {

	public static void main(String[] args) {
		//java는 유니코드를 기반으로저장
		//OS의 인코딩방식에 맞쳐서 문자를 텍스트 파일로 저장
		try {
			char ch1 = 'A';
			char ch2 = 'Z';
			
			//해당파일을 대상으로 문자 출력스트림생성(없을시 새로생성됨)
			Writer out = new FileWriter("src/ex20io/alpha.txt");
			
			//문자를 텍스트 파일에 기록
			out.write(ch1);
			out.write(ch2);
			out.close(); //닫음
		} catch (IOException e) {
			System.out.println("문자스트림 작업중 오류 발생");
			e.printStackTrace();
		}
		
		System.out.println("프로그램이 종료되었습니다.");
	}

}
