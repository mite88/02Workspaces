package com.kosmo.springlegacy;

import java.io.*;
import java.util.*;

import javax.servlet.http.*;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
//파일업로드를 위한 디렉토리의 물리적경로 확인
public class FileuploadController {
	@RequestMapping("/fileUpload/uploadPath.do")
	public void uploadPath(HttpServletRequest req, HttpServletResponse resp) throws IOException {

		/*
		 * 서버의 물리적경로 얻어옴, 파일업로드를 위한 디렉토리는 정적파일 저장을 위한 resources하위에 생성
		 */
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();

		pw.print("/upload 디렉토리 물리적경로 : " + path);
	}

	// 파일업로드 폼매핑
	@RequestMapping("/fileUpload/uploadForm.do")
	public String uploadForm() {
		return "06FileUpload/uploadForm";
	}

	// 렌덤문자 및 숫자 조합 만듬
	public static String getUuid() {
		String uuid = UUID.randomUUID().toString();
		System.out.println("생성된UUID-1:" + uuid);
		uuid = uuid.replaceAll("-", "");
		System.out.println("생성된UUID-2:" + uuid);

		return uuid;
	}

	// 파일업로드
	@RequestMapping(method = RequestMethod.POST, value = "/fileUpload/uploadAction.do")
	public String uploadAction(Model model, MultipartHttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");

		// 파일 정보 저장을 위한 객체생성
		MultipartFile mfile = null;

		// 2개이상이므로 List컬랙션 생성
		List<Object> resultList = new ArrayList<Object>();
		try {
			// 제목 폼값 얻기
			String title = req.getParameter("title");
			// 업로드폼의 파일이 2개이므로 반복함
			Iterator itr = req.getFileNames();
			while (itr.hasNext()) {
				mfile = req.getFile(itr.next().toString());
				// 한글깨짐방지 처리 후 파일명가져오기
				String originalName = new String(mfile.getOriginalFilename().getBytes(), "UTF-8");

				// 파일이없으면 while의 처음으로 감
				if ("".equals(originalName))
					continue;

				// 확장자찾기
				String ext = originalName.substring(originalName.lastIndexOf('.'));
				// UUID로생성된 문자열과 확장자를 결합하여 파일명생성
				String saveFileName = getUuid() + ext;

				//물리적 경로에 새롭게 생성된 파일명으로 저장
				mfile.transferTo(new File(path + File.separator + saveFileName));

				//폼값과 파일명을 저장할 Map컬렉션 생성
				Map<String, String> fileMap = new HashMap<String, String>();
				//파일명, 새로운파일명, 제목 저장함
				fileMap.put("originalName", originalName);
				fileMap.put("saveFileName", saveFileName);
				fileMap.put("title", title);
				resultList.add(fileMap);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("resultList", resultList);
		return "06FileUpload/uploadAction";
	}

	//파일목록보기
	@RequestMapping("/fileUpload/uploadList.do")
	public String uploadList(HttpServletRequest req, Model model) {
		//물리적경로 얻기
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		
		//파일객체생성
		File file = new File(path);
		//파일의 목록을 배열형태로얻음
		File[] fileArray = file.listFiles();
		//View로 전달한 파일목록 저장을위해 Map컬랙션 생성
		Map<String, Integer> fileMap = new HashMap<String, Integer>();
		for (File f : fileArray) {

			fileMap.put(f.getName(), (int) Math.ceil(f.length() / 1024.0));
		}
		//Model객체 저장 및 View반환
		model.addAttribute("fileMap", fileMap);
		return "06FileUpload/uploadList";
	}
	
	//파일다운로드
	@RequestMapping("/fileUpload/download.do")
	public ModelAndView download(HttpServletRequest req) throws Exception {

		//저장된 파일명
		String fileName = req.getParameter("fileName");
		//원본파일명
		String oriFileName = req.getParameter("oriFileName");
		
		//물리적경로
		String saveDirectory = req.getSession().getServletContext().getRealPath("/resources/upload");
		
		//파일객체 생성 
		File downloadFile = new File(saveDirectory +"/"+fileName);
		
		//해당경로에파일 존재여부
		if(!downloadFile.canRead()) {
			throw new Exception("파일을 찾을 수 없습니다");
		}
		
		//존재시 View 및 Model 처리
		ModelAndView mv = new ModelAndView();
		//다운로드를 위해 미리 생성한 빈으로 View설정(servlet-context.xml)
		mv.setViewName("fileDownloadView");
		mv.addObject("downloadFile", downloadFile);
		mv.addObject("oriFileName", oriFileName);
		
		return mv;
	}
	

}
