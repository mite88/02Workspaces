<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="./commons/header.jsp" %>

<script type="text/javascript">
	//글쓰기 누락확인
	function validateForm(form) {
		if (form.name.value == "") {
			alert("작성자 입력");
			form.name.focus();
			return false;
		}if (form.pass.value == "") {
			alert("비밀번호 입력");
			form.pass.focus();
			return false;
		}if (form.title.value == "") {
			alert("제목 입력");
			form.title.focus();
			return false;
		}if (form.content.value == "") {
			alert("내용 입력");
			form.content.focus();
			return false;
		}
	}
	
	//파일넣기
	function addFile(file){
		var data = new FormData(document.getElementById('writeFrm'));
		
		$.ajax({
			url : '<%=request.getContextPath() %>/addFile.do', 
            type : 'POST', 
            processData: false,    
            contentType: false,      
            cache: false,           
            enctype: 'multipart/form-data',
            dataType : 'text',
            timeout: 600000,
            data : data, 
			success : function(result) {
				//alert(result)
				document.getElementsByName("filename")[0].value = file;
				document.getElementsByName("prevOfile")[0].value = file;
				document.getElementsByName("prevSfile")[0].value = result;
			},
		    
            error : function(xhr, status) {
                alert(xhr + " : " + status);
            }
		}); //$.ajax
	}
	
	//파일삭제
	function delFile(form){
	 
		if(confirm("Remove this file? ")){
			var targetLi = $(this).closest("li");
			
			var cell = document.getElementById("file_list1");
			while ( cell.hasChildNodes() )
			{
			     cell.removeChild( cell.firstChild );       
			}

		}
		
		//alert(form.prevOfile.value);
		$.ajax({
				url : '<%=request.getContextPath() %>/deleteFile.do', 
	            type : 'POST', 
	            data : {delfile : form.prevSfile.value}, 
				success : function(result) {
					console.log(result);

					form.prevOfile.value="";
					form.prevSfile.value="";
					form.filename.value="";
				},
			    
	            error : function(xhr, status) {
	                alert(xhr + " : " + status);
	            }
			}); //$.ajax
	}
	
	
	

	//버튼 클릭
	function file_check() {
		document.getElementsByName("ofile")[0].click();
	}
	
	

	//파일선택
	function file_choice(f) {
		//alert(f.value);

		//윈도우와 다른거에 따른 파일경로명 추출 - 저도 인터넷에서 검색하다 찾은거라 ...
		//https://sir.kr/qa/337817
		if (window.FileReader) {
			var filename = f.value.split('/').pop().split('\\').pop();
		} else {
			var filename = f.value.split('/').pop().split('\\').pop();
		}

		addFile(filename);
	}
</script>

<Style>
input[type="file"] {
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
</Style>
<body> 
<div class="container">
    <!-- Top영역 -->
    <%@ include file="./commons/top.jsp" %>
    <!-- Body영역 -->
    <div class="row">
        <!-- Left메뉴영역 -->
        <%@ include file="./commons/left.jsp" %>
        <!-- Contents영역 -->
        <div class="col-9 pt-3">
            <h3>게시판 작성 - <small>자유게시판</small></h3>
            
            <form action="../BoardSkin/edit.do" name="writeFrm" id="writeFrm" method="post" 
            onsubmit="return validateForm(this);">
            
            	<input type="hidden" name="idx" id="idx" value="${dto.idx}"/>
				<input type="hidden" name="prevOfile" value="${dto.ofile}"/>
				<input type="hidden" name="prevSfile" value="${dto.sfile}"/>
		
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" style="vertical-align:middle;">작성자</th>
                        <td>
                            <input type="text" class="form-control" name="name" value="${dto.name}" style="width:100px;" />
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center"  style="vertical-align:middle;">패스워드</th>
                        <td>
                            <input type="password" class="form-control" value="${dto.pass}"  style="width:200px;" name="pass"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center"  style="vertical-align:middle;">제목</th>
                        <td>
                            <input type="text" class="form-control" name="title" value="${dto.title}"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" style="vertical-align:middle;">내용</th>
                        <td>
                            <textarea rows="5" class="form-control" name="content" >${dto.content}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" style="vertical-align:middle;">첨부파일</th>
                        <td>
                            <input type="file" class="form-control" name="ofile" onchange="file_choice(this);"/>
                            <div class="input-group mb-3">
							  	<input type="text" class="form-control" name="filename" value="${dto.ofile}">
							  	<button class="btn btn-outline-secondary" onclick="file_check();" type="button" id="button-addon2">Button</button>
							</div>
                            
                            
                            <label>파일삭제하실 파일은 체크해주세요</label><br>
                            <hr />
                             <c:if test="${not empty dto.ofile}">
								<label id="file_list1">${dto.ofile}
									 <input class="form-check-input" type="checkbox" value="Ok" name="del_file">
									 <button type="button" onclick="delFile(this.form);">del</button>
								</label>
							</c:if>
							
                        </td>
                    </tr>
                </tbody>
                </table>

                <!-- 각종버튼 -->
                <div class="row mb-3">
                    <div class="col d-flex justify-content-end">
                        <!--  
						<button type="button" class="btn btn-secondary">수정하기</button>
						<button type="button" class="btn btn-success">삭제하기</button>
						<button type="button" class="btn btn-info">답글쓰기</button>
						-->
                        <button type="button" class="btn btn-warning" onclick="location.href='../BoardSkin/list.do';">목록보기</button>
                        <button type="submit" class="btn btn-danger">전송하기</button>
                        <button type="reset" class="btn btn-dark">다시쓰기</button>
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