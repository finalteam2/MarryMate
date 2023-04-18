<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포인트관리</title>
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
	bottom: 40px;
	right: 40px;
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
	margin-left: 760px;
}
#hr{
	margin-left: 450px;
}
#tb2 {
	text-align: center;
	margin-left: 520px;
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

.pg {
	position: fixed;
	bottom: 240px;
	left:55%;
	transform:translateX(-50%);
}

#hrf {
	position: fixed;
	bottom: 100px;
	left:50%;
	transform:translateX(-50%);
}
#pop {
	width:100px;
	height:35px;
	font-size:15px;
	font-weight:bold;
	color:white;
	background-color:#078b18;
	border:0px;
	border-radius:5px;
}
#pop2 {
	width:100px;
	height:35px;
	font-size:15px;
	font-weight:bold;
	color:white;
	background-color:#D53834;
	border:0px;
	border-radius:5px;
}
</style>
<script>
function popup(){
	window.open('popup.do','popup','width=600,height=290,top=250,left=550');
}
function popup2(){
	window.open('popup2.do','popup2','width=600,height=290,top=250,left=550');
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
<table height="50" id="tb">
	<tr>
		<th width="150"><a href="pointMinusList.do">차감</a></th>
		<th width="150"><a href="pointPlusList.do">적립</a></th>
	</tr>
</table>
<hr width="950" id="hr">
<c:if test="${mp=='m'}">
<br><br>
<form name="pointMinusList" action="listSelect_p.do">
<input type="hidden" name="mp" value="${mp}">
<select name="selectType" id="select">
	<option>회원번호</option>
	<option>회원명</option>
	<option>업체명</option>
</select>
<input type="text" name="selectText" id="text" placeholder="검색">
&nbsp;<input type="submit" value="검색" id="search">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="포인트 회수" id="pop2" onclick="popup2();">
</form>
<br><br>
<table cellspacing="0" border="1" width="800" id="tb2">
	<thead>
		<tr>
			<th>포인트번호</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>업체명</th>
			<th>차감날짜/시간</th>
			<th>차감포인트</th>
			<th>구분</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="7" align="center">포인트 차감 내역이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
		<tr>
			<td>${dto.p_idx}</td>
			<td>${dto.midx}</td>
			<td>${dto.name}</td>
			<td><c:if test="${!empty dto.cname}">${dto.cname}</c:if><c:if test="${empty dto.cname}">-</c:if></td>
			<td>${dto.p_date}</td>
			<td>${dto.p_cal}</td>
			<td>${dto.p_type}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<br><br><br>
<div style="margin-left:55%;">${pageStr}</div>
</form>
</c:if>
<c:if test="${mp=='p'}">
<br><br>
<form name="pointPlusList" action="listSelect_p.do">
<input type="hidden" name="mp" value="${mp}">
<select name="selectType" id="select">
	<option>회원번호</option>
	<option>회원명</option>
</select>
<input type="text" name="selectText" id="text" placeholder="검색">
&nbsp;<input type="submit" value="검색" id="search">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="포인트 지급" id="pop" onclick="popup();">
</form>
<br><br>
<table cellspacing="0" border="1" width="800" id="tb2">
	<thead>
		<tr>
			<th>포인트번호</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>적립날짜/시간</th>
			<th>적립포인트</th>
			<th>구분</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="6" align="center">포인트 적립 내역이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
		<tr>
			<td>${dto.p_idx}</td>
			<td>${dto.midx}</td>
			<td>${dto.name}</td>
			<td>${dto.p_date}</td>
			<td>${dto.p_cal}</td>
			<td>${dto.p_type}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<br><br>
<div style="margin-left:50%;">${pageStr}</div>
</form>
</c:if>
<br><br><br>
<hr width="1200">
<br><br>
</c:if>
</body>
</html>