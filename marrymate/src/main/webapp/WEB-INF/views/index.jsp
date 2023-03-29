<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarryMate</title>
<link href="/marrymate/css/style.css" rel="stylesheet">

</head>

<body>
<h3>메인 효과 영역, 첫 방문 시 노출 후 사라짐 예정</h3>
  <div class="video">
    <iframe width="700" height="400" src="/marrymate/img/main.mp4" title="video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen=""></iframe>
  </div>

<%@include file="header.jsp" %>


<h1>main입니다.</h1>
<h2>아래는 추후 수정 예정입니다!</h2>
<section id="mainevent">
	<div><a href=""><img src="/marrymate/img/ex1.png"></a></div>
	<div><a href=""><img src="/marrymate/img/ex2.png"></a></div>
	<div><a href=""><img src="/marrymate/img/ex3.png"></a></div>
</section>


<%@include file="footer.jsp" %>
<a href="myInfo_m.do"><h2>마이페이지</h2></a>
<a href="join.do">회원가입</a>
<a href="join_cp.do">기업 회원가입</a>
</body>
</html>