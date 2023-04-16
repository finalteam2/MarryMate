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
	margin-left: 495px;
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
<table height="50" class="tb">
	<tr>
		<th width="90"><a href="bookList.do?kind=예식장">예식장</a></th>
		<th width="100"><a href="bookList.do?kind=스튜디오">스튜디오</a></th>
		<th width="90"><a href="bookList.do?kind=드레스">드레스</a></th>
		<th width="120"><a href="bookList.do?kind=헤어메이크업">헤어/메이크업</a></th>
		<th width="100"><a href="bookList.do?kind=스냅DVD">스냅DVD</a></th>
		<th width="70"><a href="bookList.do?kind=주례">주례</a></th>
		<th width="70"><a href="bookList.do?kind=사회">사회</a></th>
		<th width="70"><a href="bookList.do?kind=축가">축가</a></th>
		<th width="100"><a href="bookList_b.do">취소관리</a></th>
	</tr>
</table>
<hr width="850" class="tb">
<br><br>
<form name="bookList" action="listSel_bk_b.do">
<select name="selectType" id="select">
	<option>예약번호</option>
	<option>회원번호</option>
	<option>회원명</option>
	<option>업체명</option>
</select>
<input type="text" name="selectText" id="text" placeholder="검색">
&nbsp;<input type="submit" value="검색" id="search">
</form>
<br><br>
<form name="bookList">
<table cellspacing="0" border="1" width="860" id="tb2">
	<thead>
		<tr>
			<th>예약번호</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>업체명</th>
			<th>예약날짜/시간</th>
			<th>이용날짜/시간</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="7" align="center">예약된 정보가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
	<input type="hidden" name="bk_idx" value="${dto.bk_idx}">
		<tr style="height: 30px;">
			<td><a href="bookDetails.do?bk_state=${dto.bk_state}&bk_idx=${dto.bk_idx}&kind=${kind}${dto.kind}">${dto.bk_idx}</a></td>
			<td>${dto.midx}</td>
			<td>${dto.name}</td>
			<td>${dto.cname}</td>
			<td>${dto.bookdate}</td>
			<td>${dto.bk_date_time}</td>
			<td>
			<c:if test="${dto.bk_state==4}"><label style="color:#e34331;">예약취소</label></c:if>
			<c:if test="${dto.bk_state==5}"><label style="color:#feb916;">취소대기</label></c:if>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
<div id="pg">${pageStr}</div>
<hr width="1200" id="hrf">
</c:if>
</body>
</html>