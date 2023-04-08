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
</head>
<body>
<%@include file="../header.jsp" %>
<div class="allpage">
      <h1>업체명 : ${cname }</h1>

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">예약 번호 bk_idx</th>
      <th scope="col">회원이름 mname </th>
      <th scope="col">예약일/시간 bk_date bk_time</th>
	<c:if test="${not empty hall}">
      <th scope="col">홀 이름 hname</th>
      <th scope="col">대관료 hpay</th>
      <th scope="col">최소보증인원 hnum</th>
      <th scope="col">식사 이름 fname</th>
      <th scope="col">식대 fpay</th>
	</c:if>
      
      <th scope="col">총 금액 allpay</th>
      <th scope="col">예약 상태 bk_state</th>
      <th scope="col">승인 / 취소</th>
    </tr>
  </thead>
  <tbody>
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
		  <c:if test="${dto.bk_state eq 0}">결제전</c:if>
		  <c:if test="${dto.bk_state eq 1}">예약대기</c:if>
		  <c:if test="${dto.bk_state eq 2}">예약확정</c:if>
		  <c:if test="${dto.bk_state eq 3}">결제완료</c:if>
		  <c:if test="${dto.bk_state eq 4}">예약취소</c:if>
		  <c:if test="${dto.bk_state eq 5}">이용완료</c:if>
	  </td>
	  <td>
	  <div class="btn-group" role="group" aria-label="Basic example">
	  	<form action="" method="post">
	  	  <input type="hidden" name="bk_idx" value="${dto.bk_idx }">
		  <button type="submit" class="btn btn-outline-primary" <c:if test="${not (dto.bk_state eq 1)}">disabled</c:if>>승인</button>
	  	</form>
	  	<form action="" method="post">
	  	  <input type="hidden" name="bk_idx" value="${dto.bk_idx }">
		  <button type="button" class="btn btn-outline-danger" <c:if test="${dto.bk_state eq 5 || dto.bk_state eq 4}">disabled</c:if>>취소</button>
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