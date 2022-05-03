package ex20io;

import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

public class E03FilterDataStream {

	public static void main(String[] args) {
		//필터스트림을 통해 정수를 저장할 바이너리파일 경로 선언
		String src ="src/ex20io/FilterdataStream.bin";
		
		try {
			//파일생성을 위한 출력스트림 생성
			OutputStream out = new FileOutputStream(src);
			//파일스트림 내용조합용 필터스트림생성
			DataOutputStream filterOut = new DataOutputStream(out);
			
			/*
			 앞에서 생성한 출력스트림에 필터스트림추가 후 연결 : write()
			
			바이트단위로 분리되어 4byte 혹은 48byte로 전송
			 */
			filterOut.writeInt(123);
			filterOut.writeDouble(12.34);
			filterOut.writeInt(456);
			filterOut.writeDouble(56.78);
			
			//////-------여기까지하면 bin파일생성-------/////
			
			//파일내용읽기위한 입력 및 필터입력스트림 연결
			//필터스트림으로 인해 byte단위가 아닌 기본자료형 단위로 데이터읽음
			DataInputStream filterIn = 
					new DataInputStream(new FileInputStream(src));
			
			int num1 = filterIn.readInt();
			double dNum1 = filterIn.readDouble();
			int num2 = filterIn.readInt();
			double dNum2 = filterIn.readDouble();
			
			//파일출력
			System.out.println("num1 ="+num1);
			System.out.println("dNum1 ="+dNum1);
			System.out.println("num2 ="+num2);
			System.out.println("dNum2 ="+dNum2);
			
			//스트림소멸
			if(filterOut != null)filterOut.close();
			if(filterIn != null)filterIn.close();
			
		}catch (FileNotFoundException e) {
			System.out.println("해당파일없음");
		}catch (IOException e) {
			System.out.println("IO오류발생");
		}
	}

}
