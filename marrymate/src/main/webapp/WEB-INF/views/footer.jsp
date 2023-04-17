<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
@font-face {
	font-family: 'SUIT-Regular';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

footer #foot1 {
	background-color: #b7a2d5;
	color: #fff;
	font-size: 15px;
}

footer #foot2 {
	margin: auto;
    width: 80%;
    line-height: 25px;
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    flex-wrap: nowrap;
    flex-direction: column;
    align-content: center;
}


footer #foottop {
	margin: auto;
    width: 99.6%;
    border: 3px solid #ECCC83;
    align-self: center;
    font-size: 22px;
    background-color: #fff;
    height: 55px;
    text-align: center;
    display: flex;
    flex-wrap: nowrap;
    align-content: space-around;
    justify-content: center;
    align-items: center;
}

footer label {
	font-size: 16px;
    margin-left: 1050px;
}

#foottop a {
	text-decoration: none;
	color: #b794eb;
	margin-right: 60px;
	font-size: 18px;
	transition: color 2s;
}

#foottop a:hover {
	color: #cc33ff;
	font-weight: bold;
  	content: '';
   	border-bottom: solid 2px #cc33ff;
}

#foottop img {
	width: 35px;
	margin-right: 5px;
	text-align: right;
	justify-content: center;
}
</style>

<footer>

	<div id="foot1">
		<br>
		<div id="foottop">
			<a href="">회사소개</a> <a href="">개인정보취급방침</a> <a href="">광고문의 및
				제휴문의</a> 
			
				<img src="/marrymate/img/kakao-talk.png"> <img
				src="/marrymate/img/instagram.png"> <img
				src="/marrymate/img/facebook.png">
		</div>
		<div id="foot2">
			<br>
			<br>
			<div>
				&nbsp;<img id="logo" src="/marrymate/img/logo1.png"
					style="width: 180px;">&nbsp;<strong>&nbsp;&nbsp;<br>
					&nbsp;㈜ 메리메이트
				</strong>&nbsp;&nbsp;&nbsp;&nbsp; 대표이사 : 김정은&nbsp;&nbsp;&nbsp;&nbsp; 소재지 : 서울
				서대문구 신촌로 141 위고인빌딩 4층 401호
			</div>
			<br> &nbsp;이메일 문의 : contact@marrymate.com <br> &nbsp;전화문의 :
			02-123-4567 (평일 : 10:00 ~ 19:00, 주말/공휴일 제외) <label>© 2023
				MarryMate. All rights reserved.</label> <br>
			<br>
		</div>
	</div>
</footer>
