<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
 
.menu {
	position: relative;
	margin-left: 35px;
}

.mbar {
	position: absolute;
	left: -100%;
	background-color: #fff; 
	display: none;
}

.mbar li {
	list-style-type: none;
	padding: 7px;
	left: -100%;
	border-bottom: 1px solid #ddd; /* Add any desired border style */
}
	
.menu ul {
	position: absolute;
	top: 100%;
	z-index: 1;
	display: none;
	background-color: #fff;
	padding: 0;
	margin: 0;
	border: 1px solid #ccc;
	border-radius: 8px;
	min-width: 120px;
}

.menu li {
	display: block;
	text-align: center;
	border-bottom: 1px solid #ccc;
}

.menu li:last-child {
	border-bottom: none;
}

.menu a,p {
	display: block;
	text-decoration: none;
	color: #660099;
	text-align: center;
}

p img {
	
}
.menu a:hover {
	background-color: #cc99ff;
	color: #fff;
  text-shadow: 0 0 7px #cc66ff, 0 0 10px #cc66ff, 0 0 21px #cc66ff, 0 0 42px #0fa,
    0 0 82px #0fa, 0 0 92px #0fa, 0 0 102px #0fa, 0 0 151px #0fa;
}

.menu:hover ul {
	display: block;
}

ul > li:last-child ul{
    right: 5px;
    left: auto;
 	top: 10px;   
}

nav{
	height: 200px;
	padding: 10px;
}

nav .navdiv{
	padding: 20px;
}
.titlebar a{
	font-family: 'SUIT-Regular';
	text-decoration: none;
	text-align: center;
	font-size: 28px;
	font-weight: bold;
	color: black;
	transition: color 0.5s;
	padding: 20px;
	
}

.titlebar a:hover{
	color: #eccc83;
}

#l{
	text-decoration: none;
	color: black;
}
.loginboxheader{
	height: 48px;
	background-color: #b7a2d5;
	align-content: right;
	align-items: right;
	display: flex;
    align-content: space-between;
    justify-content: flex-end;
    align-items: center;
}
.notificationheader{
	margin: 10px;
}
.iamnav{
    display: flex;
    justify-content: flex-start;
    width: 100%;
    border-bottom: 1px solid black;
    margin-bottom: 30px;
    align-content: center;
    align-items: center;
    height: 140px;
}

</style>

<!-- header 영역 혹시 깨질까봐 우선 in-line으로 css적용해두었어요! -->
<header style="justify-content: space-between;" id="header">
		<div class="loginboxheader">
			<c:if
				test="${empty sessionScope.loginId && empty sessionScope.com_id}">
				<div>
					<a id="l" href="login.do">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a id="l" href="memberJoin.do">회원가입</a>
				</div>
			</c:if>
			<c:if
				test="${not empty sessionScope.loginId || not empty sessionScope.com_id}">
				<div style="display: flex; margin-right: 10px;"><a>${sessionScope.com_cname}${sessionScope.loginName}
					님 접속중 | &nbsp;</a><a id="l" href="logout.do">로그아웃</a>
				</div>
			</c:if>
			<c:if
				test="${empty sessionScope.loginId && empty sessionScope.com_id}">
			</c:if>
			<c:if
				test="${not empty sessionScope.loginId || not empty sessionScope.com_id}">
				<div class="menu">
					<p><img src="/marrymate/img/user2.png" style="width: 30px;"></p>
					<ul class="mbar">
						<c:if test="${not empty sessionScope.loginId}">
							<li><a href="myInfo_m.do">마이페이지</a></li>
						</c:if>
						<c:if test="${not empty sessionScope.com_id}">
							<li><a href="myInfo_c.do">마이페이지</a></li>
							<li><a
								href="companyContent.do?cidx=${sessionScope.com_cidx }">상세페이지</a></li>
						</c:if>
						<li><a href="myBook.do">예약내역</a></li>
						<li><a href="qna.do">문의내역</a></li>
						<c:if test="${not empty sessionScope.loginId}">
							<li><a href="favorite.do">즐겨찾기</a></li>
							<li><a href="myCommunity.do">커뮤니티</a></li>
							<li><a href="myPoint.do">포인트</a></li>
						</c:if>
					</ul>
				</div>
				<div class="notificationheader">
					<p><img src="/marrymate/img/notification.png" style="width: 30px;"></p>
				</div>
			</c:if>
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
</script>