<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>MarryMate</title>
	<style>
		body {
			background-color: #fbf4ff;
		}
		h1 {
			color: #333333;
			text-align: center;
			margin-top: 50px;
		}
		table {
			margin-left: auto;
			margin-right: auto;
			margin-bottom: 70px;
			width: 80%;
			min-width: 800px;
			max-width: 1200px;
			border-collapse: collapse;
			box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
			border-radius: 5px;
			background-color: #ffffff;
		}
		th, td {
			padding: 10px;
			font-size: 16px;
			color: #333333;
			border: 1px solid #d9d9d9;
		}
		th {
			background-color: #f2f2f2;
			font-weight: bold;
			text-align: center;
		}
		td {
			text-align: center;
		}
		td a {
			color: #333333;
			text-decoration: none;
		}
		td a:hover {
			color: #555555;
			text-decoration: underline;
		}
		th:first-child, td:first-child {
			width: 10%;
		}
		
		th:nth-child(2), td:nth-child(2) {
			width: 20%;
		}
		
		th:nth-child(3), td:nth-child(3) {
			width: 10%;
		}
		th:last-child, td:last-child {
			width: 10%;
		}
		#left-box {
		    position: absolute;
		    left: 20px;
		    top: 180px;
		    width: 100px;
		    background-color: #f2f2f2;
		    border: 1px solid #d9d9d9;
		    border-radius: 5px;
		    padding-bottom: 15px;
		    text-align: center;
		    font-weight: bold;
		}
		#tableBox {
			height: 500px;
		}
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div id="left-box">
		<h4>게시판 이동</h4>
		<a href="notiList.do">공지사항</a><br><br><br>
		<a href="afterList.do">웨딩후기</a><br><br><br>
		<a href="talkList.do">웨딩톡톡</a>
	</div>
	<div id="tableBox">
	<h1>공지사항</h1>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="4" align="center">${pageStr}</td>
				</tr>
			</tfoot>
			<tbody>
				<c:if test="${empty listNoti}">
					<tr>
						<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${listNoti}">
					<tr>
						<td>공지</td>
						<c:url var="contentUrl" value="content.do">
							<c:param name="bidx">${dto.bidx}</c:param>
						</c:url>
						<td>
							<a href="${contentUrl}" class="text-center">
								<c:if test="${!empty dto.horse && '없음' ne dto.horse}">
									[${dto.horse}]
								</c:if> ${dto.subject}
							</a>
						</td>
						<td>관리자</td>
						<td>${dto.writedate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>