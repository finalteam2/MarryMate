<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarryMate</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="/marrymate/css/style.css" rel="stylesheet">
<link href="/marrymate/css/searchStyle.css" rel="stylesheet">
<script src="/marrymate/js/httpRequest.js"></script>
<script src="js/searchEtc.js"></script>
</head>
<body onload="searchEtc('1')">
<%@include file="../header.jsp" %>
<h1>웨딩컬렉션</h1>
<form>
<div class="searchbox">
	<div class="input-group mb-3" >
	  <label class="input-group-text" for="inputGroupSelect01">분류</label>
	  <select class="form-select" name="kind" id="kind">
		<option selected>스튜디오</option>
		<option>헤어메이크업</option>
		<option>드레스</option>
		<option>스냅DVD</option>
		<option>주례</option>
		<option>사회</option>
		<option>축가</option>
	  </select>
	</div>
	<div class="input-group mb-3" >
	  <label class="input-group-text" for="inputGroupSelect01">지역</label>
	  <select class="form-select" name="sido" id="sido">
	    <option selected>시도</option>
	    <option>서울</option>
	  </select>
	</div>
	<div class="input-group mb-3">
	  <span class="input-group-text" id="basic-addon1">비용</span>
	  <input type="text" class="form-control" placeholder="최소금액" name="payMin" id="payMin">
	  <input type="text" class="form-control" placeholder="최대금액" name="payMax" id="payMax">
	</div>
	<div class="input-group mb-3">
	  <span class="input-group-text" id="basic-addon1">업체명</span>
	  <input type="text" class="form-control" placeholder="업체명" name="name" id="name">
	</div>
	<div>
		<button type="button" class="btn btn-primary" onclick="searchEtc('1')">검색</button>
		<button type="reset" class="btn btn-secondary">다시입력</button>
	</div>
</div>
<ul class="nav nav-tabs">
	<li class="nav-item"><a class="nav-link active" aria-current="page" id="sort1" onclick="goSort('1')">이름순</a></li>
	<li class="nav-item"><a class="nav-link" aria-current="page" id="sort2" onclick="goSort('2')">조회수순</a></li>
	<li class="nav-item"><a class="nav-link" aria-current="page" id="sort3" onclick="goSort('3')">낮은가격순</a></li>
	<li class="nav-item"><a class="nav-link" aria-current="page" id="sort4" onclick="goSort('4')">높은가격순</a></li>
	<li class="nav-item">
	<select class="form-select" aria-label="Default select example" name="view" id="view" onchange="searchEtc(1)">
		<option value="8" selected="selected">8개씩 보기</option>
		<option value="12">12개씩 보기</option>
		<option value="16">16개씩 보기</option>
		<option value="20">20개씩 보기</option>
	</select>
	</li>
</ul>
</form>
<div id="totalCnt"></div>
<div class="container1" id="container1"></div>
<nav class="pagebox" aria-label="Page navigation example">
  <ul class="pagination" id="paging"></ul>
</nav>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>