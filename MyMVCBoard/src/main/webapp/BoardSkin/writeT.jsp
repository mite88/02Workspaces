<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</script>

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
            
            <form action="../BoardSkin/write.do" name="writeFrm" method="post" 
            enctype="multipart/form-data" onsubmit="return validateForm(this);">
                <table class="table table-bordered">
                <colgroup>
                    <col width="20%"/>
                    <col width="*"/>
                </colgroup>
                <tbody>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">작성자</th>
                        <td>
                            <input type="text" class="form-control" name="name"
                                style="width:100px;" />
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">패스워드</th>
                        <td>
                            <input type="password" class="form-control" 
                                style="width:200px;" name="pass"/>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">제목</th>
                        <td>
                            <input type="text" class="form-control" name="title" />
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">내용</th>
                        <td>
                            <textarea rows="5" class="form-control" name="content" ></textarea>
                        </td>
                    </tr>
                    <tr>
                        <th class="text-center" 
                            style="vertical-align:middle;">첨부파일</th>
                        <td>
                            <input type="file" class="form-control" name="ofile"/>
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