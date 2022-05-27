package model1.board;

import java.util.*;
import javax.servlet.ServletContext;
import common.JDBConnect;

/** 
* @PackageName   : model1.board 
* @FileName  : BoardDAO.java 
* @작성일       : 2022. 5. 27.  
* @작성자       : mite88
* @프로그램설명 : model1 게시판 DTO클래스
*/
public class BoardDAO extends JDBConnect{
	
	//DAO클래스 생성자의 부모클래스의 생성자 호출로 인한 DB연결을 위한 생성자
	public BoardDAO(ServletContext application) {
		super(application);
	}
	
	//게시물갯수 카운터를 위한 메서드(순번출력용)
	public int selectCount(Map<String, Object> map) {
		//카운터 변수
		int totalcount = 0;
		
		//쿼리문작성
		String query ="select count(*) from board ";
		
		//검색어가 있는경우 쿼리문 추가함(조건문)
		if(map.get("searchWord") != null) {
			query +=" where "+map.get("searchField")+" "
					+" like '%"+map.get("searchWord")+"%'";
		}
		
		//query문 확인
		System.out.println("selectCount:"+query);
		
		try {
			//(정적)쿼리문 실행
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next(); //해당결과는 한행뿐이기 때문에 if문을 쓰지않음
			totalcount = rs.getInt(1); //결과값 저장
		} catch (Exception e) {
			System.out.println("게시물 수를 구하는 중 예외");
			e.printStackTrace();
		}
		
		//결과값 반환
		return totalcount;
		
	}
	
	//게시물 목록출력용 메서드 - 순서보장, 2개이상이기에 List로 함
	public List<BoardDTO> selectList(Map<String, Object> map){
		//여기선 Vector썼음(보통은 ArrayList씀)
		List<BoardDTO> bbs = new Vector<BoardDTO>(); 
		
		//쿼리문 작성
		String query ="select * from board ";
		
		//검색어가 있는경우 쿼리문 추가함(조건문 + 최근글이 위로...)
		if(map.get("searchWord") != null) {
			query +=" where "+map.get("searchField")+" "
					+" like '%"+map.get("searchWord")+"%'";
		}
		query +=" order by num desc";
	
		//query문 확인
		System.out.println("selectList:"+query);
		
		try {
			//(동적)쿼리문 실행
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			
			//1개 이상일 가능성이 높으니 while문함
			while (rs.next()) {
				//하나의 레코드를 읽어 추출 후 dTO객체에 저장
				BoardDTO dto = new BoardDTO(); //DTO객체 생성
				
				//각 맴버변수에 해당 컬럼을 매칭하여 데이터에 저장함
				dto.setNum(rs.getString("num"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setPostdate(rs.getDate("postdate"));
				dto.setId(rs.getString("id"));
				dto.setVisitcount(rs.getString("visitcount"));
				
				//List컬렉션에 추가함
				bbs.add(dto);
			}
			
		} catch (Exception e) {
			System.out.println("게시물 조회 중 예외");
			e.printStackTrace();
		}
		//컬렉션반환
		return bbs;
		
	}
	
}
