<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarryMate</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link rel="stylesheet" href="/marrymate/css/sakura.css">
<link rel="stylesheet" href="/marrymate/css/chatbot.css">
<link rel="stylesheet" href="/marrymate/css/chat.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="js/sakura.js"></script>
<style>
.carousel, .carousel-inner, .carousel-item, .d-block{
	width: 1200px;
	height: 600px;
}

.d-block {
	object-fit: cover;
}

.imgbox {
    width: 100px;
    height: 100px; 
    overflow: hidden;
    margin: 0 auto;
    margin-bottom: 15px;
}
.profileimg {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
video{
	width: 100%;
}
</style>
</head>

<body>
<script>
$(window).load(function () {
    $('body').sakura();
});


function handleVideoEnd() {
    var video = document.getElementById('video');
    var header = document.getElementById('header');
    var opacity = 1;
    
    var fadeOut = setInterval(function() {
        if (opacity > 0) {
            opacity -= 0.1;
            video.style.opacity = opacity;
        } else {
            clearInterval(fadeOut);
            video.style.display = "none";
            header.style.display = "block";
        }
    }, 40);
}
</script>
    <video id="video" muted autoplay onended="handleVideoEnd()">
		<source src="/marrymate/video/mainvi.mp4" type="video/mp4">
	</video>
<%@include file="header.jsp" %>
<h1>main입니다.</h1>
<h2>아래는 추후 수정 예정입니다!</h2>

<div class="btn-group">
  <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
    알람
  <c:if test="${not empty cnt }">
  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
    ${cnt }
    <span class="visually-hidden">unread messages</span>
  </span>
  </c:if>
  </button>
  <ul class="dropdown-menu">
  <c:forEach varStatus="status" var="dto" items="${arr }">
    <c:if test="${dto.checked eq 1 }">
    <li><a href="goNoti.do?nidx=${dto.nidx }&page=${dto.page}"><span style="color:gray;">${dto.title }</span></a></li>
    </c:if> 
    <c:if test="${dto.checked eq 0 }">
    <li><a href="goNoti.do?nidx=${dto.nidx }&page=${dto.page}"><span style="color:red;">${dto.title }</span></a></li>
    </c:if> 
  </c:forEach>
  <c:if test="${not empty arr }">
    <li><hr class="dropdown-divider"></li>
  </c:if>
    <li><a class="dropdown-item" href="checkNoti.do">알림 확인</a></li>
  </ul>
</div>




<section id="mainevent">
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="/marrymate/img/ex1.png" class="d-block w-100" alt="웨딩의 모든것 배너">
    </div>
    <div class="carousel-item">
      <a href="weddingtest.do"><img src="/marrymate/img/ex2.png" class="d-block w-100" alt="웨딩 단어 테스트 배너"></a>
    </div>
    <div class="carousel-item">
      <img src="/marrymate/img/ex3.png" class="d-block w-100" alt="웨딩 캘린더 배너">
    </div>
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

</section>

<%@include file="chatbot.jsp" %>
<%@include file="footer.jsp" %>
</body>
</html>