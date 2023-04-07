<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	제목 : ${dto.subject}<br>
	작성자 : ${dto.nick}<br>
	작성일 : ${dto.writedate}<br>
	내용 : ${dto.content}<br>
	<form name="delete" action="delete.do">
		<input type="hidden" name="bidx" value="${dto.bidx}">
		<input type="submit" value="삭제">
	</form>
	<form name="best" action="best.do">
		<input type="hidden" name="midx" value="${sessionScope.loginMidx}">
		<input type="hidden" name="bidx" value="${dto.bidx}">
		<input type="submit" value="추천">
	</form>
	<form name="worst" action="worst.do">
		<input type="hidden" name="midx" value="${sessionScope.loginMidx}">
		<input type="hidden" name="bidx" value="${dto.bidx}">
		<input type="submit" value="비추천">
	</form>
	<h3>댓글</h3>
	<form name="reply" action="reply.do" method="post">
		<input type="hidden" name="bidx" value="${param.bidx}">
		<input type="hidden" name="nick" value="${sessionScope.loginNick}">
		<input type="hidden" name="id" value="${sessionScope.loginId}">
		<textarea name="content" rows="10" cols="50"></textarea><br>
		<input type="submit" value="등록">
	</form>
	<c:forEach var="reply" items="${list}">
		<h3>${reply.nick}</h3>
		${reply.content}<br>
		${reply.writedate}<br>
	</c:forEach>
</body>
</html>