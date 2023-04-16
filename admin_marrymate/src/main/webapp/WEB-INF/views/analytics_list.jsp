<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/admin_marrymate/chart/echarts.min.js"></script>
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
#tb{
	margin-left: 760px;
}
#hr{
	margin-left: 450px;
}
#chart{
	float: left;
	margin-left: 470px;
	width:450px;
	height:380px;
}
#chart2{
	margin-left: 930px;
	width:450px;
	height:380px;
}
.tb_to{
	margin-left: 450px;
}
#dan{
	font-size: 12px;
}
.bu_to{
	width:120px;
	height:35px;
	font-size:16px;
	font-weight:bold;
	color:white;
	background-color:#28A4F6;
	border:0px;
	border-radius:5px;
}

.tb2 {
	text-align: center;
	margin-left: 520px;
}
#but {
	width:120px;
	height:35px;
	font-size:16px;
	font-weight:bold;
	color:white;
	background-color:#b8b8b8;
	border:0px;
	border-radius:5px;
}

.tb3_h {
	margin-left: 560px;
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
		<th width="150"><a href="traffic.do">트래픽</a></th>
		<th width="150"><a href="amount.do">거래금액</a></th>
	</tr>
</table>
<hr width="950" id="hr">
<br>
<table width="950" class="tb_to">
	<tr>
		<th>
		<c:if test="${sb=='s'}">수익내역</c:if>
		<c:if test="${sb=='b'}">비용내역</c:if>
		</th>
	</tr>
</table>
<c:if test="${sb=='s'}">
<br>
<table cellspacing="0" border="1" width="860" class="tb2">
	<thead>
		<tr>
			<th width="200">결제날짜</th>
			<th width="200">결제포인트</th>
			<th width="200">결제금액</th>
			<th>총 결제금액</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach var="dto" items="${amount_all}">
		<tr style="height: 30px;">
			<td>${dto.pay_date}</td>
			<td>${dto.pay_point}</td>
			<td>${dto.pay_money}</td>
			<td>${dto.pay_point+dto.pay_money}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>
<c:if test="${sb=='b'}">
<h4 class="tb3_h">[정산내역]</h4>
<table cellspacing="0" border="1" width="860" class="tb2">
		<tr>
			<th width="200">결제날짜</th>
			<th width="200">결제포인트</th>
			<th width="200">총 결제금액</th>
			<th>정산금액</th>
			
		</tr>
	<c:forEach var="pdto" items="${amount_all}">
		<tr style="height: 30px;">
			<td>${pdto.pay_date}</td>
			<td>${pdto.pay_point}</td>
			<td>${pdto.pay_point+pdto.pay_money}</td>
			<td>${pdto.pay_cal}</td>
		</tr>
	</c:forEach>
</table>
<br>
<h4 class="tb3_h">[환불내역]</h4>
<table cellspacing="0" border="1" width="860" class="tb2">
		<tr>
			<th width="200">환불날짜</th>
			<th width="200">환불포인트</th>
			<th width="200">환불금액</th>
			<th>총 환불금액</th>
		</tr>
	<c:forEach var="rdto" items="${amount_all_b}">
		<tr style="height: 30px;">
			<td>${rdto.rf_date}</td>
			<td>${rdto.rf_point}</td>
			<td>${rdto.rf_money}</td>
			<td>${rdto.rf_point+rdto.rf_money}</td>
		</tr>
	</c:forEach>
</table>
</c:if>
<br><br>
<table width="950" class="tb_to">
	<tr>
		<th><input type="button" value="돌아가기" id="but" onclick="history.back();"></th>
	</tr>
</table>
</form>
<br><br><br><br>
<hr width="1200">
</c:if>
</body>
</html>