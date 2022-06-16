package common;

import java.io.File;
import java.io.UnsupportedEncodingException;
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

public class MailSend {
	/**
	 * SendMail
	 * @return 
	 */
	public int sendMail(String name, String toEmail, String content, String file) {
		int result =0;// 결과
		
		// 메일 인코딩
		final String bodyEncoding = "UTF-8"; // 콘텐츠 인코딩

		String fromEmail = "ijuju88@naver.com";
		String fromUsername = name;
		String subject = "메일 발송 테스트";
		//String toEmail = "받을 이메일 주소1,받을 이메일 주소2,"; // 콤마(,)로 여러개 나열

		final String username = "ijuju88";
		final String password = "Qwer!!223344";

		// 메일에 출력할 텍스트
		//StringBuffer sb = new StringBuffer();
		//sb.append("<h3>안녕하세요</h3>\n");
		//sb.append("<h4>개발하는 도치입니다.</h4>\n");
		//String html = sb.toString();

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

		try {
			// 메일 서버 인증 계정 설정
			Authenticator auth = new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(username, password);
				}
			};

			// 메일 세션 생성
			Session session = Session.getInstance(props, auth);

			// 메일 송/수신 옵션 설정
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(fromEmail, fromUsername));
			message.setRecipients(RecipientType.TO, InternetAddress.parse(toEmail, false));
			message.setSubject(subject);
			message.setSentDate(new Date());

			// 메일 콘텐츠 설정
			Multipart mParts = new MimeMultipart();
			MimeBodyPart mTextPart = new MimeBodyPart();

			// 메일 콘텐츠 - 내용
			mTextPart.setText(content, bodyEncoding, "html");
			mParts.addBodyPart(mTextPart);
			
			 /**********************************************
		     * 파일 처리. 첨부수대로 처리
		     **********************************************/
			if(file != null && file.length() > 0) {   // 파일이 첨부되었으면
				System.out.println("!!!!");
				FileDataSource fds = new FileDataSource(file);
				mTextPart.setDataHandler(new DataHandler(fds));
				mTextPart.setFileName(fds.getName()); // 파일 이름 가져오기
				mParts.addBodyPart(mTextPart); 
			}


			// 메일 콘텐츠 설정
			message.setContent(mParts);

			// MIME 타입 설정
			MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
			MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
			MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
			MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
			MailcapCmdMap.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
			MailcapCmdMap.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
			CommandMap.setDefaultCommandMap(MailcapCmdMap);

			// 메일 발송
			Transport.send(message);
			
			 result =1;

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
