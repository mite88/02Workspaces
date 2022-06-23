package common;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.activation.MailcapCommandMap;
import javax.mail.*;
import javax.mail.Message.RecipientType;
import javax.mail.internet.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;

public class MailSend {
	/**
	 SendMail
	 
	 @param application2
	 @param mr
	 @param application
	 @param saveDirectory
	 @return
	 */
	public int sendMail(HttpServletRequest req, HttpServletResponse resp, ServletContext application) {
		int result = 0;// 결과
		// 파일업로드 처리 : 물리적경로, 제한 용량, MR객체생성
		String saveDirectory = req.getServletContext().getRealPath("/Uploads/contact");
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);

		// 메일 인코딩
		final String bodyEncoding = "UTF-8"; // 콘텐츠 인코딩

		String fromEmail = "ijuju88@naver.com";
		String fromUsername = mr.getParameter("name");
		String subject = "메일 발송 테스트";
		String toEmail = mr.getParameter("emailAddress");
		// String toEmail = "받을 이메일 주소1,받을 이메일 주소2,"; // 콤마(,)로 여러개 나열

		final String username = "ijuju88";
		final String password = "Qwer!!223344";

		// 메일에 출력할 텍스트
		// StringBuffer sb = new StringBuffer();
		// sb.append("<h3>안녕하세요</h3>\n");
		// sb.append("<h4>개발하는 도치입니다.</h4>\n");
		// String html = sb.toString();

		// 메일 옵션 설정
		Properties props = new Properties();
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");

		props.put("mail.smtp.quitwait", "false");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");


		/*
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", "smtp.naver.com");
		props.put("mail.smtp.port", "465");
		props.put("mail.smtp.auth", "true");

		props.put("mail.smtp.quitwait", "false");
		props.put("mail.smtp.socketFactory.port", "465");
		props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.socketFactory.fallback", "false");
		*/

		// 메일 서버 인증 계정 설정

		Authenticator auth = new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		};

		// 메일 세션 생성
		Session session = Session.getInstance(props, auth);

		MimeMessage msg = new MimeMessage(session);


		try {
			// 발신자, 수신자, 참조자, 제목, 본문 내용 등을 설정한다
		    msg.setFrom(new InternetAddress(fromEmail, fromUsername));
		    msg.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
		    msg.setSubject(subject);
		    msg.setSentDate(new Date());
			
		    MimeMultipart multipart = new MimeMultipart();
		    
		    MimeBodyPart part = new MimeBodyPart();

		    part.setContent("이메일 발송자 : "+toEmail+"<br><br>"+mr.getParameter("message")
		    .replace("\r\n", "<br>"), "text/html; charset=utf-8");
		    multipart.addBodyPart(part);
		    
		    File file = mr.getFile("file");
			String filename = file.getName();
			System.out.println(filename);		

		    part = new MimeBodyPart();
		    
		    
			System.out.println("!!!!");
			 
		    FileDataSource fds = new FileDataSource(file);
		    part.setDataHandler(new DataHandler(fds));
		    part.setFileName(MimeUtility.encodeText(filename, bodyEncoding,"B")); 
		    multipart.addBodyPart(part);
		    
		    msg.setContent(multipart);
		    
		    // MIME 타입 설정
 			MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
 			MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
 			MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
 			MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
 			MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
 			MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
 			CommandMap.setDefaultCommandMap(MailcapCmdMap);
		 
		    // 메일을 발신한다
		    Transport.send(msg);
		    System.out.println("Success Message Send");
		    
		    FileUtil.deleteFile(req, "/Uploads/contact", filename);

			result = 1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		

		return result;
	}

}
