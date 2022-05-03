package shopping;

import java.sql.Types;

public class UpdateShop extends IConnectImpl{
	
	public UpdateShop() {
		super("kosmo","1234");
	}
	
	@Override
	public void execute() {
		try {
			csmt = con.prepareCall("{call ShopUpdateGoods(?, ?, ?, ?, ?)}");

			csmt.setString(4, scanValue("수정할상품의 일련번호:"));
			csmt.setString(1, scanValue("제품명:"));
			csmt.setString(2, scanValue("제품가격:"));
			csmt.setString(3, scanValue("제품코드:"));

			csmt.registerOutParameter(5, Types.INTEGER);

			csmt.execute();
			
			System.out.print("수정 실행결과:");
			System.out.println(csmt.getInt(5));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}

	public static void main(String[] args) {
		new UpdateShop().execute();
	}

}
