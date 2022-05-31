<%--
/**
 * 1. 프로젝트명 :  List.jsp
 * 2. 작성일 : 2022. 5. 27. 오후 4:43:42
 * 3. 작성자 : mite88
 * 4. 설명 :  Model1 게시판 리스트
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 5. 27.    mite88   
 */
--%>

<%@page import="utils.BoardPage"%>
<%@page import="java.util.*"%>
<%@page import="model1.board.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
//DAO객체 생성을 통해 DB접속 
//application내장객체를 전달하여 web.xml 컨텍스트초기화
BoardDAO dao = new BoardDAO(application);

//검색관련처리

//검색어가 존재하는 경우 파라미터 저장을 위해 Map계열의 컬랙션 생성
Map<String, Object> param = new HashMap<String, Object>();
//파라미터 받기
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");

//여기선 select는 기본값이 존재하기때문에 searchWord로 null체크를함
if(searchWord != null){
	//검색테이블의 컬럼명 
	param.put("searchField", searchField);
	//검색어
	param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param); //게시물수

/*페이징 start**********************************************************/
//파라미터를 얻은후 사칙연산을 위해 정수로 변환
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
//전체 페이지 계산
int totalPage = (int)Math.ceil((double)totalCount / pageSize);

/*
목록에 첫 진입시 페이지 관련 파라미터가 없기에
1페이지로 지정하고
pageNum이 존재하는경우 파라미터를 읽어 페이지 번호를 지정함

List.jsp : 파라미터 없음
List.jsp?pageNum= : 파라미터는 있지만 값이 없음
*/
int pageNum = 1;
String pageTemp = request.getParameter("pageNum");
if(pageTemp != null && !pageTemp.equals("")){
	pageNum = Integer.parseInt(pageTemp);
}

//게시물의 구간 계산
int start = (pageNum - 1) * pageSize + 1; //시작번호
int end = pageNum * pageSize; //종료번호
//계산된 값을 DAO로 전달하기위해 Map컬렉션에 저장
param.put("start", start);
param.put("end", end);

/*페이징 end************************************************************/
List<BoardDTO> boardLists = dao.selectListstPage(param); //리스트
dao.close(); //자원해제
%>
<title>회원제 게시판</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<div class="container">
		<jsp:include page="../Common/Link.jsp" />

		<h2>목록보기(List) - 현재페이지 : <%= pageNum%> (전체 : <%= totalPage%>)</h2>

		<!-- form태그에 action속성이 존재하지 않을 시 폼값이 현재페이지로 전송됨 -->
		<form method="get">
			<table class="table">
				<tr>
					<td align="center" class="input-group mb-3">
						<select class="form-select" name="searchField" id="">
								<option value="title">제목</option>
								<option value="content">내용</option>
						</select> 
						<input class="form-control" style="flex: 4;" type="text" name="searchWord" /> 
						<input class="btn btn-outline-secondary" type="submit" value="검색하기" />
					</td>
				</tr>
			</table>
		</form>
		
		<!-- 게시물 목록 테이블 -->
		<table class="table table-border">
			<!-- 칼럼명 -->
			<tr align="center">
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>작성일</th>
			</tr>
			<%
			//(List컬렉션내용)게시물 없을때 출력
			if(boardLists.isEmpty()){
			%>
			<tr>
				<td colspan="5" align="center">
					등록된 게시물이 없습니다.
				</td>
			</tr>
			<%
			}else{
				//게시물 존재 시 출력
			  	int virtualNum = 0; //게시물 출력번호용
			  	int countNum = 0;
			  	
			  	//게시판 갯수만큼 반복
			    for (BoardDTO dto : boardLists)
			    {
			    	//현 페이지 번호를 적용할 가상번호 계산
			    	virtualNum = totalCount - (((pageNum -1) * pageSize) + countNum++);
			    	//전체레코드 수를 감소시키면서 리스트에 출력
			        //virtualNum = totalCount--;  
			%>
			        <tr align="center">
			            <td><%= virtualNum %></td>  
			            <td align="left"> 
			                <a href="View.jsp?num=<%= dto.getNum() %>"><%= dto.getTitle() %></a> 
			            </td>
			            <td align="center"><%= dto.getId() %></td>           
			            <td align="center"><%= dto.getVisitcount() %></td>   
			            <td align="center"><%= dto.getPostdate() %></td>    
			        </tr>
			<%
			    }
			}
			%>
    	</table>
   
	    <table class="table">
	    	<tr align="center">
	            <td>
	            	<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<!--  
	            request.getRequestURI()
	            request내장 객체를 통해 현 페이지의 host부분을 빼고 나머지 경로명 얻음 
	            -->
							<%=BoardPage.pageingStr(totalCount, pageSize, blockPage, pageNum,request.getRequestURI(), 
									request.getParameter("searchField"), request.getParameter("searchWord") ) %>
						</ul>
					</nav>
				</td>
	        </tr>
	        <tr align="right">
	            <td>
	            	<button class ="btn btn-outline-secondary" type="button" onclick="location.href='Write.jsp';">글쓰기
	                </button>
	            </td>
	        </tr>
	    </table>
	</div>
	
</body>
</html>