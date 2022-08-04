$(function () {
	
	//파일명 입력시 text 파일명으로 바꾸기
	$("input[name=show_img1]").on("change", function () {

	    var file = this.files[0],
	    fileName = file.name,
	    fileSize = file.size;
	   //alert("Uploading: " + fileName + " @ " + fileSize + "bytes");

	    $("#file_img1UUID").val("");
	    $("#file_img1").val(fileName);
	});
	
	$("input[name=show_img2]").on("change", function () {

	    var file2 = this.files[0],
	    fileName2 = file2.name,
	    fileSize2 = file2.size;
	    //alert("Uploading: " + fileName + " @ " + fileSize + "bytes");
	      $("#file_img2UUID").val("");
	    $("#file_img2").val(fileName2);
	});
	

});
