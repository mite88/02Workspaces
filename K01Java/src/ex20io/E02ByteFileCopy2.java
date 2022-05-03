package ex20io;

import java.io.*;
/*
스트림(Stream)
IO모델에 핵심개념
'데이터의 흐름을 형성하는 통로'
입력(Input)과 출력(output)스트림이 있음
*/
public class E02ByteFileCopy2 {

	public static void main(String[] args) {
		InputStream in = null;
		OutputStream out = null;
		int copyByte = 0;
		
		/*
		 IO관련작업시 예외처리가 많이 필요함(try~catch)
		 - 예외 무시로 하면 문제 시 조치가 힘듬
		 */
		
		try {
			//원본파일 읽어오는 입력스트림 생성
			in = new FileInputStream("src/ex20io/D2Coding-Ver1.3.2-20180524.zip");
			
			//복사분을 만들기 위한 출력스트림 생성
			out = new FileOutputStream("src/ex20io/D2Coding-Ver1.3.2-20180524_copy.zip");
			
			int bData;//1byte당 저장하기위한 변수

			while (true) {
				//원본파일에서 1byte 읽음
				bData = in.read();
				
				if(bData == -1 ) {
					break;
				}
				//복사본 출력
				out.write(bData);
				copyByte++; //몇바이트읽었는지 알기위해 1byte 당 1증가
			}
			
		}catch (FileNotFoundException e) {
			System.out.println("파일이 존재하지 않습니다.");
		}catch (IOException e) {
			System.out.println("파일스트림 생성시 오류 발생");
		}
		
		//무조건 실행 :  스트림 닫기
		finally {
			try {
				in.close();
				out.close();
				
				System.err.println("복사된 KByte 크기:"+
				(copyByte/1024));
			} catch (IOException e2) {
				System.out.println("파일스트림 닫기오류");
			}
		}
		
		
	}

}
