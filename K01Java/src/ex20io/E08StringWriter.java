package ex20io;

import java.io.*;

public class E08StringWriter {

	public static void main(String[] args) {

		/*
		문자열을 저장하기 위한 출력스트림 생성
		문자열의 입력시 버퍼에 따라 성능차이가 커서
		버퍼 필터 스트림을 추가적으로 연결해서 사용
		*/
		try {
			BufferedWriter out = new BufferedWriter(
					new FileWriter("src/ex20io/string.txt"));
			
			//write()로 문자열 저장
			//newLine()줄바꿈:OS마다 개행문자가 달라서..
			out.write("나는 KOSMO에서 공부한다");
			out.newLine();
			out.write("수료후 꼭 취업하겠다");
			out.newLine();
			
			out.close(); //종료
			System.out.println("입력완료");
		}catch (FileNotFoundException e) {
			System.out.println("파일없음");
		}catch (IOException e) {
			System.out.println("IO오류발생");
		}

	}

}
