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
	margin-bottom: 30px;
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

.each td a {
  display: inline-block;
  width: 20%;
  text-align: center;
  margin-right: 10px;
  font-weight: bold;
  font-size: 20px;
}

.each td a:last-child {
  margin-right: 0;
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
	<div id="tableBox">
	<h1>"<div style="display:inline">${searchWord}</div>"으로 검색된 결과</h1>
		<table class="noti">		
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
				<tr class="each">
					<td>게시판 이동</td>
					<td colspan="2" align="center">
					    <a href="notiList.do">공지사항</a>
						<a href="afterList.do">웨딩후기</a>
						<a href="talkList.do">웨딩톡톡</a>
					</td>
					<td colspan="3" align="center">
						<a href="write.do" onclick="return checkMidx()">글쓰기</a>
					</td>
				</tr>
			</tfoot>
			<tbody>
				<c:if test="${empty list}">
					<tr>
						<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${list}">
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
		<div id="backBox">
			<a href="#" class="back-to-board" onclick="window.history.back()">게시판으로 돌아가기</a>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>