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

.viewTable {
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

.viewTable th, .viewTable td {
	padding: 10px;
	font-size: 16px;
	color: #333333;
	border: 1px solid #d9d9d9;
}

.viewTable th {
	background-color: #f2f2f2;
	font-weight: bold;
	text-align: center;
}

.viewTable td {
	text-align: center;
}

.viewTable td a {
	color: #333333;
	text-decoration: none;
}

.viewTable td a:hover {
	color: #555555;
	text-decoration: underline;
}

.viewTable th:first-child, .viewTable td:first-child {
	width: 10%;
}

.viewTable th:nth-child(2), .viewTable td:nth-child(2) {
	width: 30%;
}

.viewTable th:nth-child(3), .viewTable td:nth-child(3) {
	width: 15%;
}

.viewTable th:nth-child(4), .viewTable td:nth-child(4) {
	width: 15%;
}

.viewTable th:nth-child(5), .viewTable td:nth-child(5) {
	width: 5%;
}

.viewTable th:last-child, .viewTable td:last-child {
	width: 5%;
}

.viewTable tr.green-bg {
	background-color: #C5E1A5;
	font-weight: bold;
}

.viewTable tr.pink-bg {
	background-color: #FFE5E5;
	font-weight: bold;
}

.viewNoti {
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
		
.viewNoti th, .viewNoti td {
	padding: 10px;
	font-size: 16px;
	color: #333333;
	border: 1px solid #d9d9d9;
}
		
.viewNoti th {
	background-color: #f2f2f2;
	font-weight: bold;
	text-align: center;
}
		
.viewNoti td {
	text-align: center;
}
		
.viewNoti td a {
	color: #333333;
	text-decoration: none;
}
		
.viewNoti td a:hover {
	color: #555555;
	text-decoration: underline;
}
		
.viewNoti th:first-child, .viewNoti td:first-child {
	width: 10%;
}
		
.viewNoti th:nth-child(2), .viewNoti td:nth-child(2) {
	width: 20%;
}
		
.viewNoti th:nth-child(3), .viewNoti td:nth-child(3) {
	width: 10%;
}
		
.viewNoti th:last-child, .viewNoti td:last-child {
	width: 10%;
}
		
.viewNoti tr.pink-bg {
	background-color: #FFE5E5;
	font-weight: bold;
}

#tableBox {
	height: 630px;
}

#backBox {
	text-align: center;
}

.back-to-board {
  display: inline-block;
  padding: 10px 20px;
  background-color: #007bff;
  color: #fff;
  text-align: center;
  text-decoration: none;
  border-radius: 5px;
}

.back-to-board:hover {
  background-color: #0069d9;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div id="tableBox">
	<h1>"<div style="display:inline">${searchWord}</div>"으로 검색된 결과</h1>
	<c:choose>
		<c:when test="${dto.kind eq '웨딩톡톡'}">
			<table class="viewTable">		
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천</th>
				</tr>
			</thead>
			<tfoot>
			</tfoot>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>
							<c:choose>
								<c:when test="${dto.kind eq '공지사항'}">
									공지
								</c:when>
								<c:otherwise>
									${dto.bidx}
								</c:otherwise>
							</c:choose>
						</td>
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
						<td>
							<c:choose>
								<c:when test="${empty dto.nick}">
									관리자
								</c:when>
								<c:otherwise>
									${dto.nick}
								</c:otherwise>
							</c:choose>
						</td>
						<td>${dto.writedate}</td>
						<td>${dto.watch}</td>
						<td>${dto.best}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:when>
		<c:when test="${dto.kind eq '웨딩후기'}">
			<table class="viewTable">		
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
					<th>추천</th>
				</tr>
			</thead>
			<tfoot>
			</tfoot>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">
					<tr>
						<td>
							<c:choose>
								<c:when test="${dto.kind eq '공지사항'}">
									공지
								</c:when>
								<c:otherwise>
									${dto.bidx}
								</c:otherwise>
							</c:choose>
						</td>
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
						<td>
							<c:choose>
								<c:when test="${empty dto.nick}">
									관리자
								</c:when>
								<c:otherwise>
									${dto.nick}
								</c:otherwise>
							</c:choose>
						</td>
						<td>${dto.writedate}</td>
						<td>${dto.watch}</td>
						<td>${dto.best}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</c:when>
		<c:otherwise>
			<table class="viewNoti">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
					</tr>
				</thead>
				<tfoot>
				</tfoot>
				<tbody>
					<c:if test="${empty list}">
						<tr>
							<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${list}">
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
		</c:otherwise>
	</c:choose>
		<div id="backBox">
			<a href="#" class="back-to-board" onclick="window.history.back()">게시판으로 돌아가기</a>
		</div>
	</div>
	<%@include file="/WEB-INF/views/chatbot.jsp" %>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>