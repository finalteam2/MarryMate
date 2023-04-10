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

.text{
	font-family: 'SUIT-Regular';
	font-size: 24px;
	font-weight: bold;
	text-align: center;
}
a{
	text-decoration: none;
	color: black;
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
		<br><br>
		<div class="text">내가 쓴 게시글</div>
		<br>
		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:if test="${empty subInfo }">
			<tr>
				<td colspan="4">작성된 게시글이 없습니다.</td>		
			</tr>
			</c:if>
			<c:forEach var="sub" items="${subInfo }">
					<input type="hidden" name="midx" value=${sub.midx }>
				<tr>
					<td>${sub.bidx }</td>
					<td><a href="content.do?bidx=${sub.bidx }">${sub.subject }</a></td>
					<td>${sub.writedate }</td>
					<td>${sub.watch }</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>
		</div>
		<br><br>
		<div class="s">
		<div class="text">내가 쓴 댓글</div>
		<br>
		<table>
			<thead>
				<tr>
					<th>No.</th>
					<th>본문제목</th>
					<th>댓글내용</th>
					<th>작성날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty replyInfo }">
			<tr>
				<td colspan="4">작성한 댓글이 없습니다.</td>		
			</tr>
			</c:if>
			<c:forEach var="reply" items="${replyInfo }">
					<input type="hidden" name="midx" value=${reply.midx }>
				<tr>
					<td>${reply.ridx }</td>
					<td><a href="content.do?bidx=${reply.bidx }">${reply.subject }</a></td>
					<td>${reply.content }</td>
					<td>${reply.writedate }</td>
				</tr>
			</c:forEach>
			</tbody>	
		</table>
		</div>
		<br><br>
		</div>
	</article>
</section>
<hr>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>