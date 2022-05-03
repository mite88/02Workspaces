package shopping;

import java.sql.Types;

public class ShopDeleteGoods extends IConnectImpl{
	
	public ShopDeleteGoods() {
		super("kosmo","1234");
	}
	
	@Override
	public void execute() {
		try {
			csmt = con.prepareCall("{call ShopDeleteGoods(?, ?)}");

			csmt.setString(1, scanValue("삭제할상품의 일련번호:"));
			csmt.registerOutParameter(2, Types.INTEGER);

			csmt.execute();
			
			System.out.print("삭제 실행결과:");
			System.out.println(csmt.getInt(2));
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}

	public static void main(String[] args) {
		new ShopDeleteGoods().execute();

	}

}
