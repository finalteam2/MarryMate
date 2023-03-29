<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/marrymate/js/httpRequest.js"></script>
<script>
var cnt = 1;
function addItem(){
	var newDivNode = document.createElement('div');
	newDivNode.setAttribute('id',cnt+'div');
	
	var newDivTextNode = document.createTextNode(cnt + '번째 아이템');
	newDivNode.appendChild(newDivTextNode);
	
	
	var newInputNode = document.createElement('input');
	newInputNode.setAttribute('type','button');
	newInputNode.setAttribute('value','삭제');
	newInputNode.setAttribute('onclick','delDiv('+cnt+')');
	newDivNode.appendChild(newInputNode);

	var inputNode = document.getElementById('i');
	var bodyNode = inputNode.parentNode;
	bodyNode.appendChild(newDivNode);

	cnt = cnt + 1;
}

function delDiv(num){
	var divNode = document.getElementById(num+'div');
	var bodyNode = divNode.parentNode;
	bodyNode.removeChild(divNode);
}
function show1(){
	sendRequest('ajaxtest.jsp',null,'GET',showResult);
}
function show2(){
	sendRequest('/marrymate/ajaxtest.jsp',null,'GET',showResult);
}
function show3(){
	sendRequest('searchTest.do',null,'POST',showResult);
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			window.alert(data);
			data = JSON.parse(data);
			
			var students = data.students;
			var msg = '총 학생 수 : ' + students.length + '명\n';
			for(var i = 0; i < students.length; i++){
				var student = students[i];
				msg += '이름 : ' + student.name + '(' + student.age + '세)' + student.addr + '\n';
			}
			window.alert(msg);
		}
	}
}
</script>
</head>
<body>
<h1>searchTest</h1>
<input type="button" value="test1" onclick="show1()">
<input type="button" value="test2" onclick="show2()">
<input type="button" value="test3" onclick="show3()">
<input id="i" type="button" value="추가" onclick="addItem()">
<article id="arti">

</article>

</body>
</html>