function add_more_book(){
	var rowCount = $('#tbl >tbody >tr').length;
	var i = parseInt(rowCount) - 1;
	$("#tbl tbody tr:nth-child(1)").clone().appendTo("#tbl tbody");
}

function auto_number() {
	$("table#tbl tr").each(function() {
		var ind = $(this).index() + 1;
		$(this).closest("tr").find(".ind").val(ind);
	});
}

$(document).ready(function(){
	//add        
	$("#tbl").on("click",".add_more",function(event){
		event.preventDefault();
		event.stopImmediatePropagation();
		add_more_book();
		auto_number();
	});
	//remove        
	$('#tbl').on('click', '.remove', function(event) {
		event.preventDefault();
		event.stopImmediatePropagation();
		var num_row = $('table#tbl tr:last').index();
		if (num_row > 0) {
			$(this).parents("tr").remove();
			auto_number();
			return false;
		} else {
			return false;
		}
	});
});