<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b6b897e9b2101fc41066a267ee940a5&libraries=services,clusterer,drawing"></script>
<link href="/marrymate/css/style.css" rel="stylesheet">
<link href="/marrymate/css/revboot.css" rel="stylesheet">
<script src="js/companyContent.js"></script>
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
pre {
    font-family: 'SUIT-Regular';
}

body{
	background:#fbf4ff;
}

.allpage{
    font-family: 'SUIT-Regular';
	width: 1280px;
	margin:30px auto;
	background: #ffffff;
	padding: 20px 20px 20px 20px;
	border-radius: 25px 25px 25px 25px;
}

#carouselExampleIndicators{
	width: 800px;
	height: 400px;
	margin: 0 auto;
}

.info_map {
    width: 800px;
    margin: 20px auto;
    display: flex;
    flex-direction: row;
    align-items: center;
    padding: 0px;
}

.info_area {
	border: 2px solid #e1e1e1;
	width: 400px;
	height: 250px;
	padding-top: 10px;
	padding-left: 10px;
}

 .map_area{
	width: 50%; 
}

.rev_star_active{
  font-size:20px;
  color:#fc0;
}
.rev_star{
  font-size:20px;
  color:#ccc;
}
.star-rating {
  display:flex;
  flex-direction: row-reverse;
  justify-content:space-around;
  text-align:center;
  width: 150px;
  font-size:24px;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

textarea {
	 resize:none;
}


</style>

<title>Insert title here</title>
</head>
<body onload="mapLoad()">
<%@include file="../header.jsp" %>
<div class="allpage">
	<p class="h1">${dto.cname }</p><small class="text-muted">${dto.kind }</small>
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
	  <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		<c:forEach  var="idto" items="${iarr }" varStatus="loop">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${loop.index+1 }" aria-label="Slide ${loop.index+2 }"></button>
		</c:forEach>
	  </div>
	  <div class="carousel-inner">
	    <div class="carousel-item active">
		    <img src="/marrymate/img/com_best/${dto.img }" class="d-block w-100" alt="img">
	    </div>
		<c:forEach  var="idto" items="${iarr }" varStatus="loop">
		    <div class="carousel-item">
		      <img src="/marrymate/img/com_img/${idto.img }" class="d-block w-100" alt="img">
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
	
	<div class="container-lg info_map">
		<div class="info_area">
			<h4>${dto.cname }</h4>
			<span>
			지역 : ${dto.sido } ${dto.sigungu }
			</span><br><span>
			주소 : ${dto.juso } ${dto.sjuso }
			</span><br><span>
			홈페이지 : ${dto.curl }
			</span><br><span>
			문의전화 : ${dto.tel }
			</span><br><span>
			이메일 : ${dto.email }
			</span>
		</div>
		<div class="map_area" id="map_area">
			<div class="contain_map" id="map" style="width: 400px; height: 250px; overflow: hidden;"></div>
			<input type="hidden" id="cname" value="${dto.cname }">
		</div>
	</div>
	
	<ul class="nav nav-tabs" id="scrollspyHeading1">
	  <li class="nav-item">	<a class="nav-link active" aria-current="page" href="#scrollspyHeading1">상세정보</a>  </li>
	  <li class="nav-item">	<a class="nav-link" href="#scrollspyHeading2">리뷰</a>  </li>
	  <li class="nav-item">	<a class="nav-link" href="#scrollspyHeading3">문의</a>  </li>
	</ul>
	<br>
	<h3>상세정보</h3>
	
	<br>
	소개 : ${dto.intro }
	<br>
	<br>
	
<c:if test="${dto.kind eq '예식장' }">
	<span>홀 정보</span>
	<table class="table table-hover">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">홀명칭</th>
	      <th scope="col">대관료</th>
	      <th scope="col">예식시간</th>
	      <th scope="col">최소보증인원</th>
	      <th scope="col">최대수용인원</th>
	    </tr>
	  </thead>
	  <tbody>
	<c:forEach varStatus="status" var="hdto" items="${harr }">
	    <tr>
	      <th scope="row">${status.count } / ${hdto.hidx }</th>
	      <td>${hdto.name }</td>
	      <td>${hdto.pay }</td>
	      <td>${hdto.time }</td>
	      <td>${hdto.guest_num }</td>
	      <td>${hdto.seat_num }</td>
	    </tr>
	</c:forEach>
	  </tbody>
	</table>
	
	<span>메뉴 종류 & 가격</span>
	<table class="table table-hover">
	  <thead>
	    <tr>
	      <th scope="col">#</th>
	      <th scope="col">식사</th>
	      <th scope="col">식대</th>
	    </tr>
	  </thead>
	  <tbody>
	<c:forEach varStatus="status" var="fdto" items="${farr }">
	    <tr>
	      <th scope="row">${status.count } / ${fdto.fidx }</th>
	      <td>${fdto.name }</td>
	      <td>${fdto.pay }</td>
	    </tr>
	</c:forEach>
	  </tbody>
	</table>
	
</c:if>

	<ul class="nav nav-tabs" id="scrollspyHeading2">
	  <li class="nav-item">	<a class="nav-link" href="#scrollspyHeading1">상세정보</a>  </li>
	  <li class="nav-item">	<a class="nav-link active" aria-current="page" href="#scrollspyHeading2">리뷰</a>  </li>
	  <li class="nav-item">	<a class="nav-link" href="#scrollspyHeading3">문의</a>  </li>
	</ul>
	<br>
	
	<h3>리뷰</h3>
	<c:if test="${empty rarr }">
	<br>
	작성된 리뷰가 없습니다.
	<br><br>
	</c:if>
	<c:forEach var="rdto" items="${rarr }">
	${rdto.mname } <small class="text-muted">${rdto.redate }</small><br>
	<c:forEach begin="1" end="5" var="num">
		<c:if test="${num <= rdto.star}">
		<label class="rev_star_active">&#9733;</label>
		</c:if>
		<c:if test="${num > rdto.star}">
		<label class="rev_star">&#9733;</label>
		</c:if>
	</c:forEach>
	<pre>${rdto.content }</pre>
	
	<br>
	
	</c:forEach>
	<form name="fm" action="review.do" method="post">
		<input type="hidden" name="cidx" value="${dto.cidx }">
		<span class="star-rating">
		<input type="radio" id="5-stars" name="star" value="5" required="required" />
			<label for="5-stars" class="star">&#9733;</label>
		<input type="radio" id="4-stars" name="star" value="4" />
			<label for="4-stars" class="star">&#9733;</label>
		<input type="radio" id="3-stars" name="star" value="3" />
			<label for="3-stars" class="star">&#9733;</label>
		<input type="radio" id="2-stars" name="star" value="2" />
			<label for="2-stars" class="star">&#9733;</label>
		<input type="radio" id="1-star" name="star" value="1" />
			<label for="1-star" class="star">&#9733;</label>
		</span>
	<c:if test="${empty sessionScope.loginMidx }">
		<div class="input-group mb-3">
		  <textarea class="form-control" placeholder="로그인 후 이용 가능합니다" name="content" aria-label="With textarea" rows="4" disabled></textarea>
		  <input class="btn btn-outline-secondary" type="button" id="button-addon2" value="리뷰 작성" disabled/>
		</div>
	</c:if>
	<c:if test="${not empty sessionScope.loginMidx }">
		<div class="input-group mb-3">
		  <textarea class="form-control" placeholder="리뷰 내용을 작성하세요." name="content" aria-label="With textarea" rows="4" required="required"></textarea>
		  <input class="btn btn-outline-secondary" type="submit" id="button-addon2" value="리뷰 작성"/>
		</div>
	</c:if>
	</form>
	
	
	<ul class="nav nav-tabs" id="scrollspyHeading3">
	  <li class="nav-item">	<a class="nav-link" href="#scrollspyHeading1">상세정보</a>  </li>
	  <li class="nav-item">	<a class="nav-link" href="#scrollspyHeading2">리뷰</a>  </li>
	  <li class="nav-item">	<a class="nav-link active" aria-current="page" href="#scrollspyHeading3">문의</a>  </li>
	</ul>
	<br>
	<h3>문의</h3>
	
	<c:if test="${empty rarr }">
	<br>
	답변된 문의가 없습니다.
	<br><br>
	</c:if>

	<div class="accordion" id="accordionExample">
	<c:forEach varStatus="status" var="dto" items="${csarr }">
	<input type="hidden" name="ccsidx" value="${dto.ccsidx }">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="heading${status.count }">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${status.count }" aria-expanded="false" aria-controls="collapse${status.count }">
	        ${dto.subject }<br><small class="text-muted">${dto.csdate }</small>
	      </button>
	    </h2>
	    <div id="collapse${status.count }" class="accordion-collapse collapse" aria-labelledby="heading${status.count }" data-bs-parent="#accordionExample">
	      <div class="accordion-body">
	        ${dto.subject }<br>
	        ${dto.mname } <small class="text-muted">${dto.csdate }</small>
	        <pre>${dto.content }</pre> 
	        <br>
	        ${dto.cname } <small class="text-muted">${dto.ansdate }</small><br>
	        <pre>${dto.answer }</pre>
	      </div>
	    </div>
	  </div>
	</c:forEach>
	</div>
	
	<!-- Button trigger modal -->
	<c:if test="${not empty sessionScope.loginMidx }">
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">문의하기</button>
	</c:if>
	<c:if test="${empty sessionScope.loginMidx }">
	<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop" disabled>문의하기</button>
	로그인 후 이용 가능합니다
	</c:if>
	
	<!-- Modal -->
	<div class="modal fade" id="staticBackdrop" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
		<form name="com_cs" action="com_cs.do" method="post">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">문의하기</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	          <div class="mb-3">
	            <label for="recipient-name" class="col-form-label">문의업체</label>
	            <input type="text" class="form-control" id="recipient-name" value="${dto.cname }" readonly="readonly">
	            <input type="hidden" name="cidx" value="${dto.cidx }">
	            <input type="hidden" name="midx" value="${sessionScope.loginMidx }">
	          </div>
	          <div class="mb-3">
	            <label for="message-text" class="col-form-label">제목</label>
	            <input type="text" class="form-control" id="message-text1" name="subject" placeholder="제목을 작성하세요." required="required">
	          </div>
	          <div class="mb-3">
	            <label for="message-text" class="col-form-label">문의 내용</label>
	            <textarea class="form-control" id="message-text2" name="content" placeholder="문의 내용을 작성하세요." required="required" rows="5"></textarea>
	          </div>
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-primary">문의하기</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
	


	<script>
	</script>
	<div class="fixed-bottom">
	<div class="accordion" id="accordionExample">
	  <div class="accordion-item">
	    <h2 class="accordion-header" id="headingOne">
	      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
	        메뉴 바
	      </button>
	    </h2>
	    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		<div class="accordion-body">
		<c:if test="${empty sessionScope.loginMidx }">
			로그인 후 이용 가능합니다
		</c:if>
		<c:if test="${not empty sessionScope.loginMidx }">
		<form action="com_like.do" method="post">
			<input type="hidden" name="midx" value="${sessionScope.loginMidx }">
			<input type="hidden" name="cidx" value="${dto.cidx }">
		<c:if test="${empty ldto }">
			<button type="submit" class="btn btn-outline-primary">
			☆즐겨찾기☆
			</button>
		</c:if>
		<c:if test="${not empty ldto}">
			<input type="hidden" name="lidx" value="${ldto.lidx }">
			<button type="submit" class="btn btn-primary">
			☆즐겨찾기☆
			</button>
		</c:if>
		</form>
		<form action="" method="get">
			<input type="button" name="midx" value="${sessionScope.loginMidx }">
			<input type="button" name="cidx" value="${dto.cidx }">
			<select name="hidx">
				<c:forEach var="hdto" items="${harr }">
				<option value="${hdto.hidx }">${hdto.name }(대관료 : ${hdto.pay } 최소보증인원 : ${hdto.guest_num })</option>
				</c:forEach>
			</select>
			<select name="fidx">
				<c:forEach var="fdto" items="${farr }">
				<option value="${fdto.fidx }">${fdto.name }(식대 : ${fdto.pay })</option>
				</c:forEach>
			</select>
			<input type="date" name="bk_date">
			
			cidx, hidx, booktime, book을 조회해서 선택 String bk_time;
			
			
			midx
			cidx
			hidx
			fidx
			bk_date (예약하는 날짜)
			bk_time (예약하는 시간)
			
		</form>
		</c:if>
		</div>
	    </div>
	  </div>
	</div>
</div>

</div>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>