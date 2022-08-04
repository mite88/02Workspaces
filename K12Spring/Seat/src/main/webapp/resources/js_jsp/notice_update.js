$(function() {
	//에디터 뛰우기 및 파일전송설정
	$('#nb_content').summernote({ // summernote를 사용하기 위한 선언
		height : 400, // 기본 높이값
		minHeight : null, // 최소 높이값(null은 제한 없음)
		maxHeight : null, // 최대 높이값(null은 제한 없음)
		focus : true, // 페이지가 열릴때 포커스를 지정함
		lang : 'ko-KR',// 한국어 지정(기본값은 en-US),
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					sendFile(files[i],editor);
				}
			}
		}
	});

	//내용저장하기
	$(".update_submit").on('click', function() {

		var title = $("#nb_title").val();

		if (title == "") {
			alert("제목이 없습니다");
			$("#nb_title").focus();
			return false;
		}

		//var contents = $('#nb_content').summernote('code');

		return true;

	});

	/* //작성시 내용이 나오는지 확인(테스트용)
			$(".write_submit").click(function() {
				$('.output').html($('#summernote').summernote('code'));
			}); */

});

//이미지 업로드용 ajax
function sendFile(file,editor) {
	var hrefurl='http://ijuju88.cafe24.com/seat/NoticeImage.do?imgname=';
	var form_data = new FormData();
	form_data.append('file', file);
	$.ajax({
		data: form_data,
		type: "POST",
		url: 'ImageUpload.do',
		cache: false,
		contentType: false,
		enctype: 'multipart/form-data',
		processData: false,
		success: function(url) {
			alert(url);
			$('#nb_content').summernote('insertImage', hrefurl+url);

		}
	});
}