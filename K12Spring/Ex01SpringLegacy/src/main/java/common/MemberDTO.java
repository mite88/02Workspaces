package common;

import javax.validation.constraints.Size;
import org.hibernate.validator.constraints.NotEmpty;

public class MemberDTO {
	@NotEmpty(message = "필수 입력 값입니다.")
	private String name;
	@NotEmpty(message = "필수 입력 값입니다.")
	//@Size(min = 8, max = 20, message = "8자 이상 20자 이하로 입력해주세요.")
	private String id;
	@NotEmpty(message = "필수 입력 값입니다.")
	private String pw;
	private  String email;

	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
}
