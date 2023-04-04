<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- NAVIGATION -->
<a name="header"><header id="header"></a>
			<nav id="nav-bar">
					<!--LOGO -->
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