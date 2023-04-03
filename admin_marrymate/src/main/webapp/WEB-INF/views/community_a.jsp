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
	<c:if test="${param.kind=='공지사항'}">
	<tr>
		<td align="right"><a href="bbsWrite.do"><input type="button" value="글 작성" id="bbsWrite"></a></td>
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
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="4" align="center">게시글 내역이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
	<input type="hidden" name="bidx" value="${dto.bidx}">
		<tr>
			<td><input type="radio" name="remote_con"></td>
			<td>${dto.bidx}</td>
			<td>${dto.subject}</td>
			<td>관리자</td>
			<td>${dto.writedate}</td>
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
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="5" align="center">게시글 내역이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
	<input type="hidden" name="bidx" value="${dto.bidx}">
		<tr>
			<td><input type="radio" name="remote_con"></td>
			<td>${dto.bidx}</td>
			<td>${dto.subject}</td>
			<td>${dto.nick}</td>
			<td>${dto.writedate}</td>
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