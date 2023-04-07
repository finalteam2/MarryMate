<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>marrymate</title>
<style>
	table {
		width: 1000px;
		margin: auto;
		text-align: center;
	}
</style>
</head>
<body>
	<div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
					${pageStr}
					</td>
					<td><a href="write.do">글쓰기</a></td>
				</tr>
			</tfoot>
			<tbody>
				<c:if test="${empty listNoti}">
					<tr>
						<td colspan="5" align="center">
						등록된 게시글이 없습니다.
						</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${listNoti}">
					<tr>
						<td>${dto.bidx}</td>
						<c:url var="contentUrl" value="content.do">
							<c:param name="bidx">${dto.bidx}</c:param>
						</c:url>
						<td>
							<c:if test="${!empty dto.horse ||'없음' eq dto.horse}">
							[${dto.horse}]
							</c:if>
							<a href="${contentUrl}">${dto.subject}</a>
						</td>
						<td>${dto.nick}</td>
						<td>${dto.writedate}</td>
						<td>${dto.watch}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>