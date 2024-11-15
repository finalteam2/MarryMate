<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyBook</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="/marrymate/css/style.css" rel="stylesheet">
<link href="/marrymate/css/revboot.css" rel="stylesheet">
<style>
body{
	background:#fbf4ff;
}
div.allpage{
	background: #ffffff;
	padding: 20px 20px 20px 20px;
	border-radius: 25px 25px 25px 25px;
	width: 1280px;
	margin: 50px auto;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="allpage">
      <h1>${cname } 님의 예약 내역입니다.</h1>
<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">예약 번호</th>
      <th scope="col">회원이름 </th>
      <th scope="col">예약일/시간</th>
	<c:if test="${not empty hall}">
      <th scope="col">홀 이름</th>
      <th scope="col">대관료</th>
      <th scope="col">보증인원</th>
      <th scope="col">식사</th>
      <th scope="col">식대</th>
	</c:if>
      
      <th scope="col">총 금액</th>
      <th scope="col">예약 상태</th>
      <th scope="col">승인/거부</th>
    </tr>
  </thead>
  <tbody>
  	<c:if test="${empty arr }">
  	<tr>
  		<td colspan="6">
  		에약 내역이 없습니다.
  		</td>
  	</tr>
  	</c:if>
    <c:forEach varStatus="status" var="dto" items="${arr }">
    <tr>
      <th scope="row">${status.count }</th>
      <td>${dto.bk_idx }</td>
      <td>${dto.mname }</td>
      <td>${dto.bk_date } ${dto.bk_time }</td>
	<c:if test="${not empty hall}">
      <td>${dto.hname }</td>
      <td>${dto.hpay }</td>
      <td>${dto.hnum }</td>
      <td>${dto.fname }</td>
      <td>${dto.fpay }</td>
	</c:if>
      <td>${dto.allpay }</td>
	  <td>
		  <c:if test="${dto.bk_state eq 0}"><span class="text-secondary">결제전</span></c:if>
		  <c:if test="${dto.bk_state eq 1}"><span class="text-secondary">예약대기</span></c:if>
		  <c:if test="${dto.bk_state eq 2}"><span class="text-success">잔금대기</span></c:if>
		  <c:if test="${dto.bk_state eq 3}"><span class="text-primary">결제완료</span></c:if>
		  <c:if test="${dto.bk_state eq 4}"><span class="text-danger">예약취소</span></c:if>
  		  <c:if test="${dto.bk_state eq 5}"><span class="text-danger">취소대기</span></c:if>
  		  <c:if test="${dto.bk_state eq 6}"><span class="text-muted">이용완료</span></c:if>
  		  <c:if test="${dto.bk_state eq 7}"><span class="text-danger">잔금미납</span></c:if>
	  </td>
	  <td>
	  <div class="btn-group" role="group" aria-label="Basic example">
  	  	<!-- 결제 진행 시 폼 부분 -->
  	  	<form action="signBook.do" method="post">
	  	  <input type="hidden" name="bk_idx" value="${dto.bk_idx }">
	  	  <input type="hidden" name="midx" value="${dto.midx }">
	  	  <c:if test="${not (dto.bk_state eq 1)}">
		  	  <button type="button" onclick="" class="btn btn-outline-secondary" disabled>승인</button>
	  	  </c:if>
	  	  <c:if test="${dto.bk_state eq 1}">
			  <button type="submit" onclick="" class="btn btn-outline-primary" >승인</button>
	  	  </c:if>
	  	</form>
  	  	<!-- 결제 취소 신청 시 폼 부분 -->
  	  	<form action="refundRequest.do" method="post">
	  	  <input type="hidden" name="bk_idx" value="${dto.bk_idx }">
	  	  <input type="hidden" name="midx" value="${dto.midx }">
	  	  <c:if test="${not (dto.bk_state eq 1)}">
		  	  <button type="button" class="btn btn-outline-secondary" disabled>거부</button>
	  	  </c:if>
	  	  <c:if test="${dto.bk_state eq 1}">
			  <button type="submit" class="btn btn-outline-danger" >거부</button>
	  	  </c:if>
	  	</form>	  	
	  </div>
	  </td>
    </tr>
    </c:forEach>
  </tbody>
</table>

</div>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>