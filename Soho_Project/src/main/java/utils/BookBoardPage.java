package utils;
	
	/*
	int totalCount : 총 게시물의 갯수
	int pageSize : 한 페이지에 출력할 게시물의 갯수(web.xml에 POSTS_PER_PAGE로 저장됨)
	int blockPage : 한 블럭당 출력할 페이지번호의 갯수(web.xml에 PAGES_PER_BLOCK로 저장됨)
	int pageNum : 현재 진입한 목록의 페이지 번호(최초 진입시에는 무조건 1페이지)
	String reqUrl : 게시판 목록을 실행한 JSP파일 경로(request.getRequestURI()을 통해 경로를 얻어온다.)
	 */
public class BookBoardPage {
	public static String pageingStr(int totalCount, int pageSize,
			int blockPage, int pageNum, String reqUrl, String searchField, String searchWord) {
		
		String pageingStr = "";
		
		//전체 페이지수를 계산한다.
		int totalPages = (int)(Math.ceil(((double) totalCount/ pageSize)));
		
		/*
		이전 페이지 블록 바로가기 링크 출력
		 현재 1페이지라 가정하면 
		 	(((1-1) / 5) * 5) + 1 = 1
		 현재 5페이지라 가정하면 
		 	(((5-1) / 5) * 5) + 1 = 1
		 현재 6페이지라 가정하면 
		 	(((6-1) / 5) * 5) + 1 = 6
		 현재 11페이지라 가정하면 
		 	(((11-1) / 5) * 5) + 1 = 11
		*/
		int pageTemp = (((pageNum-1)/ blockPage)* blockPage)+ 1;
		
		System.out.println(totalPages+"/"+blockPage);
		/*
		pageTemp가 1이 아닐때만, 즉 첫번째 블럭이 아닐때만 이전블록으로 
		바로가기 링크를 화면에 출력한다. 
		*/
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
		
		//각 페이지 번호로 바로가기 링크 출력
		//앞에서 계산한 pageTemp를 blockPage만큼 반복해서 출력한다.
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

	//관리자 페이징
	public static String pageingStr(int totalCount, int pageSize,
			int blockPage, int pageNum, String reqUrl, String type, String searchField, String searchWord) {
		
		String pageingStr = "";
		
		//전체 페이지수를 계산한다.
		int totalPages = (int)(Math.ceil(((double) totalCount/ pageSize)));
		
		/*
		이전 페이지 블록 바로가기 링크 출력
		 현재 1페이지라 가정하면 
		 	(((1-1) / 5) * 5) + 1 = 1
		 현재 5페이지라 가정하면 
		 	(((5-1) / 5) * 5) + 1 = 1
		 현재 6페이지라 가정하면 
		 	(((6-1) / 5) * 5) + 1 = 6
		 현재 11페이지라 가정하면 
		 	(((11-1) / 5) * 5) + 1 = 11
		*/
		int pageTemp = (((pageNum-1)/ blockPage)* blockPage)+ 1;
		
		System.out.println(totalPages+"/"+blockPage);
		/*
		pageTemp가 1이 아닐때만, 즉 첫번째 블럭이 아닐때만 이전블록으로 
		바로가기 링크를 화면에 출력한다. 
		*/
		if(pageTemp != 1) {
			pageingStr += "<li class='page-item'>";
			if(searchWord != null && searchWord !="") {
				pageingStr +="<a class='page-link' href='"+reqUrl+"?pageNum=1&type="+type+"&searchField="+searchField+"&searchWord="+searchWord+"'>[첫페이지]</a>";
			}else {
				pageingStr +="<a class='page-link' href='"+reqUrl+"?pageNum=1&type="+type+"'>[첫페이지]</a>";
			}
			
			pageingStr +="</li>";
			pageingStr += "<li class='page-item'>";
			if(searchWord != null && searchWord !="") {
				pageingStr +="<a class='page-link' href='"+reqUrl+"?pageNum="+(pageTemp - 1)+
						"&type="+type+"&searchField="+searchField+"&searchWord="+searchWord+"'>[이전블록]</a>";
			}else {
				pageingStr +="<a class='page-link' href='"+reqUrl+"?pageNum="+(pageTemp - 1)+"&type="+type+"'>[이전블록]</a>";
			}
			
			pageingStr +="</li>";
		}
		
		//각 페이지 번호로 바로가기 링크 출력
		//앞에서 계산한 pageTemp를 blockPage만큼 반복해서 출력한다.
		int blockCount = 1;
		while (blockCount <= blockPage &&  pageTemp <= totalPages) {
			if(pageTemp == pageNum) {
				//현페이지일때는 링크 안걸리게 해놓음
				pageingStr += "<li class='page-item active'>";
				//pageingStr += ""+pageTemp+"";
				if(searchWord != null && searchWord !="") {
					pageingStr += "<a class='page-link ' href='"+reqUrl+"?pageNum="+pageTemp+"&type="+type
						+"&searchField="+searchField+"&searchWord="+searchWord+"'>"+pageTemp+"</a>";
				}else {
					pageingStr += "<a class='page-link ' href='"+reqUrl+"?pageNum="+pageTemp+"&type="+type+"'>"+pageTemp+"</a>";
				}
				
				pageingStr +="</li>";
			}else {
				//현 페이지가 아닐때 링크 걸기
				pageingStr += "<li class='page-item'>";
				if(searchWord != null && searchWord !="") {
					pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+pageTemp+"&type="+type
							+"&searchField="+searchField+"&searchWord="+searchWord+"'>"+pageTemp+"</a>";
				}else {
					pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+pageTemp+"&type="+type+"'>"+pageTemp+"</a>";
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
				pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+pageTemp+"&type="+type
					+"&searchField="+searchField+"&searchWord="+searchWord+"'>[다음블록]</a>";
			}else {
				pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+pageTemp+"&type="+type+"'>[다음블록]</a>";
			}
			
			pageingStr +="</li>";
			
			pageingStr += "";
			
			pageingStr += "<li class='page-item'>";
			if(searchWord != null && searchWord !="") {
				pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+totalPages+"&type="+type
						+"&searchField="+searchField+"&searchWord="+searchWord+"'>[마지막페이지]</a>";
			}else {
				pageingStr += "<a class='page-link' href='"+reqUrl+"?pageNum="+totalPages+"&type="+type+"'>[마지막페이지]</a>";
			}
			
			pageingStr +="</li>";
		}
		return pageingStr;
	}
	
}
