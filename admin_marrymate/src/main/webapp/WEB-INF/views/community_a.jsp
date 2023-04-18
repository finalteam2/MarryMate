<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티 관리</title>
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
#tb {
	margin-left: 610px;
}
#hr{
	margin-left: 450px;
}
#tb2 {
	text-align: center;
	margin-left: 525px;
}
#bbsWrite{
	width:150px;
	height:45px;
	font-size:18px;
	font-weight:bold;
	color:white;
	background-color:#28A4F6;
	border:0px;
	border-radius:5px;
	position: fixed;
	bottom: 210px;
	right: 280px;
	margin: 0px auto;
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
</style>
<script type="text/javascript" src="js/httpRequest.js"></script>
<script>
function bi_bbs(bidx){
	
	var param='bidx='+bidx;
	sendRequest('bi_bbs.do',param,'GET',bi_bbsResult);
}
function bi_bbsResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=JSON.parse(data);
			
			var TdNode=document.getElementById('bt_in'+data.bidx);
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
				newInputNode.setAttribute('onclick','sd_bbs('+data.bidx+');');
			}else{
				var newInputNode=document.createElement('input');
				newInputNode.setAttribute('type','button');
				newInputNode.setAttribute('value','고정해제');
				newInputNode.setAttribute('id','hj');
				newInputNode.setAttribute('onclick','hj_bbs('+data.bidx+');');
			}
			
			var TdNode=document.getElementById('bt_in'+data.bidx);
			
			TdNode.appendChild(newInputNode);
		}
	}
}

function sd_bbs(bidx){
	var param='bidx='+bidx;
	sendRequest('sd_bbs.do',param,'GET',sd_bbsResult);
}
function sd_bbsResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=JSON.parse(data);
			
			window.alert(data.msg);
			location.href=data.goUrl;
		}
	}
}

function hj_bbs(bidx){
	var param='bidx='+bidx;
	sendRequest('hj_bbs.do',param,'GET',hj_bbsResult);
}
function hj_bbsResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data=XHR.responseText;
			data=JSON.parse(data);
			
			window.alert(data.msg);
			location.href=data.goUrl;
		}
	}
}

function pop_bbs(){
	window.open('pop_bbs.do','pop_bbs','width=600,height=290,top=250,left=550');
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
	<c:if test="${param.kind=='공지사항'}">
	<tr>
		<td align="right"><input type="button" value="글 작성" id="bbsWrite" onclick="pop_bbs();"></td>
	</tr>
	</c:if>
	<tr>
		<td align="right"><a href="/marrymate/index.do"><input type="button" value="홈페이지" id="homepage"></a></td>
	</tr>
</table>
<br><br>
<table height="50" id="tb">
	<tr>
		<th width="150"><a href="bbsList.do?kind=공지사항">공지사항</a></th>
		<th width="150"><a href="bbsList.do?kind=웨딩후기">웨딩후기</a></th>
		<th width="150"><a href="bbsList.do?kind=웨딩톡톡">웨딩톡톡</a></th>
		<th width="150"><a href="bbsList_b.do">불량글관리</a></th>
	</tr>
</table>
<hr width="950" id="hr">
<br><br>
<form name="bbsList" action="listSel_bbs.do">
<input type="hidden" name="kind" value="${param.kind}">
<select name="selectType" id="select">
	<option>게시글번호</option>
	<option>제목</option>
</select>
<input type="text" name="selectText" id="text" placeholder="검색">
&nbsp;<input type="submit" value="검색" id="search">
</form>
<br><br>
<c:if test="${param.kind=='공지사항'}">
<form name="bbsList_g">
<table cellspacing="0" border="1" width="800" id="tb2">
	<thead>
		<tr>
			<th></th>
			<th>게시글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="6" align="center">게시글 내역이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
		<c:if test="${dto.topfix==1}"><tr style="background-color: lightyellow; height: 30px;"></c:if>
		<c:if test="${dto.topfix==0}"><c:if test="${dto.blind==0}"><tr style="height: 30px;"></c:if></c:if>
		<c:if test="${dto.blind==1}"><tr style="background-color: lightgray; height: 30px;"></c:if>
			<td width="30"><input type="button" onclick="bi_bbs(${dto.bidx});" style="height: 17px;"></td>
			<td width="100">${dto.bidx}</td>
			<td><a href="bbsContent.do?bidx=${dto.bidx}&nick=관리자">${dto.subject}</a></td>
			<td width="130">관리자</td>
			<td width="100">${dto.writedate}</td>
			<c:if test="${dto.blind==1}">
			<td width="120"></td>
			</c:if>
			<c:if test="${dto.blind==0}">
			<td width="120" id="bt_in${dto.bidx}" class="bt_in"></td>
			</c:if>
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
</c:if>
<c:if test="${param.kind=='웨딩후기' || param.kind=='웨딩톡톡'}">
<form name="bbsList_w">
<table cellspacing="0" border="1" width="800" id="tb2">
	<thead>
		<tr>
			<th></th>
			<th>게시글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th></th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="6" align="center">게시글 내역이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
		<c:if test="${dto.topfix==1}"><tr style="background-color: lightyellow; height: 30px;"></c:if>
		<c:if test="${dto.topfix==0}"><c:if test="${dto.blind==0}"><tr style="height: 30px;"></c:if></c:if>
		<c:if test="${dto.blind==1}"><tr style="background-color: lightgray; height: 30px;"></c:if>
			<td width="30"><input type="button" onclick="bi_bbs(${dto.bidx});" style="height: 17px;"></td>
			<td width="100">${dto.bidx}</td>
			<td><a href="bbsContent.do?bidx=${dto.bidx}&nick=${dto.nick}">${dto.subject}</a></td>
			<td width="130">${dto.nick}</td>
			<td width="100">${dto.writedate}</td>
			<c:if test="${dto.blind==1}">
			<td width="120"></td>
			</c:if>
			<c:if test="${dto.blind==0}">
			<td width="120" id="bt_in${dto.bidx}" class="bt_in"></td>
			</c:if>
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
</c:if>
<div id="pg">${pageStr}</div>
<hr width="1200" id="hrf">
</c:if>
</body>
</html>