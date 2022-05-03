package ex21jbdc.prepared;

import java.util.Scanner;

import ex21jbdc.IConnectImpl;

public class SelectSQL extends IConnectImpl{
	
	public SelectSQL() {
		super(ORACLE_DRIVER, "kosmo","1234");
	}
	
	@Override
	public void execute() {

		String sql ="select * from member where name like '%'||?||'%'";
		try {

			psmt=con.prepareStatement(sql);
			
			psmt.setString(1, scanValue("찾는이름"));
			rs = psmt.executeQuery();
			
			//사용자로부터 입력받아 exit할때까지 실행됨
			while (rs.next()) {
				String id= rs.getString(1);
				String pass= rs.getString(2);
				String name= rs.getString(3);
				String regidate = rs.getString(4).substring(0, 10);
				
				System.out.printf("%s %s %s %s\n", id, pass, name, regidate);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}

	public static void main(String[] args) {
		new SelectSQL().execute();
	}

}
