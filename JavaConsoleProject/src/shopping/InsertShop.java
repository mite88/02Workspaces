package shopping;

import java.util.Scanner;

public class InsertShop extends IConnectImpl{
	
	public InsertShop() {
		super("kosmo","1234");
	}

	@Override
	public void execute() {
		try {
			String query ="insert into sh_goods values (seq_total_idx.nextval, ? , ?, sysdate, ?)";
			
			psmt=con.prepareStatement(query);
			
			Scanner scan = new Scanner(System.in);
			System.out.print("상품명:");
			String goods_name = scan.nextLine();
			System.out.print("상품가격:");
			int goods_price = scan.nextInt();
			System.out.print("상품코드:");
			int p_code = scan.nextInt();
			
			psmt.setString(1, goods_name);
			psmt.setInt(2, goods_price);
			psmt.setInt(3, p_code);
			
			//쿼리실행 후 결과값 반환
			int affected = psmt.executeUpdate();
			System.out.println(affected+"행 입력");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}
	
	public static void main(String[] args) {
		new InsertShop().execute();
		
	}

}
