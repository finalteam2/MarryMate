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
</head>
<body>
  <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
  <div class="container-sm my-5">
    <h1 class="mb-3">${dto.subject}</h1>
    <div class="row mb-3">
      <div class="col-auto">
        <span class="me-3">작성자 : ${dto.nick}</span>
        <span class="me-3">작성일 : ${dto.writedate}</span>
      </div>
    </div>
    <div class="mb-3">
      ${dto.content}
    </div>
    <hr>
    <h2 class="mb-3">댓글</h2>
    <form name="reply" action="reply.do" method="post">
	      <input type="hidden" name="bidx" value="${param.bidx}">
		  <input type="hidden" name="nick" value="${sessionScope.loginNick}">
		  <input type="hidden" name="id" value="${sessionScope.loginId}">
      <div class="mb-3">
        <label for="comment">댓글 작성</label>
        <textarea class="form-control" id="comment" name="content" rows="3"></textarea>
      </div>
      <button type="submit" class="btn btn-primary">작성</button>
    </form>
    <hr>
    <div class="mb-3">
      <c:forEach var="reply" items="${list}">
	      <div class="card mt-3">
	        <div class="card-header">
	          ${reply.nick}
	        </div>
	        <div class="card-body">
	          ${reply.content}
	        </div>
	        <div class="card-footer">
	          ${reply.writedate}
	        </div>
	      </div>
      </c:forEach>
    </div>
  </div>
  <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>
