<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script>
function myfunction(){
	var pNode = document.all.pNode;
	pNode.innerHTML='<h1>테스트하기대작전</h1>';
	console.log('나와라가제트만능글자');
}
</script>
<meta charset="UTF-8">
<title>Sample Payment</title>
</head>
<body>

<h1>test</h1>
<input type="date" id="mydate" onchange="myfunction()">
<p id="pNode"></p>
</body>
</html>