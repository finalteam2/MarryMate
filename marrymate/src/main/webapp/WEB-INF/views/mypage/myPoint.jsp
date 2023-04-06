<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 포인트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<link href="/marrymate/css/style.css" rel="stylesheet">
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
article table{
	width: 60%;
	margin: auto;
	border-collapse: collapse;
	text-align: center;	
}
article table thead{
	border-bottom: 20px solid white;
	background-color: #c797eb;
}
article table thead th{
	color: white;
	font-family: 'SUIT-Regular';
	font-size: 20px;
	font-weight: bold;
	padding-top: 15px;
	padding-bottom: 15px;
}
article table tbody td{
	font-family: 'SUIT-Regular';
	font-size: 20px;
	font-weight: bold;
	padding-top: 16px;
	padding-bottom: 10px;
	border-bottom: 1px solid black; 
}
h2{
	font-family: 'SUIT-Regular';
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<h2>My 포 인 트</h2>
		<hr>
		<br>
		<table>
			<thead>
				<tr>
					<th>Date.</th>
					<th>업체명</th>
					<th>포인트</th>
					<th>적립/차감</th>
					<th>구분</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2023-03-31</td>
					<td>이젠스튜디오</td>
					<td style="color:red;">10000</td>
					<td>차감</td>
					<td>예약금</td>
				</tr>
				<tr>
					<td>2023-03-19</td>
					<td>메리메이트</td>
					<td style="color:blue;">3000</td>
					<td>적립</td>
					<td>이벤트</td>
				</tr>
			</tbody>
		</table>
		<hr>
	</article>
</section>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>