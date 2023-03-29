<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.label{
	font-size:20px;
}
.text{
	width:180px;
	height:30px;
	font-size:16px;
}
#img{
	float:left;
	margin-right:70px;
}
#login{
	width:110px;
	height:45px;
	font-size:18px;
	font-weight:bold;
	color:white;
	background-color:#28A4F6;
	border:0px;
	border-radius:5px;
}
#homepage{
	width:150px;
	height:45px;
	font-size:18px;
	font-weight:bold;
	color:white;
	background-color:gray;
	border:0px;
	border-radius:5px;
	position: fixed;
	bottom: 150px;
	right: 280px;
	margin: 0px auto;
}
</style>
</head>
<body width="1200">
<br><br><br><br><br>
<hr width="1200">
<br>
<h2 align="center">안녕하세요! MarryMate 관리자 페이지 입니다.</h2>
<br><br><br><br><br>
<form name="login" action="login.do" method="post">
	<table align="center">
		<tr>
			<td>
				<img src="/admin_marrymate/img/logo.png" alt="logo" width="500" height="250" id="img">
			</td>
			<td>
				<br><br>
				<table bgcolor="lightgray" >
					<tr height="30"><td colspan="3"> </td></tr>
					<tr height="50">
						<th width="130"><label class="label">아이디</label></th>
						<td><input type="text" name="id" class="text" placeholder="아이디를 입력하세요."></td>
						<td rowspan="2" width="150" align="center">
							<input type="submit" value="로그인" id="login">
						</td>
					</tr>
					<tr height="50">
						<th><label class="label">비밀번호</label></th>
						<td><input type="password" name="pwd" class="text" placeholder="비밀번호를 입력하세요."></td>
					</tr>
					<tr height="30"><td colspan="3"> </td></tr>
				</table>
			</td>
		</tr>
	</table>
</form>
<br><br><br><br><br><br><br><br>
<table width="1100" align="center">
	<tr>
		<td align="right"><a href="/marrymate/index.do"><input type="button" value="홈페이지" id="homepage"></a></td>
	</tr>
</table>
<br><br><br>
<hr width="1200">
</body>
</html>