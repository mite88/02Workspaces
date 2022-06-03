<%--
/**
 * 1. 프로젝트명 : FileUploadMain.jsp
 * 2. 작성일 : 2022. 6. 3. 오후 12:02:46
 * 3. 작성자 : mite88
 * 4. 설명 : 
 *
 * 수정일          작성자             내용      
 * -----------------------------------------------------------------------
 *2022. 6. 3.    mite88   
 */
--%>
<!-- FileUploadMain.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>FileUpload</title></head>
<script>
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
        if (form.attachedFile.value == "") {
            alert("첨부파일은 필수 입력입니다.");
            return false;
        }
    }
</script>
<body>
    <h3>파일 업로드</h3>
    <span style="color: red;">${errorMessage }</span>
    
    <!--
    1. 전송하고자 하는 입력 폼을 <form>과 </form>사이에 위치해놓는다.
    2. action 값을 데이터를 전송받아서 처리할 곳으로 설정한다.
    3. method를 반드시 post로 설정해준다.
    4. enctype을 multipart/form-data로 설정한다.
    5. <form>과 </form>사이에 input type submit버튼을 위치시킨다.
 -->
     <form name="fileForm" method="post" enctype="multipart/form-data"
          action="UploadProcess.jsp" onsubmit="return validateForm(this);">
        작성자 : <input type="text" name="name" value="머스트해브" /><br />
        제목 : <input type="text" name="title" /><br /> 
        카테고리(선택사항) : 
            <input type="checkbox" name="cate" value="사진" checked />사진 
            <input type="checkbox" name="cate" value="과제" />과제 
            <input type="checkbox" name="cate" value="워드" />워드 
            <input type="checkbox" name="cate" value="음원" />음원 <br /> 
        첨부파일 : <input type="file" name="attachedFile" /> <br />
        <input type="submit" value="전송하기" />
    </form>
</body>
</html>
