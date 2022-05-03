package ex21jbdc.prepared;

import java.util.Scanner;

import ex21jbdc.IConnectImpl;

public class DeleteSQL extends IConnectImpl{
	
	public DeleteSQL() {
		super("kosmo","1234");
	}
	
	@Override
	public void execute() {
		try {

			String query ="delete from member where id=?";

			psmt=con.prepareStatement(query);
			psmt.setString(1, scanValue("삭제할아이디"));
			
			System.out.println(psmt.executeUpdate()+"행 삭제");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
	}

	public static void main(String[] args) {
		new DeleteSQL().execute();
	}

}
