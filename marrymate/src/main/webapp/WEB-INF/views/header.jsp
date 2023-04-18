<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" href="/marrymate/css/header.css">
<script src="js/checkNoti.js"></script>
<script type="text/javascript">

/*
window.onload = function () {
    var el = document.getElementById("notificationheader");
    el.onclick = "checkNoti.do";
}*/

</script>
<!-- 알림 자바스크립트 -->
<header style="justify-content: space-between;" id="header">
	<div class="loginboxheader">
		<c:if
			test="${empty sessionScope.loginId && empty sessionScope.com_id}">
			<div class="loginbar1">
				<a href="login.do" class="black_a">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="memberJoin.do" class="black_a">회원가입</a>
			</div>
		</c:if>
		<c:if
			test="${not empty sessionScope.loginId || not empty sessionScope.com_id}">
			<div class="loginbar2" style="display: flex; margin-right: 10px;">
				<a>${sessionScope.com_cname}${sessionScope.loginName} 님 접속중 |
					&nbsp;</a><a href="logout.do" class="black_a">로그아웃</a>
			</div>
		</c:if>
		<c:if
			test="${empty sessionScope.loginId && empty sessionScope.com_id}">
		</c:if>

		&nbsp;&nbsp;&nbsp;&nbsp;
		<div class="menu">
			<p>
				<img class="mypimg" src="/marrymate/img/user2.png"
					style="width: 28px;">
			</p>
			<ul class="mbar">
				<c:if test="${not empty sessionScope.loginId}">
					<li><a href="myInfo_m.do">마이페이지</a></li>
					<li><a href="myBook.do">예약내역</a></li>
					<li><a href="qna.do">문의내역</a></li>
					<li><a href="favorite.do">즐겨찾기</a></li>
					<li><a href="myCommunity.do">커뮤니티</a></li>
					<li><a href="myPoint.do">포인트</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.com_id}">
					<li><a href="myInfo_c.do">마이페이지</a></li>
					<li><a href="companyContent.do?cidx=${sessionScope.com_cidx }">상세페이지</a></li>
					<li><a href="myBook.do">예약내역</a></li>
					<li><a href="qna.do">문의내역</a></li>
				</c:if>
			</ul>
		</div>

		<div class="notificationheader" id="notigroup"></div>

	</div>
	<div>
		<nav class="iamnav">
			<div class="navdiv">
				<a href="index.do"><img src="/marrymate/img/logo1.png"
					style="width: 320px;"></a>
			</div>
			<div class="titlebar" style="display: flex; align-items: center;">
				<div style="display: flex;">
					<a href="allBook.do">통합예약</a>
				</div>

				<div style="display: flex;">
					<a href="searchHall.do">웨딩홀</a>
				</div>

				<div style="display: flex;">
					<a href="searchEtc.do">웨딩컬렉션</a>
				</div>

				<div style="display: flex;">
					<c:if
						test="${empty sessionScope.loginId && empty sessionScope.com_id}">
						<li style="list-style: none;"><a href="calendarInfo.do">웨딩캘린더</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.loginId}">
						<li style="list-style: none;"><a href="calendarMain.do">웨딩캘린더</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.com_id}">
						<li style="list-style: none;"><a href="calendarMainCom.do">웨딩캘린더</a></li>
					</c:if>
				</div>

				<div style="display: flex;">
					<a href="allCommunity.do">커뮤니티</a>
				</div>
			</div>
		</nav>
	</div>
</header>

<script>
   $(document).ready(function(){
      $(".menu>p").click(function(){
         var submenu = $(this).next("ul");
         if(submenu.is(":visible")){
            submenu.slideUp();
         }else{
            submenu.slideDown();
         }
      });
   });
   $(document).ready(function(){
      $(".notificationheader>p").click(function(){
         var submenu = $(this).next("ul");
         if(submenu.is(":visible")){
            submenu.slideUp();
         }else{
            submenu.slideDown();
         }
      });
   });
</script>
<!-- 알림 실행하는거 (맨밑에 해놔야댐) -->
<script>
checkNoti();
</script>