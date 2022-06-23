package fileupload;

import java.io.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class FileUtil {

	// 파일업로드 처리
	public static MultipartRequest uploadFile(HttpServletRequest req, String saveDirectory, int maxPostSize) {
		try {
			/*
			 * 앞에서 준비한 인수를 매개변수로 전달하여 MultipartRequest객체를 생성 객체가 정상적으로 생성되며 파일업로드가 됨 예외시 보통
			 * 최대용량 혹은 물리적경로명이 잘못지정된 경우임
			 */
			// 내장객체, 물리적경로, 용량 제한 , 인코딩
			return new MultipartRequest(req, saveDirectory, maxPostSize, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	public static void download(HttpServletRequest req, HttpServletResponse resp, 
			String diretory, String sfileName, String ofileName) {

		String sDirectory = req.getServletContext().getRealPath(diretory);
		try {

			File file = new File(sDirectory, sfileName);
			// 파일의 내용을 읽어오기 위한 입력스트림 생성
			InputStream inStream = new FileInputStream(file);

			// 사용자의 웹브라우저 종류를 알아내기 위해 요청헤더를 얻어온다.
			String client = req.getHeader("User-Agent");
			
			if (client.indexOf("WOW64") == -1) {
				// 인터넷 익스플로러가 아닌경우 한글파일명 인코딩
				ofileName = new String(ofileName.getBytes("UTF-8"), "ISO-8859-1");
			} else {
				// 인터넷 익스플로러 일때 한글파일명 인코딩
				ofileName = new String(ofileName.getBytes("KSC5601"), "ISO-8859-1");
			}
			/*
			 * 위 처리를 통해 원본파일명이 한글인 경우 깨짐을 방지할수 있다. getBytes() : String객체를 byte형의 배열로 반환해준다.
			 */

			/*
			 * 파일 다운로드를 위한 응답 헤더 설정 1. 응답헤더 초기화 2. 웹브라우저가 인식하지 못하는 컨텐츠 타입을 설정하여 다운로드 창을 강제로
			 * 띄우게 함. 3. 파일명을 변경하기 위한 응답헤더를 설정하고 파일사이즈도 설정한다.
			 */
			resp.reset();
			resp.setContentType("application/octet-stream");
			resp.setHeader("Content-Disposition", "attachment; filename=\"" + ofileName + "\"");
			resp.setHeader("Content-Length", "" + file.length());

			//out.clear(); // 새로운 출력스트림을 생성하기 위해 초기화
			
			// 새로운 출력스트림을 생성해서 파일을 내보낸다.
			OutputStream oStream = resp.getOutputStream();
			
			byte b[] = new byte[(int) file.length()];
			int readBuffer = 0;
			while ((readBuffer = inStream.read(b)) > 0) {
				oStream.write(b, 0, readBuffer);
			}
			// 입출력 스트림을 닫아준다.(자원해제)
			inStream.close();
			oStream.close();
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("예외가 발생하였습니다.");
			e.printStackTrace();
		}

	}
	
	
	//파일삭제
	public static void deleteFile(HttpServletRequest req, String diretory, String filename) {
		//디렉토리의 절대경로 얻기
		String sDirectory = req.getServletContext().getRealPath(diretory);
		
		//물리적경로와 파일명으로File 객체생성
		//separator: 운영체제에서사용하는 경로의 구분기호자동삽입
		File file = new File(sDirectory+File.separator+filename);
		
		//파일존재시 삭제
		if(file.exists()) {
			System.out.println("file delete");
			file.delete();
		}
		
	}
	
}
