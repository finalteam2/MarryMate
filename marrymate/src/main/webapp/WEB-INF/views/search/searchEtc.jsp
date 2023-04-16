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
<link href="/marrymate/css/revboot.css" rel="stylesheet">
<script src="/marrymate/js/httpRequest.js"></script>
<script src="js/searchEtc.js"></script>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="allpage">
	<h1>웨딩컬렉션</h1>
	<form id="searchfm">
	<ul class="nav nav-tabs">
	<li class="nav-item"><a class="nav-link active" aria-current="page" id="kind1" onclick="goKind('스튜디오')">스튜디오</a></li>
	<li class="nav-item"><a class="nav-link" aria-current="page" id="kind2" onclick="goKind('헤어메이크업')">헤어메이크업</a></li>
	<li class="nav-item"><a class="nav-link" aria-current="page" id="kind3" onclick="goKind('드레스')">드레스</a></li>
	<li class="nav-item"><a class="nav-link" aria-current="page" id="kind4" onclick="goKind('스냅DVD')">스냅DVD</a></li>
	<li class="nav-item"><a class="nav-link" aria-current="page" id="kind5" onclick="goKind('주례')">주례</a></li>
	<li class="nav-item"><a class="nav-link" aria-current="page" id="kind6" onclick="goKind('사회')">사회</a></li>
	<li class="nav-item"><a class="nav-link" aria-current="page" id="kind7" onclick="goKind('축가')">축가</a></li>
	</ul>
	<div class="searchbox">
		<div class="input-group mb-3" >
		  <label class="input-group-text" for="inputGroupSelect01">지역</label>
		  <select class="form-select" name="sido" id="sido">
			<option value="">도/특별시/광역시</option>
			<option value="서울">서울</option>
			<option value="부산">부산</option>
			<option value="대구">대구</option>
			<option value="인천">인천</option>
			<option value="광주">광주</option>
			<option value="대전">대전</option>
			<option value="울산">울산</option>
			<option value="세종">세종</option>
			<option value="경기">경기</option>
			<option value="강원">강원</option>
			<option value="충북">충북</option>
			<option value="충남">충남</option>
			<option value="전북">전북</option>
			<option value="전남">전남</option>
			<option value="경북">경북</option>
			<option value="경남">경남</option>
			<option value="제주">제주</option>
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
	<div class="condiv" id="container1"></div>
	<nav class="pagebox" aria-label="Page navigation example">
	  <ul class="pagination" id="paging"></ul>
	</nav>
</div>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
<script type="text/javascript">
//검색 결과 불러오기
searchEtc('1');
</script>
</body>
</html>