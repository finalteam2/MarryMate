<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MyPoint</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="/marrymate/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="../header.jsp" %>
<c:if test="${empty arr }">
<h1>포인트 내역이 없습니다.</h1>
</c:if>
<c:forEach var="dto" items="${arr }">
P_IDX : ${dto.p_idx }<br>
MIDX : ${dto.midx }<br>
PAY_IDX : ${dto.pay_idx }<br>
REFUND_IDX : ${dto.refund_idx }<br>
BIDX : ${dto.bidx }<br>
P_CAL : ${dto.p_cal }<br>
P_DATE : ${dto.p_date }<br>
P_TOTAL : ${dto.p_total }<br>
P_TYPE : ${dto.p_type }<br>
<hr>
</c:forEach>

<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>