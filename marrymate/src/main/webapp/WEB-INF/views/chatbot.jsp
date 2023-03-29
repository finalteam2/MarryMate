<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.up {
	position: fixed;
	bottom: 150px;
	right: 65px;
}

.background {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 1000;

	/* 숨기기 */
	z-index: -1;
	opacity: 0;
}

.show {
	opacity: 1;
	z-index: 1000;
	
	position: fixed;
	bottom: 60px;
	right: 60px;
}

.window {
	position: fixed;
	width: 100%;
	height: 100%;
}

.popup {
	position: fixed;
	bottom: 40px;
	right: 40px;
	background-color: white;
	box-shadow: 0px 0px 30px lightgray;
	width: 360px;
	height: 660px;
	border-radius:20px;
}
</style>
</head>
<body>
<div class="up"><a href="#header"><img src="/marrymate/img/up.png" alt="up" width="60" height="60"></a></div>
<div id="show" class="show"><img src="/marrymate/img/chatbot.png" alt="chatbot" width="70" height="70"></div>
<div class="background">
	<div class="window">
    	<div class="popup">
			<div id="close">
				<table align="right">
					<tr height="65">
						<th width="260" align="left">상담챗</th>
						<td width="50">
							<img src="/admin_marrymate/img/x_button.png" alt="x_button" width="30" height="30">
						</td>
					</tr>
				</table>
			</div>
			<div>
				<table width="320" height="550" align="center" border="1" cellspacing="0">
					<tr>
						<td>무엇을 도와드릴까요?</td>
					</tr>
					<tr height="50">
						<td><input type="button" value="질문1"></td>
					</tr>
					<tr height="50">
						<td><input type="button" value="질문2"></td>
					</tr>
					<tr height="50">
						<td><input type="button" value="질문3"></td>
					</tr>
					<tr height="50">
						<td><input type="button" value="1:1 채팅하기"></td>
					</tr>
				</table>
			</div>
        </div>
	</div>
</div>

<script>
	function show() {
        document.querySelector(".background").className = "background show";
	}

	function close() {
		document.querySelector(".background").className = "background";
	}

	document.querySelector("#show").addEventListener("click", show);
	document.querySelector("#close").addEventListener("click", close);
</script>
</body>
</html>