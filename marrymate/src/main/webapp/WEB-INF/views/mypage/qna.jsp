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
article table{
	width: 60%;
	margin: auto;
	border-collapse: collapse;
	text-align: center;	
}
article table thead{
	border-bottom: 20px solid white;
	background-color: #c797eb;
}
article table thead th{
	color: white;
	font-family: 'SUIT-Regular';
	font-size: 20px;
	font-weight: bold;
}
.t{
	background-color: white;
}
article table tbody td{
	font-family: 'SUIT-Regular';
	font-size: 20px;
	font-weight: bold;
	padding-bottom: 10px;
}
h2{
	font-family: 'SUIT-Regular';
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<h2>문 의 내 역</h2>
		<hr>
		<br>
		<table>
			<thead height="60">
				<tr>
					<th>제 목</th>
					<th>작성자</th>
					<th>작성날짜</th>
					<th>답변여부</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>문의 드려요.</td>
					<td>임토토</td>
					<td>2023-03-30</td>
					<td style="color: red;">답변대기</td>
				</tr>
				<tr>
					<td>문의!</td>
					<td>우성진</td>
					<td>2023-03-28</td>
					<td style="color: blue;">답변완료</td>
				</tr>
			</tbody>
		</table>
		<hr>
	</article>
</section>

<div class="accordion" id="accordionExample">
<c:forEach varStatus="status" var="dto" items="${marr }">
  <div class="accordion-item">
    <h2 class="accordion-header" id="heading${status.count }">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.count }" aria-expanded="false" aria-controls="collapse${status.count }">
        ${dto.cname } ${dto.subject } ${dto.csdate } ${dto.mname }
        <c:if test="${dto.is_answered == 0 }"><span style="color: red;">답변대기</span></c:if>
        <c:if test="${dto.is_answered == 1 }"><span style="color: blue;">답변완료</span></c:if>
      </button>
    </h2>
    <div id="collapse${status.count }" class="accordion-collapse collapse" aria-labelledby="heading${status.count }" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        ${dto.content } 
        <br>
        ${dto.cname }
        <c:if test="${dto.is_answered == 0 }"><span style="color: red;">답변대기</span></c:if>
        <c:if test="${dto.is_answered == 1 }"><span style="color: blue;">답변완료</span></c:if>
        <br>
        ${dto.answer }
      	답변일 : ${dto.ansdate } 
      </div>
    </div>
  </div>
</c:forEach>
<c:forEach varStatus="status" var="dto" items="${carr }">
<form action="qnaUpadate.do" method="post">
<input type="hidden" name="ccsidx" value="${dto.ccsidx }">
  <div class="accordion-item">
    <h2 class="accordion-header" id="heading${status.count }">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.count }" aria-expanded="false" aria-controls="collapse${status.count }">
        ${dto.subject } ${dto.csdate } ${dto.mname }
        <c:if test="${dto.is_answered == 0 }"><span style="color: red;">답변대기</span></c:if>
        <c:if test="${dto.is_answered == 1 }"><span style="color: blue;">답변완료</span></c:if>
      </button>
    </h2>
    <div id="collapse${status.count }" class="accordion-collapse collapse" aria-labelledby="heading${status.count }" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        ${dto.content } 
        <br>
        ${dto.cname }
        <c:if test="${dto.is_answered == 0 }"><span style="color: red;">답변대기</span></c:if>
        <c:if test="${dto.is_answered == 1 }"><span style="color: blue;">답변완료</span></c:if>
        <br>
        ${dto.answer }
      	답변일 : ${dto.ansdate }
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
</c:forEach>
</div>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>