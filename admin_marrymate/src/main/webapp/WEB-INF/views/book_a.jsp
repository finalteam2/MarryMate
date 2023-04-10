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
	margin-left: 525px;
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
<table width="1100" align="center">
	<tr>
		<td align="right"><a href="/marrymate/index.do"><input type="button" value="홈페이지" id="homepage"></a></td>
	</tr>
</table>
<br><br>
<table height="50" class="tb">
	<tr>
		<th width="100">예식장</th>
		<th width="100">스튜디오</th>
		<th width="100">드레스</th>
		<th width="120">헤어/메이크업</th>
		<th width="100">스냅DVD</th>
		<th width="100">주례</th>
		<th width="100">사회</th>
		<th width="100">축가</th>
	</tr>
</table>
<hr width="850" class="tb">
<br><br>
<form name="bookList">
<table cellspacing="0" border="1" width="800" id="tb2">
	<thead>
		<tr>
			<th>예약번호</th>
			<th>회원번호</th>
			<th>회원명</th>
			<th>업체명</th>
			<th>예약날짜/시간</th>
			<th>이용날짜/시간</th>
			<th>금액</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody>
	<c:if test="${empty dtos}">
		<tr>
			<td colspan="8" align="center">예약된 정보가 없습니다.</td>
		</tr>
	</c:if>
	<c:forEach var="dto" items="${dtos}">
	<input type="hidden" name="bk_idx" value="${dto.bk_idx}">
		<tr>
			<td>${dto.bk_idx}</td>
			<td>${dto.midx}</td>
			<td>${dto.name}</td>
			<td>${dto.cname}</td>
			<td>${dto.bookdate}</td>
			<td>${dto.bk_date_time}</td>
			<td>${dto.total_money}</td>
			<td>
			<c:if test="${dto.bk_state==0}">결제전</c:if>
			<c:if test="${dto.bk_state==1}">예약대기</c:if>
			<c:if test="${dto.bk_state==2}">예약확정</c:if>
			<c:if test="${dto.bk_state==3}">잔금 결제완료</c:if>
			<c:if test="${dto.bk_state==4}">예약취소</c:if>
			</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</form>
<br>
<br><br><br><br><br><br><br><br><br><br><br>
<br><br><br><br><br><br><br><br><br><br><br>
<hr width="1200">
</c:if>
</body>
</html>