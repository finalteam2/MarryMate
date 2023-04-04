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
	height:450px;
}
#chart2{
	margin-left: 930px;
	width:450px;
	height:450px;
}
#chart3{
	float: left;
	margin-left: 470px;
	width:450px;
	height:450px;
}
#chart4{
	margin-left: 930px;
	width:450px;
	height:450px;
}
</style>
<script>
let xAxisData = ['22.12','23.01','23.02','23.03','23.04']; // x축 데이터 배열 생성

function drawChart () { 
	let seriesData = [${traffic_m.get(0)},${traffic_m.get(1)},${traffic_m.get(2)},${traffic_m.get(3)},${traffic_m.get(4)}]; // 값 데이터 배열 생성
	
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
	let seriesData2 = [${traffic_c.get(0)},${traffic_c.get(1)},${traffic_c.get(2)},${traffic_c.get(3)},${traffic_c.get(4)}]; // 값 데이터 배열 생성
	
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

function drawChart3 () { 
	let seriesData3 = [${amount_s.get(0)},${amount_s.get(1)},${amount_s.get(2)},${amount_s.get(3)},${amount_s.get(4)}]; // 값 데이터 배열 생성
	
	var myChart = echarts.init(document.getElementById('chart3'));
	
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
				data: seriesData3, // 위에서 정의한 값 데이터
				type: 'bar' // 버튼의 value 데이터 ('line' or 'bar')
			}
		]
	};
	myChart.setOption(option); // 차트 디스플레이
}

function drawChart4 () { 
	let seriesData2 = [${amount_b.get(0)},${amount_b.get(1)},${amount_b.get(2)},${amount_b.get(3)},${amount_b.get(4)}]; // 값 데이터 배열 생성
	
	var myChart = echarts.init(document.getElementById('chart4'));
	
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
				data: seriesData4, // 위에서 정의한 값 데이터
				type: 'bar' // 버튼의 value 데이터 ('line' or 'bar')
			}
		]
	};
	myChart.setOption(option); // 차트 디스플레이
}
</script>
</head>
<body width="1200" onload="drawChart();drawChart2();drawChart3();drawChart4();">
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
<c:if test="${ta=='t'}">
<form name="traffic">
<div id="chart"></div>
<div id="chart2"></div>
</form>
</c:if>

<c:if test="${ta=='a'}">
<form name="amount">
<div id="chart3"></div>
<div id="chart4"></div>
</form>
</c:if>
<br>
<hr width="1200">
</body>
</html>