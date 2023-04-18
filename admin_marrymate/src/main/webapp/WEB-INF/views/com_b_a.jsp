<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기업 회원관리</title>
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

#hrf {
	position: fixed;
	bottom: 100px;
	left:50%;
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
		<th width="150"><a href="memberList.do">일반회원</a></th>
		<th width="150"><a href="companyList.do?kind=예식장">기업회원</a></th>
	</tr>
</table>
<hr width="950" id="hr">
<br><br>
<table height="50" class="tb2" align="center">
	<tr>
		<th width="85"><a href="companyList.do?kind=예식장">예식장</a></th>
		<th width="95"><a href="companyList.do?kind=스튜디오">스튜디오</a></th>
		<th width="85"><a href="companyList.do?kind=드레스">드레스</a></th>
		<th width="115"><a href="companyList.do?kind=헤어메이크업">헤어/메이크업</a></th>
		<th width="95"><a href="companyList.do?kind=스냅DVD">스냅DVD</a></th>
		<th width="65"><a href="companyList.do?kind=주례">주례</a></th>
		<th width="65"><a href="companyList.do?kind=사회">사회</a></th>
		<th width="65"><a href="companyList.do?kind=축가">축가</a></th>
		<th width="85"><a href="companyList_b.do">승인관리</a></th>
	</tr>
</table>
<hr width="820" id="hr2">
<br><br>
<form name="companySel" action="listSelect_com_b.do">
<select name="selectType" id="select">
	<option>업체번호</option>
	<option>업체명</option>
</select>
<input type="text" name="selectText" id="text" placeholder="검색">
&nbsp;<input type="submit" value="검색" id="search">
</form>
<br><br>
<table cellspacing="0" border="1" width="700" id="tb3">
	<thead>
		<tr>
			<th width="100">카테고리</th>
			<th width="80">업체번호</th>
			<th>업체명</th>
			<th width="110">가입날짜/시간</th>
			<th width="80">구분</th>
			<th width="80">업체정보</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="5" align="center">등록된 기업이 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
	<form name="companyList" action="companyDetails.do">
		<input type="hidden" name="kind" value="${dto.kind}">
		<input type="hidden" name="cidx" value="${dto.cidx}">
		<input type="hidden" name="clevel" value="${dto.clevel}">
			<tr>
				<td>${dto.kind}</td>
				<td>${dto.cidx}</td>
				<td>${dto.cname}</td>
				<td>${dto.joindate}</td>
				<td>
					<c:if test="${dto.clevel==0}"><label style="color:#feb916;">승인대기</label></c:if>
					<c:if test="${dto.clevel==-1}"><label style="color:#e34331;">승인거부</label></c:if>
				</td>
				<td><input type="submit" value="정보 보기" id="butt"></td>
			</tr>
	</form>
	</c:forEach>
	</tbody>
</table>
<div id="pg">${pageStr}</div>
<hr width="1200" id="hrf">
</c:if>
</body>
</html>