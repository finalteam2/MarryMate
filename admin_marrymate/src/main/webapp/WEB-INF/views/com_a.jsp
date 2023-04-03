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
.tb2 {
	text-align: center;
	margin-left: 520px;
}
#hr2 {
	margin-left: 515px;
}
#tb3 {
	text-align: center;
	margin-left: 560px;
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
		<c:url var="community_a" value="bbsList.do">
     		<c:param name="kind" value="공지사항" />
		</c:url> 
		<th><a href="${community_a}">커뮤니티 관리</a></th>
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
		<th width="150"><a href="memberList.do">일반회원</a></th>
		<th width="150"><a href="companyList.do">기업회원</a></th>
	</tr>
</table>
<hr width="950" id="hr">
<br><br>
<table height="50" class="tb2" align="center">
	<tr>
		<th width="95">예식장</th>
		<th width="95">스튜디오</th>
		<th width="95">드레스</th>
		<th width="120">헤어/메이크업</th>
		<th width="95">스냅DVD</th>
		<th width="95">주례</th>
		<th width="95">사회</th>
		<th width="95">축가</th>
	</tr>
</table>
<hr width="820" id="hr2">
<br><br>
<form name="companyList" action="companyDetails.do">
<table cellspacing="0" border="1" width="700" id="tb3">
	<thead>
		<tr>
			<th>업체번호</th>
			<th>업체명</th>
			<th>가입날짜/시간</th>
			<th>구분</th>
			<th>업체정보</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="5" align="center">등록된 기업이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
	<input type="hidden" name="cidx" value="${dto.cidx}">
		<tr>
			<td>${dto.cidx}</td>
			<td>${dto.cname}</td>
			<td>${dto.joindate}</td>
			<td>
				<c:if test="${dto.clevel==0}">승인대기</c:if>
				<c:if test="${dto.clevel==-1}">승인거부</c:if>
				<c:if test="${dto.clevel==1}">기업회원</c:if>
			</td>
			<td><input type="submit" value="정보보기"></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
<br>
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
<hr width="1200">
</body>
</html>