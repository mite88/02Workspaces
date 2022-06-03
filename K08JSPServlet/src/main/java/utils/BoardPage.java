package utils;

public class BoardPage {
	/*
	int totalCount : 총게시물수
	int pageSize : 현페이지 게시물수(web.xml - POSTS_PER_PAGE)
	int blockPage : 한블럭당 페이지 번호(web.xml - PAGES_PER_BLOCK)
	int pageNum : 현페이지번호
	String reqUrl : 게시판 목록실행 한 파일경로
	 */
	public static String pageingStr(int totalCount, int pageSize,
			int blockPage, int pageNum, String reqUrl, String searchField, String searchWord) {
		
		String pageingStr = "";
		
		//페이지수 계산
		int totalPages = (int)(Math.ceil( ((double) totalCount / pageSize )));
		
		//이전 페이지 블록 바로가기 링크 출력
		/*
		 현 페이지가 1페이지면
		 ((( 1-1 ) / 5 ) * 5) + 1 = 1
		 
		 현 페이지가 5페이지면
		 ((( 5-1 ) / 5 ) * 5) + 1 = 1
		 
		  현 페이지가 6페이지면
		 ((( 6-1 ) / 5 ) * 5) + 1 = 6
		*/
		int pageTemp = (((pageNum -1) / blockPage) * blockPage) +1;
		
		/*
		pageTemp가 1이 아닐때만 이전블록으로 바로가기 링크를 화면에 출력함
		 * */
		if(pageTemp != 1) {
			pageingStr += "<li class='page-item'>";
			if(searchWord != null && searchWord !="") {
				pageingStr +="<a class='page-link' href='"+reqUrl+"?pageNum=1&searchField="+searchField+"&searchWord="+searchWord+"'>[첫페이지]</a>";
			}else {
				pageingStr +="<a class='page-link' href='"+reqUrl+"?pageNum=1'>[첫페이지]</a>";
			}
			
			pageingStr +="</li>";
			pageingStr += "<li class='page-item'>";
			if(searchWord != null && searchWord !="") {
				pageingStr +="<a class='page-link' href='"+reqUrl+"?pageNum="+(pageTemp - 1)+
						"&searchField="+searchField+"&searchWord="+searchWord+"'>[이전블록]</a>";
			}else {
				pageingStr +="<a class='page-link' href='"+reqUrl+"?pageNum="+(pageTemp - 1)+"'>[이전블록]</a>";
			}
			
			pageingStr +="</li>";
		}
		
		/*
		각 페이지 번호로 바로가기 링크 출력
		
		앞에서 계산한 pageTemp를 blockPage만큼 반복하여 출력
		*/
		int blockCount = 1;
		while (blockCount <= blockPage &&  pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				//현페이지일때는 링크 안걸리게 해놓음
				pageingStr += "<li class='page-item active'>";
				//pageingStr += ""+pageTemp+"";
				if(searchWord != null && searchWord !="") {
					pageingStr += "<a class='page-link ' href='"+reqUrl+"?pageNum="+pageTemp
						+"&searchField="+searchField+"&searchWord="+searchWord+"'>"+pageTemp+"</a>";
				}else {
					pageingStr += "<a class='page-link ' href='"+reqUrl+"?pageNum="+pageTemp+"'>"+pageTemp+"</a>";
				}
				
				pageingStr +="</li>";
			}else {
				//현 페이지가 아닐때 링크 걸기
				pageingStr += "<li class='page-item'>";
				if(searchWord != null && searchWord !="") {
					pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+pageTemp
							+"&searchField="+searchField+"&searchWord="+searchWord+"'>"+pageTemp+"</a>";
				}else {
					pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+pageTemp+"'>"+pageTemp+"</a>";
				}
				
				pageingStr +="</li>";
			}
			
			pageTemp++;
			blockCount++;
		}
		
		//다음페이지 블록 바로가기 링크 출력
		if(pageTemp <= totalPages) {
			pageingStr += "<li class='page-item'>";
			if(searchWord != null && searchWord !="") {
				pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+pageTemp
					+"&searchField="+searchField+"&searchWord="+searchWord+"'>[다음블록]</a>";
			}else {
				pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+pageTemp+"'>[다음블록]</a>";
			}
			
			pageingStr +="</li>";
			
			pageingStr += "";
			
			pageingStr += "<li class='page-item'>";
			if(searchWord != null && searchWord !="") {
				pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+totalPages
						+"&searchField="+searchField+"&searchWord="+searchWord+"'>[마지막페이지]</a>";
			}else {
				pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+totalPages+"'>[마지막페이지]</a>";
			}
			
			pageingStr +="</li>";
		}
	
		return pageingStr;
	}
}
