package shopping;

import java.util.Scanner;

public class SelectShop extends IConnectImpl {

	public SelectShop() {
		super("kosmo", "1234");
	}

	@Override
	public void execute() {
		try {
			String query = "select "
					+ "g_idx, goods_name, to_char(goods_price, '999,000') goods_price1, regidate, p_code "
					+ "from sh_goods where goods_name like '%'||?||'%'";

			psmt = con.prepareStatement(query);

			psmt.setString(1, scanValue("상품명"));
			rs = psmt.executeQuery();

			while (rs.next()) {
				int g_idx = rs.getInt(1);
				String goods_name = rs.getString(2);
				String goods_price = rs.getString(3);
				String regidate = rs.getString(4).substring(0, 14);
				int p_code = rs.getInt(5);

				System.out.println("================검색결과=================");
				System.out.println(g_idx + " " + goods_name + " " + goods_price + " " + regidate + " " + p_code);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
	}

	public static void main(String[] args) {
		new SelectShop().execute();
	}

}
