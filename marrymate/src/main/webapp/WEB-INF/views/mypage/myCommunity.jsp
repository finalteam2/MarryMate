<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 커뮤니티</title>
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
		<h2>My 커뮤니티</h2>
		<hr>
		<br>
		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성날짜</th>
					<th>조회수</th>
					<th>추천수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>2</td>
					<td>안녕하세요~</td>
					<td>2023-03-29</td>
					<td>43</td>
					<td>8</td>
				</tr>
				<tr>
					<td>1</td>
					<td>회원가입 했어요!</td>
					<td>2023-03-01</td>
					<td>213</td>
					<td>23</td>
				</tr>
			</tbody>
		</table>
	</article>
</section>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>