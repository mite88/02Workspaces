package com.ds.seat;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.PrintWriter;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class AjaxQuestionController {

	//질문게시판 이미지 업로드용
	@RequestMapping(value = "QImageUpload.do", method = RequestMethod.POST)
	public void QuestionprofileUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 업로드할 폴더 경로
		String root_path = request.getSession().getServletContext().getRealPath("resources/img/question_pic");
		//String root_path ="/home/hosting_users/ijuju88/tomcat/webapps/seat/img/question_pic"; 	

		System.out.println(this.getClass().getResource("").getPath());	

		UUID uuid = UUID.randomUUID();

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = uuid.toString() + org_filename;

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = root_path+ "/" +str_filename;
		System.out.println("파일경로 :" +filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println(str_filename);
		out.close();

	}


	//불러오기
	@RequestMapping(value = "QImage.do", method = RequestMethod.GET)
	public void QuestionhomeImgTitle
	(HttpServletRequest request,HttpServletResponse response, @RequestParam("imgname") String imgname)
	{
		HttpHeaders header=new HttpHeaders();
		header.setContentType(MediaType.IMAGE_JPEG);

		try {
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;


			String root_path = request.getSession().getServletContext().getRealPath("resources/img/question_pic");
			//String root_path ="/home/hosting_users/ijuju88/tomcat/webapps/seat/img/question_pic"; 

			File file = new File (root_path+"/"+imgname);

			int size = (int) file.length();

			if ( file.exists()&& file.isFile() )
			{
				bos = new BufferedOutputStream(response.getOutputStream());
				byte b[] = new byte[2048];
				int read = 0;
				if (size > 0 && file.isFile()) {
					bis = new BufferedInputStream(new FileInputStream(file));
					while ((read = bis.read(b)) != -1) {
						bos.write(b, 0, read);
					}
				}
				bis.close();
				bos.close();

			}

		} catch (Exception e) {

		}
	}


	//질문게시판이미지 삭제
	@RequestMapping(value = "QImageDelete.do", method = {RequestMethod.GET,RequestMethod.POST})
	public void QuestionprofileDelete(@RequestParam(value="filename") String filename,HttpServletRequest request, HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");

		System.out.println("org : "+filename);

		// 업로드할 폴더 경로
		String root_path = request.getSession().getServletContext().getRealPath("resources/img/question_pic");
		//String root_path ="/home/hosting_users/ijuju88/tomcat/webapps/seat/img/question_pic"; 


		boolean delYn = true;
		//File file = new File (root_path + "/" + attach_path+"/"+filename);
		File file = new File (root_path +"/"+filename);

		System.out.println("file: "+file);
		if (file.exists()&& file.isFile() )
		{

			System.out.println("삭제준비");
			delYn=file.delete();       // 파일 삭제
		}

	}




}
