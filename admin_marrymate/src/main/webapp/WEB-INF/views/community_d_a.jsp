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
#tb {
	margin-left: 610px;
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
.tb3 {
	text-align: center;
	margin-left: 560px;
}
.tb3_h {
	margin-left: 560px;
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
	bottom: 240px;
	left:55%;
	transform:translateX(-50%);
}

#butt {
	width:65px;
	height:25px;
	font-size:13px;
	font-weight:bold;
	color:white;
	background-color:#078b18;
	border:0px;
	border-radius:5px;
}

#butt1 {
	width:110px;
	height:40px;
	font-size:16px;
	font-weight:bold;
	color:white;
	background-color:#28A4F6;
	border:0px;
	border-radius:5px;
}

#butt2 {
	width:110px;
	height:40px;
	font-size:16px;
	font-weight:bold;
	color:white;
	background-color:#D53834;
	border:0px;
	border-radius:5px;
}

#but {
	width:110px;
	height:40px;
	font-size:16px;
	font-weight:bold;
	color:white;
	background-color:#b8b8b8;
	border:0px;
	border-radius:5px;
}

#hrf {
	position: fixed;
	bottom: 100px;
	left:50%;
	transform:translateX(-50%);
}
</style>
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
		<th><a href="book_a.do">예약관리</a></th>
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
<table cellspacing="0" border="1" width="700" class="tb3">
	<tr style="height: 30px;">
		<th width="150">작성자</th>
		<td width="200">${nick}</td>
		<th width="150">작성일</th>
		<td>${dto.writedate}</td>
	</tr>
	<tr style="height: 30px;">
		<th width="150">제목</th>
		<td colspan="3">${dto.subject}</td>
	</tr>
	<tr style="height: 200px;">
		<td colspan="4">${dto.content}</td>
	</tr>
</table>

<br><br><br>
<c:if test="${dto.kind=='공지사항'}">
<table cellspacing="0" width="700" class="tb3">
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${dto.blind==1}">
			<a href="heajae.do?bidx=${dto.bidx}&kind=${dto.kind}"><input type="button" value="숨김해제" id="butt1"></a>
			</c:if>
			<c:if test="${dto.blind==0}">
			<a href="ceolee.do?bidx=${dto.bidx}&kind=${dto.kind}"><input type="button" value="숨김처리" id="butt2"></a>
			</c:if>
		</td>
		<td width="120">
			<a href="bbsList.do?kind=${dto.kind}"><input type="button" value="돌아가기" id="but"></a>
		</td>
	</tr>
</table>
</c:if>
<c:if test="${dto.kind!='공지사항'}">
<table cellspacing="0" width="700" class="tb3">
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:if test="${dto.blind==1}">
			<a href="chehoi.do?bidx=${dto.bidx}&midx=${dto.midx}"><input type="button" value="불량글 철회" id="butt1"></a>
			</c:if>
			<c:if test="${dto.blind==0}">
			<a href="deuloc.do?bidx=${dto.bidx}&midx=${dto.midx}&kind=${dto.kind}"><input type="button" value="불량글 등록" id="butt2"></a>
			</c:if>
		</td>
		<td width="120">
			<a href="bbsList.do?kind=${dto.kind}"><input type="button" value="돌아가기" id="but"></a>
		</td>
	</tr>
</table>
</c:if>
<hr width="1200" id="hrf">
</c:if>
</body>
</html>