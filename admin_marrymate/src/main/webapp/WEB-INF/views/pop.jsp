<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#text{
	width:380px;
	height:25px;
	font-size:15px;
}

#textarea{
	width:380px;
	height:75px;
	font-size:15px;
}

#sm {
	width:140px;
	height:38px;
	font-size:15px;
	font-weight:bold;
	color:white;
	background-color:#078b18;
	border:0px;
	border-radius:5px;
}
</style>
<script>

</script>
</head>
<body>
<form name="pop" action="noti.do">
<input type="hidden" name="midx" value="${param.midx}">
<fieldset>
<br>
<table height="210" width="540">
	<tr>
		<th width="100">제목</th>
		<td><input type="text" name="title" id="text"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><input type="textarea" name="content" id="textarea"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="알림 보내기" id="sm"></th>
	</tr>
</table>
<br>
</fieldset>
</form>
</body>
</html>