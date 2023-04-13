<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판</title>
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
	width: 30%;
}

th:nth-child(3), td:nth-child(3) {
	width: 15%;
}

th:nth-child(4), td:nth-child(4) {
	width: 15%;
}

th:nth-child(5), td:nth-child(5) {
	width: 5%;
}

th:last-child, td:last-child {
	width: 5%;
}

tr.green-bg {
	background-color: #C5E1A5;
	font-weight: bold;
}

tr.pink-bg {
	background-color: #FFE5E5;
	font-weight: bold;
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

#write-box {
	width: 200px;
	float: right;
	background-color: #3498db;
	border: 1px solid #d9d9d9;
	border-radius: 5px;
	padding-top: 15px;
	padding-bottom: 15px;
	text-align: center;
}
</style>
</head>
<script>
    function checkMidx() {
        if ('${sessionScope.loginMidx}' === '') {
            alert('로그인 후 이용가능합니다.');
            return false;
        }
        return true;
    }
</script>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div id="left-box">
		<h4>게시판 이동</h4>
		<a href="notiList.do">공지사항</a><br><br><br>
		<a href="afterList.do">웨딩후기</a><br><br><br>
		<a href="talkList.do">웨딩톡톡</a>
	</div>
	<div id="tableBox">
		<h1>웨딩톡톡</h1>
		<table>
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
				<tr>
					<td colspan="6" align="center">${pageStr}</td>
				</tr>
			</tfoot>
			<tbody>
				<c:if test="${empty listFixT}">
					<tr>
						<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="fix" items="${listFixT}" begin="0" end="1">
					<tr class="pink-bg">
						<td>인증</td>
						<c:url var="contentUrl" value="content.do">
							<c:param name="bidx">${fix.bidx}</c:param>
						</c:url>
						<td>
							<a href="${contentUrl}" class="text-center">
								<c:if test="${!empty fix.horse && '없음' ne fix.horse}">
									[${fix.horse}]
								</c:if> ${fix.subject}
							</a>
						</td>
						<td>${fix.nick}</td>
						<td>${fix.writedate}</td>
						<td>${fix.watch}</td>
						<td>${fix.best}</td>
					</tr>
				</c:forEach>
				<c:forEach var="best" items="${listBestT}" begin="0" end="1">
					<tr class="green-bg">
						<td>인기</td>
						<c:url var="contentUrl" value="content.do">
							<c:param name="bidx">${dto.bidx}</c:param>
						</c:url>
						<td>
							<a href="${contentUrl}" class="text-center">
								<c:if test="${!empty best.horse && '없음' ne best.horse}">
									[${best.horse}]
								</c:if> ${best.subject}
							</a>
						</td>
						<td>${best.nick}</td>
						<td>${best.writedate}</td>
						<td>${best.watch}</td>
						<td>${best.best}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty listTalk}">
					<tr>
						<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${listTalk}">
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
						<td>${dto.best}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div id="write-box">
			<a href="write.do" style="text-decoration: none; color: white;" onclick="return checkMidx()">글쓰기</a>
		</div>
	</div>
	<div style="clear: both;"></div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>