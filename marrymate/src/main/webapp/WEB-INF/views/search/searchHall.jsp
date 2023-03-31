<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarryMate</title>
<link href="/marrymate/css/style.css" rel="stylesheet">
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

body{
    font-family: 'SUIT-Regular';
}

.searchbox {
	
	border:1px solid;
	border-radius:20px;
	padding:20px;
	text-align: center;
}
.searchbox td {
	text-align: left;
}
.container {
	display: grid;
	grid-template-columns: repeat(4, 285px);
	grid-auto-rows: minmax(100px, auto);
}
.container .item {
	border:1px solid;
	border-radius:10px;
	padding:20px;
	margin: 20px;
}
.container .item .img {
	width: 200px;
	height: 100px;
	object-fit:cover;
}
.container .item .info {
	height: 80px;
	text-align: center;
}
.container .item .info span{
	height: 8px;
	line-height: 8px;
	font-size: 8px;
}
.container .item .info .name {
	height: 10px;
	line-height: 10px;
	font-size: 15px;
}
</style>
<script src="/marrymate/js/httpRequest.js"></script>
<script>
function searchHall(page){
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
	var guestMin = document.getElementById('guestMin').value;
	param += '&guestMin=' + guestMin;
	var guestMax = document.getElementById('guestMax').value;
	param += '&guestMax=' + guestMax;
	var kind = document.getElementById('kind').value;
	param += '&kind=' + kind;
	var sorts = document.getElementsByName('sort');
	param += '&sort=';
	for(var i = 0; i < sorts.length; i++){
		if (sorts[i].checked){
			param += sorts[i].value;
		}
	}
	param += '&page=' + page;
	sendRequest('searchHall.do',param,'POST',searchResult);
}
function searchResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			//window.alert(data);
			data = JSON.parse(data);
			var companylist = data.companylist;
			//window.alert(data);
			
			//검색된 수
			var cnt = data.cnt;
			var totalCntNode = document.getElementById('totalCnt');
			totalCntNode.innerHTML='<span>검색 결과 : 총' + cnt + ' 건</span>';
			
			
			var paging = data.paging;
			var pagingNode = document.getElementById('paging');
			pagingNode.innerHTML=paging;
			
			//컨테이너 비우기
			var containerNode = document.getElementById('container');
			var childNodes = containerNode.childNodes;
			for (let i = childNodes.length - 1; i >= 0; i--) {
			  var childNode = childNodes[i];
			  containerNode.removeChild(childNode);
			}
			
			for(var i = 0; i < companylist.length; i++){
				var company = companylist[i];
				//아이템 만들기
				var newItemNode = document.createElement('div');
				newItemNode.setAttribute('class','item');
				
					var newImgNode = document.createElement('img');
					newImgNode.setAttribute('class','img');
					newImgNode.setAttribute('alt','default_img');
					newImgNode.setAttribute('src','/marrymate/img/noimg.jpg');
					newItemNode.appendChild(newImgNode);
					
					var newInfoNode = document.createElement('div');
					newInfoNode.setAttribute('class','info');
						
						var newNameNode = document.createElement('span');
						newNameNode.setAttribute('class','name');
						var newNameTextNode = document.createTextNode(company.cname);
						newNameNode.appendChild(newNameTextNode);
						
						var newSidoNode = document.createElement('span');
						newSidoNode.setAttribute('class','sido');
						var newSidoTextNode = document.createTextNode(company.sido + company.sigungu + ' / ');
						newSidoNode.appendChild(newSidoTextNode);
						
						var newKindNode = document.createElement('span');
						newKindNode.setAttribute('class','kind');
						var newKindTextNode = document.createTextNode(company.kind);
						newKindNode.appendChild(newKindTextNode);
						
						var newPayNode = document.createElement('span');
						newPayNode.setAttribute('class','pay');
						var newPayTextNode = document.createTextNode('식대비용 : ' + company.pay);
						newPayNode.appendChild(newPayTextNode);
						
						var newGuestNode = document.createElement('span');
						newGuestNode.setAttribute('class','guest');
						var newGuestTextNode = document.createTextNode('하객보증인원 : ' + company.guest_num);
						newGuestNode.appendChild(newGuestTextNode);
					
					newInfoNode.appendChild(newNameNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newSidoNode);
					newInfoNode.appendChild(newKindNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newPayNode);
					newInfoNode.appendChild(document.createElement('br'));
					newInfoNode.appendChild(newGuestNode);
				
					newItemNode.appendChild(newInfoNode);
				containerNode.appendChild(newItemNode);
			}
			//window.alert(msg);
		}
	}
}
</script>

</head>
<body onload="searchHall('1')">
<%@include file="../header.jsp" %>
<h1>웨딩홀 검색</h1>
<input type="hidden" name="kind" id="kind" value="${kind }">
<div class="searchbox">
<table>
<tr>
	<th>지역</th>
	<td>
		<select name="sido" id="sido">
			<option>전국</option>
			<option>서울</option>
		</select>
		<select name="sigungu" id="sigungu">
			<option>시군구</option>
			<option>강남구</option>
			<option>동대문구</option>
		</select>
	</td>
</tr>
<tr>
	<th>식대비용</th>
	<td>
		<input type="text" name="payMin" id="payMin">
		<input type="text" name="payMax" id="payMax">
	</td>
</tr>
<tr>
	<th>하객보증인원</th>
	<td>
		<input type="text" name="guestMin" id="guestMin">
		<input type="text" name="guestMax" id="guestMax">
	</td>
</tr>
<tr>
	<th>예식장명</th>
	<td>
		<input type="text" name="name" id="name">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="button" value="검색" onclick="searchHall('1')">
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
			<option value="4" selected="selected">4개씩 보기</option>
			<option value="8">8개씩 보기</option>
			<option value="12">12개씩 보기</option>
		</select>
	</td>
</tr>
</table>
</div>
<div id="totalCnt"></div>
<div class="container" id="container"></div>
<div id="paging"></div>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>