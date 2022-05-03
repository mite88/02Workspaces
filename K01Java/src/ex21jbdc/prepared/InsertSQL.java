package ex21jbdc.prepared;

import java.util.Scanner;

import ex21jbdc.IConnectImpl;

public class InsertSQL extends IConnectImpl{
	
	public InsertSQL() {
		super(ORACLE_DRIVER, "kosmo","1234");
	}
	
	@Override
	public void execute() {
		try {
			//값의 세팅이 필요한 부분을 ?(인파라미터)로 대체
			String query ="insert into member values (?, ? , ?, ?)";
			
			//prepared객체 생성 : 생성시 준비한 쿼리문을 인수로 전달
			psmt=con.prepareStatement(query);
			
			//입력내용 받기
			Scanner scan = new Scanner(System.in);
			System.out.print("아이디:");
			String id = scan.nextLine();
			System.out.print("비 번:");
			String pw = scan.nextLine();
			System.out.print("이 름:");
			String name = scan.nextLine();
			
			//인파라미터저장 : ?에 순서대로 설정(index는 1부터) 
			psmt.setString(1, id);
			psmt.setString(2, pw);
			psmt.setString(3, name);
			//날짜입력1 : 문자열로 날짜입력하는 경우
			//psmt.setString(4, "2018-11-20");
			
			//날짜입력2 : Date형으로 입력, 변환과정을 거친 후 넣어야함
			java.util.Date utilDate = new java.util.Date();
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			psmt.setDate(4, sqlDate);
			
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
		new InsertSQL().execute();
	}

}
