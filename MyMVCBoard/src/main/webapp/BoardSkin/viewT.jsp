<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="./commons/header.jsp" %>
<body>
<div class="container">

<!-- 파일 형식지정용 -->
<c:set var="filetype" value="${fn:split(dto.ofile, '.')}" />
<c:set var="filetype_img" 
value="${(fn:toLowerCase(filetype[1]) eq 'jpg') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'png') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'jpeg') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'gif')}" />

<c:set var="filetype_video" 
value="${(fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'mp4') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'ogv') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'WebM')
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'avi')}" />

<c:set var="filetype_audio" 
value="${(fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'wav')  
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'Ogg') 
or (fn:toLowerCase(filetype[fn:length(filetype)-1]) eq 'mp3')}" />

    <!-- Top영역 -->
    <%@ include file="./commons/top.jsp" %>
    <!-- Body영역 -->
    <div class="row">
        <!-- Left메뉴영역 -->
        <%@ include file="./commons/left.jsp" %>
        <!-- Contents영역 -->
        <div class="col-9 pt-3">
            <h3>게시판 내용보기 - <small>자유게시판</small></h3>
            
            <form>
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="30%"/>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성자</th>
                        <td>
                            ${dto.name}
                        </td>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성일</th>
                        <td>
                             ${dto.postdate}
                        </td>
                    </tr>
                    <tr>
                        <!-- th class="text-center" 
                            style="vertical-align:middle;">이메일</th>
                        <td>
                              ${dto.postdate}
                        </td-->
                        <th colspan="2" class="text-center" 
                            style="vertical-align:middle;">조회수</th>
                        <td>
                            ${dto.visitcount}
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">제목</th>
                        <td colspan="3">
                            ${dto.title}
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">내용</th>
                        <td colspan="3">
                            ${dto.content}
                            
                            <c:if test="${not empty dto.ofile and filetype_img}">
								<img alt="img" class="img-fluid" src="<%=request.getContextPath() %>/Uploads/${dto.sfile}">
							</c:if>
							
						  	<c:if test="${not empty dto.ofile and filetype_video}">
								<div class="embed-responsive embed-responsive-16by9">
								  	<iframe class="embed-responsive-item" src="<%=request.getContextPath() %>/Uploads/${dto.sfile}"></iframe>
								</div>
							</c:if>
							
							<c:if test="${not empty dto.ofile and filetype_audio}">
								<div class="embed-responsive embed-responsive-4by3">
								    <audio controls class="embed-responsive-item">
								        <source src="<%=request.getContextPath() %>/Uploads/${dto.sfile}">
								    </audio>
								</div>
							</c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>첨부파일</th>
						<td>
	
							 <c:if test="${not empty dto.ofile}">
								${dto.ofile}
								<a href="../BoardSkin/download.do?ofile=${dto.ofile}&sfile=${dto.sfile}&idx=${dto.idx}">
								[다운로드]</a>
							</c:if>
						</td>
						
						<td>다운로드수</td>
						<td>${dto.downcount}</td>

							</tr>
                </tbody>
                </table>

                <!-- 각종버튼 -->
                <div class="row mb-3">
                    <div class="col d-flex justify-content-end">
                        <!--  <button type="button" class="btn btn-primary">글쓰기</button>-->
                        <button type="button" class="btn btn-secondary" onclick="location.href='../BoardSkin/pass.do?mode=edit&idx=${param.idx}';">수정하기</button>
                        <button type="button" class="btn btn-success" onclick="location.href='../BoardSkin/pass.do?mode=delete&idx=${param.idx}';">삭제하기</button>
                        <button type="button" class="btn btn-info">답글쓰기</button>
                        <button type="button" class="btn btn-warning" onclick="location.href='../BoardSkin/list.do';">목록보기</button>
                       <!-- 
                       <button type="button" class="btn btn-danger">전송하기</button>
                        <button type="button" class="btn btn-dark">다시쓰기</button>
                        -->
                    </div>
                </div>
            </form>
        </div>
    </div>
    <!-- Copyright영역 -->
    <%@ include file="./commons/copyright.jsp" %>
</div>
</body>
</html>