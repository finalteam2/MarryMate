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
<h2 class="tb3_h">업체정보</h2>
<table cellspacing="0" border="1" width="700" class="tb3">
	<tr>
		<th>업체번호</th>
		<td>${comDto.cidx}</td>
		<th>업체명</th>
		<td>${comDto.cname}</td>
	</tr>
	<tr>
		<th>사업자등록번호</th>
		<td>${comDto.cnum}</td>
		<th>가입날짜/시간</th>
		<td>${comDto.joindate}</td>
	</tr>
</table>
<br>
<h2 class="tb3_h">업체이미지</h2>
<img src="/marrymate/img/com_best/${comDto.img}" width="300" class="tb3">

<c:if test="${kind=='예식장'}">
<br><br>
<h2 class="tb3_h">홀</h2>
<table cellspacing="0" border="1" width="700" class="tb3">
	<tr>
		<th>홀 명칭</th>
		<th>죄석 수</th>
		<th>홀 사용료</th>
		<th>보증인원</th>
	</tr>
	<c:forEach var="hdto" items="${hallDtos}">
	<tr>
		<td>${hdto.name}</td>
		<td>${hdto.seat_num}</td>
		<td>${hdto.pay}</td>
		<td>${hdto.guest_num}</td>
	</tr>
	</c:forEach>
</table>
<br>
<h2 class="tb3_h">식대</h2>
<table cellspacing="0" border="1" width="700" class="tb3">
	<tr>
		<th>메뉴명</th>
		<th>가격</th>
	</tr>
	<c:forEach var="fdto" items="${foodDtos}">
	<tr>
		<td>${fdto.name}</td>
		<td>${fdto.pay}</td>
	</tr>
	</c:forEach>
</table>
</c:if>
<c:if test="${kind!='예식장'}">
<br><br>
<h2 class="tb3_h">금액</h2>
<table cellspacing="0" border="1" width="400" class="tb3">
	<tr>
		<th>금액</th>
		<td>${comDto.pay}</td>
	</tr>
</table>
</c:if>
<br>
<h2 class="tb3_h">업체소개</h2>
<table cellspacing="0" border="1" width="700" class="tb3">
	<tr>
		<td>${comDto.intro}</td>
	</tr>
</table>
<br><br><br>
<c:if test="${clevel==0}">
<table cellspacing="0" width="700" class="tb3">
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="ok.do?cidx=${comDto.cidx}&kind=${kind}"><input type="button" value="가입승인" id="butt1"></a>
			&nbsp;<a href="no.do?cidx=${comDto.cidx}&kind=${kind}"><input type="button" value="승인거절" id="butt2"></a>
			
		</td>
		<td width="120">
			<input type="button" value="돌아가기" id="but" onclick="history.back();">
		</td>
	</tr>
</table>
</c:if>
<c:if test="${clevel==-1}">
<table cellspacing="0" width="700" class="tb3">
	<tr>
		<td>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="ok.do?cidx=${comDto.cidx}&kind=${kind}"><input type="button" value="가입승인" id="butt1"></a>
			
		</td>
		<td width="120">
			<input type="button" value="돌아가기" id="but" onclick="history.back();">
		</td>
	</tr>
</table>
</c:if>
<c:if test="${clevel==1}">
<table cellspacing="0" width="700" class="tb3">
	<tr>
		<td>
			<input type="button" value="돌아가기" id="but" onclick="history.back();">
		</td>
	</tr>
</table>
</c:if>
<br><br><br>
<hr width="1200">
<br><br>
</c:if>
</body>
</html>