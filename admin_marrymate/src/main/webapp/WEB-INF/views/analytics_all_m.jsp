<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="/admin_marrymate/chart/echarts.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Analytics</title>
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
#tb{
	margin-left: 760px;
}
#hr{
	margin-left: 450px;
}
#chart{
	float: left;
	margin-left: 470px;
	width:910px;
	height:380px;
}
#chart2{
	float: left;
	margin-left: 470px;
	width:910px;
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
</style>
<script>
function draw(){
	drawChart ();
	drawChart2 ();
}


let xAxisData = ['22.05','22.06','22.07','22.08','22.09','22.10','22.11','22.12','23.01','23.02','23.03','23.04']; // x축 데이터 배열 생성

function drawChart () { 
	
		let seriesData = [${traffic_all_m.get(0)},${traffic_all_m.get(1)},${traffic_all_m.get(2)},${traffic_all_m.get(3)},${traffic_all_m.get(4)},
		${traffic_all_m.get(5)},${traffic_all_m.get(6)},${traffic_all_m.get(7)},${traffic_all_m.get(8)},${traffic_all_m.get(9)},
		${traffic_all_m.get(10)},${traffic_all_m.get(11)}]; // 값 데이터 배열 생성
		
	var myChart = echarts.init(document.getElementById('chart'));
	
	option = { // 차트를 그리는데 활용 할 다양한 옵션 정의
		xAxis: {
			type: 'category',
			data: xAxisData // 위에서 정의한 X축 데이터
		},
		yAxis: {
			type: 'value'
		},
		series: [
			{
				data: seriesData, // 위에서 정의한 값 데이터
				type: 'bar' // 버튼의 value 데이터 ('line' or 'bar')
			}
		]
	};
	myChart.setOption(option); // 차트 디스플레이
}

function drawChart2 () { 
	
		let seriesData2 = [${traffic_all_c.get(0)},${traffic_all_c.get(1)},${traffic_all_c.get(2)},${traffic_all_c.get(3)},${traffic_all_c.get(4)},
		${traffic_all_c.get(5)},${traffic_all_c.get(6)},${traffic_all_c.get(7)},${traffic_all_c.get(8)},${traffic_all_c.get(9)},
		${traffic_all_c.get(10)},${traffic_all_c.get(11)}]; // 값 데이터 배열 생성
	
	var myChart = echarts.init(document.getElementById('chart2'));
	
	option = { // 차트를 그리는데 활용 할 다양한 옵션 정의
		xAxis: {
			type: 'category',
			data: xAxisData // 위에서 정의한 X축 데이터
		},
		yAxis: {
			type: 'value'
		},
		series: [
			{
				data: seriesData2, // 위에서 정의한 값 데이터
				type: 'bar' // 버튼의 value 데이터 ('line' or 'bar')
			}
		]
	};
	myChart.setOption(option); // 차트 디스플레이
}
</script>
</head>
<body width="1200" onload="drawChart();drawChart2();">
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
<form name="traffic_all">
<table width="950" class="tb_to">
	<tr>
		<th>
		<c:if test="${mc=='m'}">[일반회원] 회원가입 수</c:if>
		<c:if test="${mc=='c'}">[기업회원] 회원가입 수</c:if>
		</th>
	</tr>
	<tr id="dan">
		<td align="right">(단위: 명)
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>
<c:if test="${mc=='m'}"><div id="chart"></div></c:if>
<c:if test="${mc=='c'}"><div id="chart2"></div></c:if>
<table width="950" class="tb_to">
	<tr>
		<th><input type="button" value="돌아가기" id="but" onclick="history.back();"></th>
	</tr>
</table>
</form>
<br><br><br>
<hr width="1200">
<br><br>
</c:if>
</body>
</html>