<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
body {
	background-color: #fbf4ff;
	margin: 0;
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

#searchBar {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-bottom: 30px;
}

#searchBar select {
  font-size: 18px;
  padding: 10px;
  margin-right: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

#searchBar input[type="text"] {
  font-size: 18px;
  padding: 10px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

#searchBar input[type="submit"] {
  font-size: 18px;
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

#searchBar input[type="submit"]:hover {
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
    function createInputField() {
        var searchOption = document.getElementsByName("search")[0].value;
        var hiddenField = document.getElementById("hidden-field");
        var inputField = document.getElementById("input-field");
        var submitField = document.getElementById("submit-field");

        if (searchOption == "") {
          inputField.innerHTML = '';
        } else if (searchOption == "title") {
          hiddenField.innerHTML = '<input type="hidden" name="kind" value="웨딩후기">';
          inputField.innerHTML = '<input type="text" name="subject" placeholder="제목 입력">';
          submitField.innerHTML = '<input type="submit" value="검색">';
          document.getElementById("search-form").action = "searchSubject.do";
        } else if (searchOption == "author") {
          hiddenField.innerHTML = '<input type="hidden" name="kind" value="웨딩후기">';  
          inputField.innerHTML = '<input type="text" name="nick" placeholder="작성자 입력">';
          submitField.innerHTML = '<input type="submit" value="검색">';
          document.getElementById("search-form").action = "searchWriter.do";
        } else if (searchOption == "content") {
          hiddenField.innerHTML = '<input type="hidden" name="kind" value="웨딩후기">';  
          inputField.innerHTML = '<input type="text" name="content" placeholder="제목 또는 내용 입력">';
          submitField.innerHTML = '<input type="submit" value="검색">';
          document.getElementById("search-form").action = "searchContent.do";
        }
      }
</script>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
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
				<tr class="each">
					<td>게시판 이동</td>
					<td colspan="2" align="center">
						<a href="notiList.do">공지사항</a>
						<a href="afterList.do">웨딩후기</a>
						<a href="talkList.do">웨딩톡톡</a>
					</td>
					<td colspan="3" align="center" style="background-color: #ffd700;"><a href="write.do" onclick="return checkMidx()">글쓰기</a></td>
				</tr>
			</tfoot>
			<tbody>
				<c:forEach var="fix" items="${listFixA}" begin="0" end="1">
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
				<c:forEach var="best" items="${listBestA}" begin="0" end="1">
					<tr class="green-bg">
						<td>인기</td>
						<c:url var="contentUrl" value="content.do">
							<c:param name="bidx">${best.bidx}</c:param>
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
				<c:if test="${empty listAfter}">
					<tr>
						<td colspan="6" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${listAfter}">
					<tr>
						<td>${dto.bidx}</td>
						<c:url var="contentUrl" value="content.do">
							<c:param name="bidx">${dto.bidx}</c:param>
						</c:url>
						<td>
							<a href="${contentUrl}" class="text-center">
								<c:if test="${!empty dto.horse && '없음' ne dto.horse}">
									[${dto.horse}]
								</c:if>${dto.subject}
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
	</div>
	<div id="searchBar">
		<form method="get" id="search-form">
			<select name="search" onchange="createInputField()">
				<option value="" selected>커뮤니티 검색</option>
				<option value="title">제목</option>
				<option value="author">작성자</option>
				<option value="content">제목+내용</option>
			</select>
			<div id="hidden-field" style="display: inline;"></div>
			<div id="input-field" style="display: inline;"></div>
			<div id="submit-field" style="display: inline;"></div>
		</form>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>