import utils.AES256;
import utils.SHA256;

public class test_main {

    public static void main(String[] args) throws Exception {

    	 SHA256 sha256 = new SHA256();
         
         //비밀번호
         String password = "hi12345678";
         //SHA256으로 암호화된 비밀번호
         String cryptogram = sha256.encrypt(password);
         
         System.out.println(cryptogram);
         
         //비밀번호 일치 여부
         System.out.println(cryptogram.equals(sha256.encrypt(password)));
    	
         System.out.println("======================================");
         
    	AES256 aes256 = new AES256();
        String text = "!! Hello World !!";
        String cipherText = aes256.encrypt(text);
        System.out.println(text);
        System.out.println(cipherText);
        System.out.println(aes256.decrypt(cipherText));

    }

}