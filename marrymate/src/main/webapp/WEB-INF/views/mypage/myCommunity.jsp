<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 커뮤니티</title>
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
		<div class="p">
		<div class="s">
		<div>내가 쓴 글</div>
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
		</div>
		<br><br><br><br>
		<div class="s">
		<div>내가 쓴 댓글</div>
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
		</div>
		</div>
	</article>
</section>
<hr>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>