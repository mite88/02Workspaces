<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Theme style -->
<link rel="stylesheet" href="resources/admin/dist/css/adminlte.min.css">
<title>Insert title here</title>
</head>
<body>
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="card-header">
					<h3 class="card-title">Direct Chat</h3>

					<div class="card-tools">
						<button type="button" class="btn btn-tool" data-widget="remove">
							<i class="fa fa-times"></i>
						</button>
					</div>
				</div>
				<div class="card-body">
					<!-- Conversations are loaded here -->
					<div class="direct-chat-messages chatmessage">
					
						<!-- 채팅입력부분 -->

					<!--/.direct-chat-messages-->

				</div>

				<div class="card-footer">
					<form action="#" method="post">
						<div class="input-group">
							<input type="text" name="message" id="message"
								placeholder="Type Message ..." class="form-control"> <span
								class="input-group-append">
								<button type="button" class="btn btn-primary charSend">Send</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>
