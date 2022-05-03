package ex20io;

import java.io.*;
/*
1kb(1024byte)씩 읽을 수 있는 buffer을 이용하여 복사속도 향상
스트림 혹인 네트워크를 통해 파일 전송시 버퍼를 사용하는이유는
속도차 
*/
public class E01ByteFileCopy {

	public static void main(String[] args) {
		InputStream in = null;
		OutputStream out = null;
	
		try {
			//원본파일 읽어오는 입력스트림 생성
			in = new FileInputStream("src/ex20io/D2Coding-Ver1.3.2-20180524.zip");
			
			//복사분을 만들기 위한 출력스트림 생성
			out = new FileOutputStream("src/ex20io/D2Coding-Ver1.3.2-20180524_copy_1.zip");
			
			//복사된크기, 한번에 읽어올 크기 지정
			int copyByte = 0;
			int readLen;
			
			//1kb씩 읽기 위해 버퍼 생성함
			byte buffer[] = new byte[1024];

			while (true) {
				//배열 크기(1kb)씩 파일 읽기
				readLen = in.read(buffer);
				
				if(readLen == -1 ) {
					break;
				}
				//읽어온 내용을 파일에 입력
				//버퍼에 저장된 데이터를 인덱스0위치에 readLen 만큼 전송함
				out.write(buffer, 0 , readLen);
				copyByte += readLen;

			}	
			
			if(in != null)in.close();
			if(out != null)out.close();
			
			System.out.println("복사된 파일 크기 : "+
			copyByte+"byte");
			System.out.println("복사된 파일 크기 : "+
			(copyByte/1024)+"KByte");
			System.out.println("복사된 파일 크기 : "+
					(copyByte/(1024*1024))+"MByte");
				
			
			
		}catch (FileNotFoundException e) {
			System.out.println("파일이 존재하지 않습니다.");
		}catch (IOException e) {
			System.out.println("파일스트림 생성시 오류 발생");
		}
		
		
	}

}
