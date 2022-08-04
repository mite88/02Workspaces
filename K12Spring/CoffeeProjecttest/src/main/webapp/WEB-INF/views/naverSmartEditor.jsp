<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네이버 스마트 에디터 2.10.0</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	var oEditors = [];
	window.onload = function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "contents",
			sSkinURI : "./resources/se2/SmartEditor2Skin.html",
			fCreator : "createsEditor2"
		});
	}
	
	function chkForm(f){
		if(f.title.value==''){
		alert('제목을 입력하세요');
		f.title.focus();
		return false;
		}
		
		
		oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
		var contents = document.getElementById("contents").value; 
		console.log("contents", contents); 
		
		if(contents=='<p><br></p>'){
		alert('48 02108');return false;  
		}  
	}
	</script>
</head>
<body>
	<h2>네이버 스마트 에디터</h2>

	<form method="post" onsubmit="return chkForm(this);">
		<span style="color: red;">${submit }</span>
		<table border="1" style="width: 900px;">

			<colgroup>
				<col width="100px" />
				<col width="*" />
			</colgroup>

			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 400px;" /></td>
			</tr>

			<tr>
				<td>내용</td>
				<td>
					<!-- 에디터에 기본으로 삽입할 글(수정 모드)이 없다면
					value 값을 지정하지 않으시면 됩니다. --> 
					<textarea name="contents" id="contents"
						rows="10" cols="70"></textarea>
				</td>
			</tr>

			<tr>
				<td colspan="2"><input type="submit" value="전송하기" /></td>
			</tr>
		</table>

	</form>

</body>
</html>