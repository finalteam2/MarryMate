<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b6b897e9b2101fc41066a267ee940a5&libraries=services,clusterer,drawing"></script>
<link href="/marrymate/css/style.css" rel="stylesheet">
<script src="js/companyContent.js"></script>
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}

body{
    font-family: 'SUIT-Regular';
	width: 1280px;
	margin:0 auto;
}

.carousel-item, .carousel-fade{
	width: 800px;
	height: 400px;
	object-fit:cover;
	margin:0 auto;
}
</style>

</head>
<body onload="mapLoad()">
<%@include file="../header.jsp" %>

<p class="h1">${dto.cname }</p><small class="text-muted">${dto.kind }</small>

<hr>
<span>이미지 슬라이드 영역</span>
<div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="true">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	<c:forEach  var="idto" items="${iarr }" varStatus="loop">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${loop.index+1 }" aria-label="Slide ${loop.index+2 }"></button>
	</c:forEach>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
	    <img src="/marrymate/img/company/${dto.img }" class="d-block w-100" alt="img">
    </div>
	<c:forEach  var="idto" items="${iarr }" varStatus="loop">
	    <div class="carousel-item">
	      <img src="${idto.img }" class="d-block w-100" alt="img">
	    </div>
	</c:forEach>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<hr>

<div class="info_map">
	<div class="info_area">
		<dl>							
			<dt style="width:0;"></dt>
			<dd style="margin-bottom:7px;"><strong class="place_title_name">아펠가모공덕</strong></dd>
			<dt><span class="info_Name">주소</span><!--<img src="../images/hall_info_txt02.png" alt="주소" />--></dt>
			<dd style="font-size:13px;">서울특별시 마포구 도화동 25-13</dd>
			<dt><span class="info_Name">도로명주소</span><!--<img src="../images/hall_info_txt03.png" alt="도로명주소" />--></dt>
			<dd style="font-size:13px;">서울 마포구 마포대로 92 효성래링턴스퀘어 B동 6~7층</dd>
			<dt><span class="info_Name">식사비용</span><!--<img src="../images/hall_info_txt04.png" alt="식사비용" />--></dt>
			<dd style="font-size:13px;"><strong>59,400</strong></dd>
			<dt><span class="info_Name">메뉴종류</span><!--<img src="../images/hall_info_txt05.png" alt="메뉴종류" />--></dt>
			<dd style="font-size:13px;">뷔페</dd>
			<dt><span class="info_Name">예식형태</span><!--<img src="../images/hall_info_txt06.png" alt="예식형태" />--></dt>
			<dd style="font-size:13px;">분리예식</dd>
			<dt><span class="info_Name">예식유형</span><!--<img src="../images/hall_info_txt07.png" alt="홀사용료" />--></dt>
			<dd style="font-size:13px;">일반웨딩홀</dd>
			<dt><span class="info_Name">보증인원</span><!--<img src="../images/hall_info_txt08.png" alt="보증인원" />--></dt>
			<dd style="font-size:13px;">300 ~ 500</dd>
			<dt><span class="info_Name">홈페이지</span><!--<img src="../images/hall_info_txt09.png" alt="홈페이지" />--></dt>
			<dd><a href="http://apelgamo.com/apelgamo/wedding/gongdeok/" target="_blank" style="font-size:13px;">apelgamo.com/apelgamo/wedding/gongdeok/</a></dd>
		</dl> 
	</div>
	<div class="map_area">
		<div class="map_img">							
			<div class="contain_map" id="map" style="width: 395px; height: 265px; position: relative; overflow: hidden;">
				<div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; touch-action: none;">
				</div>
			</div>
		</div>
	</div>
	<!--map-->
</div>





지역 : ${dto.sido } ${dto.sigungu }<br>
주소 : ${dto.juso } ${dto.sjuso }<br>
홈페이지 : ${dto.curl }<br>
<input type="hidden" id="cname" value="${dto.cname }">

<ul class="nav nav-tabs" id="scrollspyHeading1">
  <li class="nav-item">
	<a class="nav-link active" aria-current="page" href="#scrollspyHeading1">상세정보</a>
  </li>
  <li class="nav-item">
	<a class="nav-link" href="#scrollspyHeading2">리뷰</a>
  </li>
  <li class="nav-item">
	<a class="nav-link" href="#scrollspyHeading3">문의</a>
  </li>
</ul>
<hr>
<h3>상세정보</h3>

소개 : ${dto.intro }<br>
문의전화 : ${dto.tel }<br>
이메일 : ${dto.email }<br>


HallDTO<br>
harr<br>
<c:forEach var="hdto" items="${harr }">
${hdto.hidx } : hidx<br>
${hdto.cidx } : cidx<br>
${hdto.name } : name<br>
${hdto.worktime } : worktime<br>
</c:forEach>
<hr>

FoodDTO<br>
farr<br>
<c:forEach var="fdto" items="${farr }">
${fdto.fidx } : fidx<br>
${fdto.cidx } : cidx<br>
${fdto.type } : type<br>
${fdto.name } : name<br>
${fdto.pay } : pay<br>
</c:forEach>
<hr>

<ul class="nav nav-tabs" id="scrollspyHeading2">
  <li class="nav-item">
	<a class="nav-link" href="#scrollspyHeading1">상세정보</a>
  </li>
  <li class="nav-item">
	<a class="nav-link active" aria-current="page" href="#scrollspyHeading2">리뷰</a>
  </li>
  <li class="nav-item">
	<a class="nav-link" href="#scrollspyHeading3">문의</a>
  </li>
</ul>
<h3>리뷰</h3>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>

<ul class="nav nav-tabs" id="scrollspyHeading3">
  <li class="nav-item">
	<a class="nav-link" href="#scrollspyHeading1">상세정보</a>
  </li>
  <li class="nav-item">
	<a class="nav-link" href="#scrollspyHeading2">리뷰</a>
  </li>
  <li class="nav-item">
	<a class="nav-link active" aria-current="page" href="#scrollspyHeading3">문의</a>
  </li>
</ul>
<h3>문의</h3>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
소개 : ${dto.intro }<br>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>