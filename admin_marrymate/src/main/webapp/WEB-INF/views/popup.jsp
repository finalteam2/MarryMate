<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.text{
	width:160px;
	height:25px;
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
<script>
if(${!empty msg}){
	window.alert('${msg}');
}
</script>
<form name="popup" action="pointPlus.do">
<fieldset>
<br>
<table height="205" width="550">
	<tr>
		<th>회원번호</th>
		<td><input type="text" name="midx" class="text" id="midx"></td>
		<th>회원명</th>
		<td><input type="text" class="text" placeholder="(미기입 항목입니다)" readonly></td>
	</tr>
	<tr>
		<th>포인트</th>
		<td><input type="text" name="p_cal" class="text"></td>
		<th>구분</th>
		<td><input type="text" class="text" value="이벤트" readonly></td>
	</tr>
	<tr>
		<td colspan="4" align="center"><input type="submit" value="포인트 지급하기" id="sm"></th>
	</tr>
</table>
<br>
</fieldset>
</form>
</body>
</html>