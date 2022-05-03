package ex20io;

import java.io.*;
import java.util.Iterator;

public class E07FileReaderStream {

	public static void main(String[] args) {
		try {
			//버퍼로 사용할 char형 배열 생성
			char[] cbuf = new char[10];
			int readCnt;
			
			//대상파일로 문자입력 스트림 생성함
			Reader in = new FileReader("src/ex20io/alpha.txt");
			//배열cbuf의 앞에서부터 최대 10개의 문자를 읽어 저장
			readCnt = in.read(cbuf, 0, 10);
			
			//읽어온 내용출력
			for (int i = 0; i < readCnt; i++) {
				System.out.println(cbuf[i]);
			}
			
			in.close();
			
		}catch (FileNotFoundException e) {
			System.out.println("파일없음");
		}catch (IOException e) {
			System.out.println("IO오류발생");
		}

	}

}
