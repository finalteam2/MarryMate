<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<header id="header">
<!-- 
  <link rel="stylesheet" href="/marrymate/css/style.css">

<a name="header"><header id="header"></a>
			<nav id="nav-bar">
					<div id="menu">
						<div><a href="index.do"><img src="/marrymate/img/logo1.png"></a></div>
						<div><a href="allBook.do">통합예약</a></div>
						<div><a href="searchHall.do">웨딩</a><a href="searchEtc.do">컬렉션</a></div>
						<div><a href="calendarMain.do">웨딩캘린더</a></div>
						<div><a href="community.do">커뮤니티</a></div>
					</div>
					<div>
						<c:if test="${empty sessionScope.loginId}">
							<div><a href="login.do">로그인</a>&nbsp;|&nbsp;<a href="memberJoin.do">회원가입</a></div>
						</c:if>
						<c:if test="${!empty sessionScope.loginId}">
							<div>${sessionScope.loginName} 접속중 | <a href="logout.do">로그아웃</a></div>
						</c:if>
						<a href="memberJoin.do">회원가입</a>
						<a href="companyJoin.do">기업 회원가입</a>
					</div>
					<div class="menu">
						<a><img src="/marrymate/img/user2.png"></a>
						<ul class="hide">
							<li><a href="myInfo_m.do">마이페이지(일반)</a></li>
							<li><a href="myInfo_c.do">마이페이지(기업)</a></li>
							<li><a href="reserve.do">예약내역</a></li>
							<li><a href="qna.do">문의내역</a></li>
							<li><a href="favorite.do">즐겨찾기</a></li>
							<li><a href="point.do">My 포인트</a></li>
							<li><a href="community.do">My 커뮤니티</a></li>
						</ul>
					</div>
					<div class="clearboth"></div>
			</nav>
</header>
-->

<nav class="navbar navbar-expand-sm" style="background-color: #F7F1FF;">
  <div class="container-fluid">
    <a class="navbar-brand"  href="index.do"><img src="/marrymate/img/logo1.png" style="width: 200px;"></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar" aria-controls="collapsibleNavbar" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href="allBook.do">통합예약</a>
        </li>
         <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" role="button" data-bs-toggle="dropdown" href="">웨딩컬렉션</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="searchHall.do">예식장</a></li>
            <li><a class="dropdown-item" href="searchEtc.do">스/드/메</a></li>
            <li><a class="dropdown-item" href="searchEtc.do">사진/DVD</a></li>
            <li><a class="dropdown-item" href="searchEtc.do">주례/사회/축가</a></li>
          </ul>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="calendarMain.do">웨딩캘린더</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="community.do">커뮤니티</a>
        </li>  
      </ul>
      </div>
     </div>
     <div class="container-fluid">
      <ul class="navbar-nav">
      	<li class="nav-item">
			<c:if test="${empty sessionScope.loginId}">
				<div><a href="login.do">로그인</a>&nbsp;|&nbsp;<a href="memberJoin.do">회원가입</a></div>
			</c:if>
			<c:if test="${!empty sessionScope.loginId}">
				<div>${sessionScope.loginName} 접속중 | <a href="logout.do">로그아웃</a></div>
			</c:if>
			<a href="memberJoin.do">회원가입</a>
			<a href="companyJoin.do">기업 회원가입</a>
		</li>
			  <li class="nav-item dropdown">
			 	  <a class="nav-link dropdown-toggle"  role="button" data-bs-toggle="dropdown"><img src="/marrymate/img/user2.png" style="width:30px"></a>
		          <ul class="dropdown-menu">
		            <li><a class="dropdown-item" href="myInfo_m.do">마이페이지(일반)</a></li>
		            <li><a class="dropdown-item" href="myInfo_c.do">마이페이지(기업)</a></li>
		            <li><a class="dropdown-item" href="reserve.do">예약내역</a></li>
		            <li><a class="dropdown-item" href="qna.do">문의내역</a></li>
		            <li><a class="dropdown-item" href="favorite.do">즐겨찾기</a></li>
		            <li><a class="dropdown-item" href="point.do">My포인트</a></li>
		            <li><a class="dropdown-item" href="community.do">My커뮤니티</a></li>
		          </ul>
     		   </li>
			</ul>
	</div>
</nav>


</header>


<script>
	$(document).ready(function(){
		$(".menu>a").click(function(){
			var submenu = $(this).next("ul");
			if(submenu.is(":visible")){
				submenu.slideUp();
			}else{
				submenu.slideDown();
			}
		});
	});
</script>