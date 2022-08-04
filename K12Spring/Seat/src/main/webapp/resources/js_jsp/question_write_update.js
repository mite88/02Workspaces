$(function() {
	//에디터 뛰우기 및 파일전송설정
	$('#qb_content').summernote({ // summernote를 사용하기 위한 선언
		height : 400, // 기본 높이값
		minHeight : null, // 최소 높이값(null은 제한 없음)
		maxHeight : null, // 최대 높이값(null은 제한 없음)
		focus : true, // 페이지가 열릴때 포커스를 지정함
		lang : 'ko-KR',// 한국어 지정(기본값은 en-US),
		callbacks : {
			onImageUpload : function(files, editor, welEditable) {
				for (var i = files.length - 1; i >= 0; i--) {
					//alert(files[i]);
					sendFile(files[i],editor);
				}
			},

			onMediaDelete : function(target){
				deleteFile(target[0].src);
				target[0].remove();
			}   

		}

	});

	//내용저장하기
	$(".write_submit").on('click', function() {

		var title = $("#qb_title").val();

		if (title == "") {
			alert("제목이 없습니다");
			$("#qb_title").focus();
			return false;
		}

		return true;

	});


	//수정하기 클릭시
	$("#update_submit").click(function() {
		var title = $("#qb_title").val();

		if (title == "") {
			alert("제목이 없습니다");
			$("#qb_title").focus();
			return false;
		}

		//var contents = $('#nb_content').summernote('code');

		return true;
	});


//	--------------------------이미지용---------------------------------------------
//	이미지 업로드용 ajax
	/*
	 * ajax에 작업후 해당 img태그 src에 넣어서 실제 그림이 나타나게 함
	 * */
	function sendFile(file,editor) {

		var hrefurl='http://ijuju88.cafe24.com/seat/QImage.do?imgname=';
		var form_data = new FormData();
		//alert(form_data);
		form_data.append('file', file);
		$.ajax({
			data: form_data,
			type: "POST",
			url: 'QImageUpload.do',
			cache: false,
			contentType: false,
			enctype: 'multipart/form-data',
			processData: false,
			success: function(url) {
				//alert(url);
				$('#qb_content').summernote('insertImage', hrefurl+url);

			}
		});
	}


//	이미지 삭제용 ajax
	function deleteFile(file){

		//filename만 자르기위한 작업중...
		var filenamepath = file.split('?');
		var filename = filenamepath[1].split('=');
		//alert(filename[1]);

		//데이터 보내기
		$.ajax({
			type: "GET",
			url: 'http://ijuju88.cafe24.com/seat/QImageDelete.do?filename='+filename[1],
			dataType: 'text',//데이타 타입
			cache: false,
			contentType: false,
			processData: false,
			success: function(result) {
				console.log(result);
			}
		});
	}

});