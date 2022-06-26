<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<!--
* Tabler - Premium and Open Source dashboard template with responsive and high quality UI.
* @version 1.0.0-beta10
* @link https://tabler.io
* Copyright 2018-2022 The Tabler Authors
* Copyright 2018-2022 codecalm.net PaweÅ Kuna
* Licensed under MIT (https://github.com/tabler/tabler/blob/master/LICENSE)
-->
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, viewport-fit=cover" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>관리자</title>
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
	<div class="page">

		<!-- header -->
		<jsp:include page="../layout/header.jsp" />


		<div class="page-wrapper">
			<div class="container-xl">
				<!-- Page title -->
				<div class="page-header d-print-none">
					<div class="row g-2 align-items-center">
						<div class="col">
							<!-- Page pre-title -->
							<div class="page-pretitle">Overview</div>
							<h2 class="page-title">Dashboard</h2>
						</div>
					</div>
				</div>
			</div>

			<!--page-body -->
			<div class="page-body">
				<div class="container-xl">
					<div class="row row-deck row-cards">

						<!-- menu -->
						<div class="col-12">

							<div class="card card-lg">
								<div class="card-body markdown">

									<form name="writeFrm" method="post"enctype="multipart/form-data" onsubmit="return validateForm(this);">
									<!-- 게시물 수정을 위해 일련번호와 기존 파일명을 hidden박스에 추가한다.  -->
									<input type="hidden" name="idx" value="${ dto.idx }" />
									<!-- 기존의 원본파일명 -->
									<input type="hidden" name="prevOfile" value="${ dto.ofile }" />
									<!-- 기존의 서버에 저장된 파일명 -->



										<div class="mb-3">
											<label class="form-label required">작성자</label> <input
												type="text" class="form-control" autocomplete="off"
												name="name" readonly value="${dto.name }">
										</div>

										<div class="mb-3">
											<label class="form-label required">제목</label> <input
												type="text" class="form-control" autocomplete="off"
												name="title" value="${dto.title }">
										</div>

										<div class="mb-3">
											<label class="form-label">내용</label>
											<textarea class="form-control" data-bs-toggle="autosize"
												placeholder="Type something…" name="content"
												style="overflow: hidden; overflow-wrap: break-word; resize: none; height: 96px;">${dto.content }</textarea>
										</div>


										<div class="mb-3">
											<label class="form-label">영상 url</label>
											<div class="input-group mb-2">
												<input type="text" class="form-control" placeholder="username" name="video_url" value="${dto.video_url }" autocomplete="off">
											</div>

										</div>

										<div class="mb-3">
											<label for="formFile" class="form-label">파일첨부</label> 
											<input type="file" name="ofile"  onchange="file_choice(this);"/>
									        <input type="text" name="filename" value="${dto.ofile}" readonly="readonly">
											<button onclick="file_check();" type="button" id="button-addon2">Button</button>
											<br/><hr>
								        <c:if test="${not empty dto.sfile }">
											파일삭제시 체크
											${dto.ofile}
											<input type="checkbox" name="deleteFile" id="deleteFile" value="1"/>
										</c:if>
										<%-- <c:if test="${empty dto.sfile }">
											<input type="hidden" name="deleteFile" id="deleteFile" value="0"/>
										</c:if> --%>
										
										</div>
										
										
										<button type="submit" class="btn btn-outline-primary">작성완료</button>
										<button class="btn btn-outline-primary" type="reset">RESET</button>
										<button class="btn btn-outline-primary" type="button" onclick="location.href='../mvcboard/list.do'">
											목록 바로가기
										</button>

									</form>

								</div>

							</div>

						</div>
					</div>
				</div>
			</div>
			<!--page-body end-->

		</div>
		<!--page-wrapper end-->

		<!-- header -->
		<jsp:include page="../layout/footer.jsp" />

	</div>
</body>
</html>
