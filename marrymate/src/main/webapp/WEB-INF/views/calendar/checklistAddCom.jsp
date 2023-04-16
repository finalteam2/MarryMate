<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크리스트 추가하기</title>
<link rel="stylesheet" href="/marrymate/css/jquery-ui.css">
<script src="/marrymate/js/jquery-1.12.4.js"></script>
<script src="/marrymate/js/jquery-ui.js"></script>
<script src="/marrymate/js/httpRequest.js"></script>
<script type="text/javascript">
$(function(){
	$("#dueday").datepicker({
		changeMonth:true,
		changeYear:true
	});
});


</script>
</head>
<style>
body{
	font-size: 9pt;
	color: #333333;
}
table{
	width: 385px;
	border-collapse: collapse;
}
th,td{
	border: 1px solid #cccccc;
	padding: 5px;
}
.div1{
	width: 385px;
	text-align: center;
	margin-top: 10px;
}
caption{
	font-size: 14px;
	font-weight: bold;
	margin-bottom: 5px;
}
</style>
<body>
<form name="form" method="post" action="checklistAddCom.do" enctype="multipart/form-data">
<input type="hidden" name="cidx" value="${sessionScope.com_cidx}">
<table>
<caption>체크리스트 추가</caption>
	<tr>
		<th width="20%">날짜</th>
		<td width="80%"><input type="text" name="dueday" id="dueday" style="width: 98%"></td>
	</tr>
	<tr>
		<th width="20%">제목</th>
		<td width="80%"><input type="text" name="title" style="width: 98%"></td>
	</tr>
	<tr>
		<th>내용</th>
		<td><textarea name="content" style="width: 98%; height: 200px;"></textarea></td>
	</tr>
</table>
<div class="div1 ">
	<button type="submit">저장</button>
	<button type="button" onclick="self.close()">닫기</button>
</div>
</form>

</body>
</html>