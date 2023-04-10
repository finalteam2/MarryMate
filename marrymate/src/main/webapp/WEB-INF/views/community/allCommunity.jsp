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
			text-align: left;
			margin-left: 150px;
			margin-top: 50px;
		}
		h4 {
			text-align: center;
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
	</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<h1>커뮤니티</h1>
	<h4><a href="notiList.do">공지사항</a></h4>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty listNoti}">
				<tr>
					<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${listNoti}" begin="0" end="1">
				<tr>
					<td>${dto.bidx}</td>
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
					<td>${dto.nick}</td>
					<td>${dto.writedate}</td>
					<td>${dto.watch}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h4><a href="afterList.do">웨딩후기</a></h4>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty listAfter}">
				<tr>
					<td colspan="4" align="center">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${listAfter}" begin="0" end="1">
				<tr>
					<td>${dto.bidx}</td>
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
					<td>${dto.nick}</td>
					<td>${dto.writedate}</td>
					<td>${dto.watch}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<h4><a href="talkList.do">웨딩톡톡</a></h4>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty listTalk}">
				<tr>
					<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
				</tr>
			</c:if>
			<c:forEach var="dto" items="${listTalk}" begin="0" end="1">
				<tr>
					<td>${dto.bidx}</td>
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
					<td>${dto.nick}</td>
					<td>${dto.writedate}</td>
					<td>${dto.watch}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>