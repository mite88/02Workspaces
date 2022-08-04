	$(function() {
			//글쓰기
			$(".write").click(function() {
				window.location.href = "notice_write.do";
			});

			//카테고리별 글보기
			$("#category").change(function() {

				var category = $("#category option:selected").val();

				var obj = new Object(); //key, value형태로 저장할 Object
				var arr = new Array(); //Object를 배열로 저장할 Array

				$.post("notice_list.do?category=" + category, {
					category : category
				}, function(data) {
					//alert( "success" );

				}, 'json' /* xml, text, script, html */
				).done(function(data) {
					
					var str = null; //문자 붙이기

					$('#datatable').empty();
					$.each(data, function(index, item) {
						$('#datatable').empty();
						str += "<tr><td>" + item.nb_no + "</td>";
						str += "<td>" + item.nb_category + "</td>";
						str += "<td><a href='notice_view.do?nb_no="+item.nb_no+"'>" + item.nb_title + "</a></td>";
						
						//날짜 포멧을 위한 변수들(jstl이 잘안되서 바꿈)
						var date=item.nb_date;
						var formattedDate = new Date(date);
						var y = formattedDate.getFullYear();
						var m =  formattedDate.getMonth()+1;
						var d = formattedDate.getDate();
						var h = formattedDate.getHours();
						var m = formattedDate.getMinutes();
						
						str += "<td>" + y+"/"+m+"/"+d+" "+h+":"+m + "</td></tr>";
						
						$('#datatable').append(str);
						console.log(str);

					});

				}).fail(function(data) {
					alert("error");
				})

			});

		});