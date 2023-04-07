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

<table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">bk_idx</th>
      <th scope="col">midx</th>
      <th scope="col">hidx</th>- 이름 / 가격 / 최소보증인원
      <th scope="col">cidx</th>
      <th scope="col">fidx</th> - 이름 / 가격
      <th scope="col">bk_date</th>
      <th scope="col">bk_time</th>
      <th scope="col">bk_state</th>
      <th scope="col">bookdate</th>
      <th scope="col">hall_nothall</th>
      <th scope="col"> 총 금액(포인트 사용 전) </th>
      <th scope="col"> 결제 방식 </th>
      <th scope="col"> 포인트 사용량 </th>
      <th scope="col"> 총 금액(포인트 사용 후) </th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
    <tr>
      <th scope="row">3</th>
      <td colspan="2">Larry the Bird</td>
      <td>@twitter</td>
    </tr>
  </tbody>
</table>

</div>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>