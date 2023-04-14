<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPoint</title>
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
		<h2>My 포인트</h2>
		<br>
		<div>
			<br><br>
			<table>
				<thead>
					<tr>
						<th>Date.</th>
						<th>포인트</th>
						<th>지급/사용처</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${empty arr}">
						<tr>
							<td colspan="3">포인트 내역이 없습니다.</td>
						</tr>				
					</c:if>
					<c:forEach var="dto" items="${arr }">
					<tr>
						<c:if test="${dto.p_cal==0 }">
							<tr>
							<td colspan="3">포인트 내역이 없습니다.</td>
							</tr>
						</c:if>
						<c:if test="${dto.p_cal!=0 }">
						<td>${dto.p_date }</td>
						<c:if test="${dto.p_cal>0 }">
						<td style='color:blue;'> ${dto.p_cal }</td>
						</c:if>
						<c:if test="${dto.p_cal<0 }">
						<td style='color:red;'>${dto.p_cal }</td>
						</c:if>
						<td>${dto.p_type }</td>
						</c:if>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<br><br>
		</div>
	</article>
</section>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>