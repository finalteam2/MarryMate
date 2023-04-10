<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="/marrymate/css/style.css" rel="stylesheet">
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

body{
	background:#fbf4ff;
}

pre {
    font-family: 'SUIT-Regular';
}
section.sizefix{
	background: #ffffff;
	padding: 20px 20px 20px 20px;
	border-radius: 25px 25px 25px 25px;
	width: 1280px;
	margin: 50px auto;
}

article.sizefix{
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<section class="sizefix">
		<h2>문 의 내 역</h2>
	<div class="accordion" id="accordionExample">
	<c:forEach varStatus="status" var="dto" items="${marr }">
	<article class="sizefix">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="heading${status.count }">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.count }" aria-expanded="false" aria-controls="collapse${status.count }">
	        ${dto.subject }<br><small class="text-muted">${dto.csdate }</small>
	        <c:if test="${dto.is_answered == 0 }"><span style="color: red;">답변대기</span></c:if>
	        <c:if test="${dto.is_answered == 1 }"><span style="color: blue;">답변완료</span></c:if>
	      </button>
	    </h2>
	    <div id="collapse${status.count }" class="accordion-collapse collapse" aria-labelledby="heading${status.count }" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	        ${dto.subject }<br>
	        ${dto.mname } <small class="text-muted">${dto.csdate }</small>
	        <pre>${dto.content }</pre> 
	        <br>
	        ${dto.cname } <small class="text-muted">${dto.ansdate }</small>
	        <c:if test="${dto.is_answered == 0 }"><span style="color: red;">답변대기</span></c:if>
	        <c:if test="${dto.is_answered == 1 }"><span style="color: blue;">답변완료</span></c:if>
	        <br>
	        <pre>${dto.answer }</pre>
	      </div>
	    </div>
	  </div>
	</article>
	</c:forEach>
	<c:forEach varStatus="status" var="dto" items="${carr }">
	<article class="">
	<form action="qnaUpadate.do" method="post">
	<input type="hidden" name="ccsidx" value="${dto.ccsidx }">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="heading${status.count }">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.count }" aria-expanded="false" aria-controls="collapse${status.count }">
	        ${dto.subject }<br><small class="text-muted">${dto.csdate }</small>
	        <c:if test="${dto.is_answered == 0 }"><span style="color: red;">답변대기</span></c:if>
	        <c:if test="${dto.is_answered == 1 }"><span style="color: blue;">답변완료</span></c:if>
	      </button>
	    </h2>
	    <div id="collapse${status.count }" class="accordion-collapse collapse" aria-labelledby="heading${status.count }" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	        ${dto.subject }<br>
	        ${dto.mname } <small class="text-muted">${dto.csdate }</small>
	        <pre>${dto.content }</pre> 
	        <br>
	        ${dto.cname } <small class="text-muted">${dto.ansdate }</small>
	        <c:if test="${dto.is_answered == 0 }"><span style="color: red;">답변대기</span></c:if>
	        <c:if test="${dto.is_answered == 1 }"><span style="color: blue;">답변완료</span></c:if>
	        <br>
	        <pre>${dto.answer }</pre>
	        <c:if test="${dto.is_answered == 0 }">
	      	<div class="mb-3">
	            <label for="message-text" class="col-form-label">답변</label>
	            <textarea class="form-control" id="message-text2" name="answer" placeholder="답변 내용을 작성하세요." required="required" rows="5"></textarea>
	        </div>
	        <div class="mb-3">
	        <button type="submit" class="btn btn-primary">답변하기</button>
	        </div>
	        </c:if>
	      </div>
	    </div>
	  </div>
	</form>
	</article>
	</c:forEach>
	</div>
</section>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>