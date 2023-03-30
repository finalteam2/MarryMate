<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table {
	border:1px solid;
	border-radius:20px;
	padding:20px;
	text-align: center;
}
table thead td {
	text-align: left;
}
</style>
<script src="/marrymate/js/httpRequest.js"></script>
<script>
function show(){
	var param = '';
	var name = document.getElementById('name').value;
	param += 'name=' + name;
	var sido = document.getElementById('sido').value;
	param += '&sido=' + sido;
	var sigungu = document.getElementById('sigungu').value;
	param += '&sigungu=' + sigungu;
	var view = document.getElementById('view').value;
	param += '&view=' + view;
	var payMin = document.getElementById('payMin').value;
	param += '&payMin=' + payMin;
	var payMax = document.getElementById('payMax').value;
	param += '&payMax=' + payMax;
	var sorts = document.getElementsByName('sort');
	param += '&sort=';
	for(var i = 0; i < sorts.length; i++){
		if (sorts[i].checked){
			param += sorts[i].value;
		}
	}
	sendRequest('searchEtc.do',param,'POST',showResult);
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			//window.alert(data);
			data = JSON.parse(data);
			//window.alert(data);
			
			var companylist = data.companylist;
			var msg = '검색 결과 : ' + companylist.length + '개\n';
			for(var i = 0; i < companylist.length; i++){
				var company = companylist[i];
				msg += '이름 : ' + company.cname + ' ';
				msg += '가격 : ' + company.pay + ' ';
				msg += '조회수 : ' + company.watch + ' ';
				msg += '사번 : ' + company.cidx + '\n';
			}
			window.alert(msg);
			
			//var resultNode = document.document.getElementById();
		}
	}
}

</script>
</head>
<body>
<h1>업체 검색</h1>
<form name="search" action="">
<table>
<thead>
<tr>
	<th>지역</th>
	<td>
		<select name="sido" id="sido">
			<option>전국</option>
			<option>서울</option>
		</select>
		<select name="sigungu" id="sigungu">
			<option>시군구</option>
			<option>몰라용</option>
		</select>
	</td>
		<th>비용</th>
	<td>
		<input type="text" name="payMin" id="payMin">
		<input type="text" name="payMax" id="payMax">
	</td>
</tr>
<tr>
	<th>업체명</th>
	<td>
		<input type="text" name="name" id="name">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="button" value="검색" onclick="show()">
		<input type="reset" value="다시입력">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="radio" name="sort" value="1" checked="checked">이름순
		<input type="radio" name="sort" value="2">조회수순
		<input type="radio" name="sort" value="3">낮은가격순
		<input type="radio" name="sort" value="4">높은가격순
		<select name="view" id="view">
			<option value="5" selected="selected">5개씩 보기</option>
			<option value="10">10개씩 보기</option>
			<option value="15">15개씩 보기</option>
		</select>
	</td>
</tr>
</thead>
<tbody>
	<tr>
		<td colspan="2" id="result">
		
		</td>
	</tr>
</tbody>
<tfoot>
	<tr>
		<td colspan="2">
		1 2 3 4 5
		</td>
	</tr>
</tfoot>
</table>
</form>

</body>
</html>