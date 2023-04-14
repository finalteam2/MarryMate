<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
@font-face {
    font-family: 'Cafe24ClassicType-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2210-2@1.0/Cafe24ClassicType-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
 
.menu {
	position: relative;
	margin-left: 20px;
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

.menu a {
	display: block;
	text-decoration: none;
	color: #660099;
	text-align: center;
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
}

nav .titlebar{
	margin-right: 0;
}

.titlebar a{
	font-family: 'Cafe24ClassicType-Regular';
	text-decoration: none;
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	color: black;
	transition: color 1s;
}

.titlebar a:hover{
	color: #eccc83;
}

#l{
	text-decoration: none;
	color: black;
}

</style>

<!-- header 영역 혹시 깨질까봐 우선 in-line으로 css적용해두었어요! -->
<header
	style="display: flex; justify-content: space-between; align-items: center;"
	id="header">
	<nav style="display: flex; justify-content: space-between; align-items: center; width: 100%;border-bottom:1px solid black;margin-bottom:30px;">
		<div style="display: flex; margin-right: 10px;">
			<a href="index.do"><img src="/marrymate/img/logo1.png"
				style="width: 350px;"></a>
		</div>
		<div class="titlebar" style="display: flex; align-items: center;margin-top:100px;">
			<div style="display: flex;">
				<a href="allBook.do">통합예약</a>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div style="display: flex;">
				<a href="searchHall.do">예식장검색</a>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div style="display: flex;">
				<a href="searchEtc.do">웨딩컬렉션</a>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div style="display: flex;">
				<a href="allCommunity.do">커뮤니티</a>
			</div>
		</div>
		<div class="loginbox" style="display: flex; align-items: center; margin-right: 40px;">
			<c:if
				test="${empty sessionScope.loginId && empty sessionScope.com_id}">
				<div>
					<a id="l" href="login.do">로그인</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a id="l" href="memberJoin.do">회원가입</a>
				</div>
			</c:if>
			<c:if
				test="${not empty sessionScope.loginId || not empty sessionScope.com_id}">
				<div style="display: flex; margin-right: 10px;">${sessionScope.com_cname}${sessionScope.loginName}
					님 접속중 | &nbsp;<a id="l" href="logout.do">로그아웃</a>
				</div>
			</c:if>
			<c:if
				test="${empty sessionScope.loginId && empty sessionScope.com_id}">
			</c:if>
			<c:if
				test="${not empty sessionScope.loginId || not empty sessionScope.com_id}">
				<div class="menu">
					<a><img src="/marrymate/img/user2.png" style="width: 30px;"></a>
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
				<div class="noti" style="margin-left: 10px;">
					<a href=""><img src="/marrymate/img/notification.png"
						style="width: 30px;"></a>
				</div>
			</c:if>
		</div>
	</nav>
</header>


<!--  
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
          <a class="nav-link" href="allCommunity.do">커뮤니티</a>
        </li>  
      </ul>
      </div>
     </div>
     <div class="container-fluid">
      <ul class="navbar-nav">
      	<li class="nav-item">
			<c:if test="${empty sessionScope.loginId && empty sessionScope.com_id}">
				<div><a href="login.do">로그인</a>&nbsp;or&nbsp;<div><a href="login_com.do">기업 로그인</a>&nbsp;|&nbsp;<a href="memberJoin.do">회원가입</a></div>
			</c:if>
			<c:if test="${!empty sessionScope.loginId}">
				<div>${sessionScope.loginNick} 접속중 | <a href="logout.do">로그아웃</a></div>
			</c:if>
			<c:if test="${!empty sessionScope.com_id}">
				<div>${sessionScope.com_cname} 접속중 | <a href="logout.do">로그아웃</a></div>
			</c:if>
			<a href="memberJoin.do">회원가입</a>
			<a href="companyJoin.do">기업 회원가입</a>
		</li>
			  <li class="nav-item dropdown">
			 	  <a class="nav-link dropdown-toggle"  role="button" data-bs-toggle="dropdown"><img src="/marrymate/img/user2.png" style="width:30px"></a>
		          <ul class="dropdown-menu">
					<c:if test="${!empty sessionScope.loginId}">
		            <li><a class="dropdown-item" href="myInfo_m.do">마이페이지</a></li>
					</c:if>
					<c:if test="${!empty sessionScope.com_id}">
		            <li><a class="dropdown-item" href="myInfo_c.do">마이페이지</a></li>
					</c:if>
		            <li><a class="dropdown-item" href="reserve.do">예약내역</a></li>
		            <li><a class="dropdown-item" href="qna.do">문의내역</a></li>
		            <li><a class="dropdown-item" href="favorite.do">즐겨찾기</a></li>
		            <li><a class="dropdown-item" href="point.do">My포인트</a></li>
		            <li><a class="dropdown-item" href="MyCommunity.do">My커뮤니티</a></li>
		          </ul>
     		   </li>
     		   
     		    <li class="nav-item dropdown">
			 	  <a class="nav-link dropdown-toggle"  role="button" data-bs-toggle="dropdown"><img src="/marrymate/img/notification.png" style="width:30px"></a>
		          <ul class="dropdown-menu">
		            <li><a class="dropdown-item" href="">noti영역</a></li>
		            <li><a class="dropdown-item" href="">noti영역</a></li>
		            <li><a class="dropdown-item" href="">noti영역</a></li>
		            <li><a class="dropdown-item" href="">noti영역</a></li>
		          </ul>
     		   </li>
			</ul>
			   <button type="button" class="btn btn-primary position-relative">
				  <img src="/marrymate/img/notification.png" style="width:30px">
				  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
				    99+
				    <span class="visually-hidden"></span>
				  </span>
				</button>
	</div>
</nav>


</header>
-->

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