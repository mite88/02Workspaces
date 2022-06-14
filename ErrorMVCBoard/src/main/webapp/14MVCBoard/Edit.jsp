<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 첨부형 게시판</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	//글쓰기 폼에서 누락된 내용이 있는지 확인하는 함수
    function validateForm(form) {   
        if (form.name.value == "") {
            alert("작성자를 입력하세요.");
            form.name.focus();
            return false;
        }
        if (form.title.value == "") {
            alert("제목을 입력하세요.");
            form.title.focus();
            return false;
        }
        if (form.content.value == "") {
            alert("내용을 입력하세요.");
            form.content.focus();
            return false;
        }
        /* if (form.pass.value == "") {
            alert("비밀번호를 입력하세요.");
            form.pass.focus();
            return false;
        } */
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
		
		document.getElementsByName("filename")[0].value = filename;
		
		//addFile(filename);
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

</head>
<body>
	<h2>파일 첨부형 게시판 - 수정하기(Edit)</h2>
	<form name="writeFrm" method="post" enctype="multipart/form-data"
		action="../mvcboard/edit.do" onsubmit="return validateForm(this);">

		<!-- 게시물 수정을 위해 일련번호와 기존 파일명을 hidden박스에 추가한다.  -->
		<input type="hid-den" name="idx" value="${ dto.idx }" />
		<!-- 기존의 원본파일명 -->
		<input type="hid-den" name="prevOfile" value="${ dto.ofile }" />
		<!-- 기존의 서버에 저장된 파일명 -->
		<input type="hid-den" name="prevSfile" value="${ dto.sfile }" />

		검증된패스워드:${pass }
		<table border="1" width="90%">
			<tr>
				<td>작성자</td>
				<td><input type="text" name="name" style="width: 150px;"
					value="${ dto.name }" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 90%;"
					value="${ dto.title }" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" style="width: 90%; height: 100px;">${ dto.content }</textarea>
				</td>
			</tr>
			<tr>
				<td>첨부 파일</td>
				<td>
					<!-- input태그의 type속성이 file타입인 경우에는 value속성은
	        의미가 없다. value는 단순히 String(문자열)이므로 이 부분은
	        DB에서 처리해야 한다. 해당 <input>태그는 선택한 파일을 
	        서버로 전송하는 역할을 한다. --> 
	        <input type="file" name="ofile"  onchange="file_choice(this);"/>
	        <input type="text" name="filename" value="${dto.ofile}" readonly="readonly">
			<button onclick="file_check();" type="button" id="button-addon2">Button</button>
			<br/><hr>
	        <c:if test="${not empty dto.sfile }">
				파일삭제시 체크
				${dto.ofile}
				<input type="checkbox" name="deleteFile" id="deleteFile" value="1"/>
			</c:if>
			<c:if test="${empty dto.sfile }">
				<input type="hidden" name="deleteFile" id="deleteFile" value="0"/>
			</c:if>

				</td>
			</tr>
			<!-- 패스워드 검증을 마친후 수정페이지로 진입하였으므로 비밀번호
    입력창은 화면에서 제거한다.  -->
			<!-- <tr>
        <td>비밀번호</td>
        <td>
            <input type="password" name="pass" style="width:100px;" />
        </td>
    </tr> -->
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성 완료</button>
					<button type="reset">RESET</button>
					<button type="button"
						onclick="location.href='../mvcboard/list.do';">목록 바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>














