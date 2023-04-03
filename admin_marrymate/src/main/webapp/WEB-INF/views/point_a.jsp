<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
	margin-left: 760px;
}
#hr{
	margin-left: 450px;
}
#tb2 {
	text-align: center;
	margin-left: 570px;
}
</style>
</head>
<body width="1200">
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
		<th><a href="collection_a.do">웨딩컬렉션 관리</a></th>
	</tr>
	<tr>
		<th><a href="book_a.do">예약관리</a></th>
	</tr>
	<tr>
		<th><a href="bbsList.do?kind=공지사항">커뮤니티 관리</a></th>
	</tr>
	<tr>
		<th><a href="pointMinusList.do">포인트관리</a></th>
	</tr>
	<tr>
		<th><a href="cs_a.do">문의관리</a></th>
	</tr>
	<tr>
		<th><a href="memberList.do">회원관리</a></th>
	</tr>
	<tr>
		<th><a href="analytics.do">Analytics</a></th>
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
<br><br>
<c:if test="${mp=='m'}">
<form name="pointMinusList">
<table cellspacing="0" border="1" width="700" id="tb2">
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
			<td>${dto.cname}</td>
			<td>${dto.p_date}</td>
			<td>${dto.p_cal}</td>
			<td>${dto.p_type}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
</c:if>
<c:if test="${mp=='p'}">
<form name="pointPlusList">
<table cellspacing="0" border="1" width="700" id="tb2">
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
</form>
</c:if>
<br>
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
<hr width="1200">
</body>
</html>