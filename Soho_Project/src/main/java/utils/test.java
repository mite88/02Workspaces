package utils;

public class test {
	
	public static void main(String[] args) {
		AES256 aes = new AES256();
		try {
			System.out.println(aes.encrypt("1111"));

			} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
