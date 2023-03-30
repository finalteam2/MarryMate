<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역</title>
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
}
.t{
	background-color: white;
}
article table tbody td{
	font-family: 'SUIT-Regular';
	font-size: 20px;
	font-weight: bold;
	padding-bottom: 10px;
}
h2{
	font-family: 'SUIT-Regular';
}
</style>
</head>
<body>
<section>
	<article>
		<h2>문 의 내 역</h2>
		<hr>
		<br>
		<table>
			<thead height="60">
				<tr>
					<th>제 목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>답변여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>문의 드려요.</td>
					<td>임토토</td>
					<td>2023-03-30</td>
					<td style="color: red;">답변대기</td>
				</tr>
				<tr>
					<td>문의!</td>
					<td>우성진</td>
					<td>2023-03-28</td>
					<td style="color: blue;">답변완료</td>
				</tr>
			</tbody>
		</table>
		<hr>
	</article>
</section>
</body>
</html>