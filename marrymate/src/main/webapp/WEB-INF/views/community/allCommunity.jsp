<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/css/bootstrap.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.2.3/js/bootstrap.min.js"></script>
  <title>MarryMate</title>
  <style>
    .d-flex.flex-column > a {
      margin-bottom: 20px;
      font-size: 20px;
    }
  </style>
</head>
<body>
  <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
  <div class="container">
    <h1 class="text-center my-3">커뮤니티</h1>
    <div class="row">
      <div class="col-md-2">
        <div class="d-flex flex-column" style="padding-top: 100px; padding-bottom: 100px;">
          <a href="notiList.do" class="btn btn-primary">공지사항</a>
	      <a href="afterList.do" class="btn btn-primary">웨딩후기</a>
	      <a href="talkList.do" class="btn btn-primary">웨딩톡톡</a>
        </div>
      </div>
      <div class="col-md-9">
        <table class="table">
			<thead>
				<tr>
					<th class="text-center">번호</th>
					<th class="text-center">제목</th>
					<th class="text-center">작성자</th>
					<th class="text-center">작성날짜</th>
					<th class="text-center">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty listNoti}">
					<tr>
						<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${listNoti}">
					<tr>
						<td class="text-center">${dto.bidx}</td>
						<c:url var="contentUrl" value="content.do">
							<c:param name="bidx">${dto.bidx}</c:param>
						</c:url>
						<td>
							<a href="${contentUrl}" class="text-center">
							<c:if test="${!empty dto.horse && '없음' ne dto.horse}">
								[${dto.horse}]
							</c:if> 
							${dto.subject}
							</a>
						</td>
						<td class="text-center">${dto.nick}</td>
						<td class="text-center">${dto.writedate}</td>
						<td class="text-center">${dto.watch}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty listAfter}">
					<tr>
						<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${listAfter}">
					<tr>
						<td class="text-center">${dto.bidx}</td>
						<c:url var="contentUrl" value="content.do">
							<c:param name="bidx">${dto.bidx}</c:param>
						</c:url>
						<td>
							<a href="${contentUrl}" class="text-center">
							<c:if test="${!empty dto.horse && '없음' ne dto.horse}">
								[${dto.horse}]
							</c:if> 
							${dto.subject}
							</a>
						</td>
						<td class="text-center">${dto.nick}</td>
						<td class="text-center">${dto.writedate}</td>
						<td class="text-center">${dto.watch}</td>
					</tr>
				</c:forEach>
				<c:if test="${empty listTalk}">
					<tr>
						<td colspan="5" align="center">등록된 게시글이 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${listTalk}">
					<tr>
						<td class="text-center">${dto.bidx}</td>
						<c:url var="contentUrl" value="content.do">
							<c:param name="bidx">${dto.bidx}</c:param>
						</c:url>
						<td>
							<a href="${contentUrl}" class="text-center">
							<c:if test="${!empty dto.horse && '없음' ne dto.horse}">
								[${dto.horse}]
							</c:if> 
							${dto.subject}
							</a>
						</td>
						<td class="text-center">${dto.nick}</td>
						<td class="text-center">${dto.writedate}</td>
						<td class="text-center">${dto.watch}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
      </div>
    </div>
    <div class="d-flex justify-content-end mt-3">
	  <a href="write.do" class="btn btn-primary" style="margin-bottom: 20px; margin-right: 110px;">글쓰기</a>
	</div>
  </div>
  <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>

