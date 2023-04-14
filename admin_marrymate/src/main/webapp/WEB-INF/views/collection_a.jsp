<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
body{
    background: #fbf4ff;
}

.label{
	font-size:18px;
}
#logout{
	width:110px;
	height:45px;
	font-size:16px;
	font-weight:bold;
	background-color:lightgray;
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
#menu{
	text-align:center;
	position: fixed;
	top: 150px;
	left: 250px;
	margin: 0px auto;
}
.tb {
	margin-left: 500px;
}
#tb2 {
	text-align: center;
	margin-left: 610px;
}

#select {
	margin-left: 700px;
	width:100px;
	height:30px;
	font-size:15px;
}

#text{
	width:220px;
	height:25px;
	font-size:16px;
}

#search {
	width:60px;
	height:30px;
	font-size:15px;
	font-weight:bold;
	color:white;
	background-color:#0a95f1;
	border:0px;
	border-radius:5px;
}

#pg {
	position: fixed;
	bottom: 205px;
	left:55%;
	transform:translateX(-50%);
}

#hrf {
	position: fixed;
	bottom: 100px;
	left:50%;
	transform:translateX(-50%);
}

#sd {
	width:65px;
	height:25px;
	font-size:13px;
	font-weight:bold;
	color:white;
	background-color:#00a600;
	border:0px;
	border-radius:5px;
}

#hj {
	width:65px;
	height:25px;
	font-size:13px;
	font-weight:bold;
	color:white;
	background-color:#cc0000;
	border:0px;
	border-radius:5px;
}

#sg {
	width:45px;
	height:25px;
	font-size:13px;
	font-weight:bold;
	color:#444444;
	background-color:#cecece;
	border:0px;
	border-radius:5px;
}
</style>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function bi(cidx){
	
	var param='cidx='+cidx;
	sendRequest('bi.do',param,'GET',biResult);
}
function biResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=JSON.parse(data);
			
			var TdNode=document.getElementById('bt_in'+data.cidx);
			var TdChildNodes=TdNode.childNodes;
			for(var i=TdChildNodes.length-1;i>=0;i--) {
				var TdChildNode=TdChildNodes[i];
				TdNode.removeChild(TdChildNode);
			}
			
			var topfix=data.topfix;
			
			if(topfix==0){
				var newInputNode=document.createElement('input');
				newInputNode.setAttribute('type','button');
				newInputNode.setAttribute('value','상단고정');
				newInputNode.setAttribute('id','sd');
				newInputNode.setAttribute('onclick','sd('+data.cidx+');');
			}else{
				var newInputNode=document.createElement('input');
				newInputNode.setAttribute('type','button');
				newInputNode.setAttribute('value','고정해제');
				newInputNode.setAttribute('id','hj');
				newInputNode.setAttribute('onclick','hj('+data.cidx+');');
			}
			var newTextNode=document.createTextNode(' ');
			var newInputNode2=document.createElement('input');
			newInputNode2.setAttribute('type','button');
			newInputNode2.setAttribute('value','숨김');
			newInputNode2.setAttribute('id','sg');
			newInputNode2.setAttribute('onclick','sg('+data.cidx+');');
			
			var TdNode=document.getElementById('bt_in'+data.cidx);
			
			TdNode.appendChild(newInputNode);
			TdNode.appendChild(newTextNode);
			TdNode.appendChild(newInputNode2);
		}
	}
}

function sd(cidx){
	var param='cidx='+cidx;
	sendRequest('sd.do',param,'GET',sdResult);
}
function sdResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=JSON.parse(data);
			
			window.alert(data.msg);
			location.href=data.goUrl;
		}
	}
}

function hj(cidx){
	var param='cidx='+cidx;
	sendRequest('hj.do',param,'GET',hjResult);
}
function hjResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=JSON.parse(data);
			
			window.alert(data.msg);
			location.href=data.goUrl;
		}
	}
}

function sg(cidx){
	var param='cidx='+cidx;
	sendRequest('sg.do',param,'GET',sgResult);
}
function sgResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=JSON.parse(data);
			
			window.alert(data.msg);
			location.href=data.goUrl;
		}
	}
}
</script>
</head>
<body width="1200">
<c:if test="${empty sessionScope.name}">
<script>
	window.alert('로그인 후 이용가능합니다.');
	location.href='login.do';
</script>
</c:if>
<c:if test="${!empty sessionScope.name}">
<table width="1100" align="center">
	<tr>
		<td align="left">
			<a href="index.do"><img src="/admin_marrymate/img/logo.png" alt="logo" width="200" height="97"></a>
		</td>
		<td align="right">
			<table height="65">
				<tr>
					<th align="left"><label class="label">이름: ${sessionScope.name}님</label></th>
					<td rowspan="2" width="160" align="right">
						<a href='logout.do'><input type="button" value="로그아웃" id="logout" onclick=""></a>
					</td>
				</tr>
				<tr>
					<th align="left"><label class="label">부서: ${sessionScope.dept}</label></th>
				</tr>
			</table>
		</td>
	</tr>
</table>
<hr width="1200">
<table height="455" width="160" border="1" cellspacing="0" id="menu">
	<tr>
		<th><a href="collectionList.do?kind=예식장">웨딩컬렉션 관리</a></th>
	</tr>
	<tr>
		<th><a href="bookList.do?kind=예식장">예약관리</a></th>
	</tr>
	<tr>
		<th><a href="bbsList.do?kind=공지사항">커뮤니티 관리</a></th>
	</tr>
	<tr>
		<th><a href="pointMinusList.do">포인트관리</a></th>
	</tr>
	<tr>
		<th><a href="cs_a_m.do">문의관리</a></th>
	</tr>
	<tr>
		<th><a href="memberList.do">회원관리</a></th>
	</tr>
	<tr>
		<th><a href="traffic.do">Analytics</a></th>
	</tr>
</table>
<table width="1100" align="center">
	<tr>
		<td align="right"><a href="/marrymate/index.do"><input type="button" value="홈페이지" id="homepage"></a></td>
	</tr>
</table>
<br><br>
<table height="50" class="tb" align="center">
	<tr>
		<th width="90"><a href="collectionList.do?kind=예식장">예식장</a></th>
		<th width="100"><a href="collectionList.do?kind=스튜디오">스튜디오</a></th>
		<th width="90"><a href="collectionList.do?kind=드레스">드레스</a></th>
		<th width="120"><a href="collectionList.do?kind=헤어메이크업">헤어/메이크업</a></th>
		<th width="100"><a href="collectionList.do?kind=스냅DVD">스냅DVD</a></th>
		<th width="70"><a href="collectionList.do?kind=주례">주례</a></th>
		<th width="70"><a href="collectionList.do?kind=사회">사회</a></th>
		<th width="70"><a href="collectionList.do?kind=축가">축가</a></th>
		<th width="100"><a href="collectionList_b.do">숨김관리</a></th>
	</tr>
</table>
<hr width="850" class="tb">
<br><br>
<form name="collectionList" action="listSelect.do">
<input type="hidden" name="kind" value="${param.kind}">
<select name="selectType" id="select">
	<option>업체번호</option>
	<option>업체명</option>
</select>
<input type="text" name="selectText" id="text" placeholder="검색">
&nbsp;<input type="submit" value="검색" id="search">
</form>
<br><br>
<table cellspacing="0" border="1" width="600" id="tb2">
	<thead>
		<tr>
			<th></th>
			<th>업체번호</th>
			<th>업체명</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="4" align="center">등록된 기업이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
		<c:if test="${dto.topfix==1}"><tr style="background-color: lightyellow; height: 30px;"></c:if>
		<c:if test="${dto.topfix==0}"><c:if test="${dto.blind==0}"><tr style="height: 30px;"></c:if></c:if>
		<c:if test="${dto.blind==1}"><tr style="background-color: lightgray; height: 30px;"></c:if>
			<td width="30"><input type="button" onclick="bi(${dto.cidx});" style="height: 17px;"></td>
			<td width="95">${dto.cidx}</td>
			<td width="315">${dto.cname}</td>
			<c:if test="${dto.blind==1}">
			<td></td>
			</c:if>
			<c:if test="${dto.blind==0}">
			<td id="bt_in${dto.cidx}" class="bt_in"></td>
			</c:if>
		</tr>
	</c:forEach>
	</tbody>
</table>
<div id="pg">${pageStr}</div>
<hr width="1200" id="hrf">
</c:if>
</body>
</html>