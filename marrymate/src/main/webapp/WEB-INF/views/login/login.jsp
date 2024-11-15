<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarryMate</title>
<style>
	@font-face {
	    font-family: 'SUIT-Regular';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}
	#loBox {
		width: 450px;
		height: 360px;
		margin: auto;
		text-align: center;
		font-family: 'SUIT-Regular';
	}
	#idBox {
		width: 300px;
		height: 200px;
		margin: auto;
		padding-top: 20px;
		font-family: 'SUIT-Regular';
	}
	#goBox {
		padding-top: 30px;
		font-family: 'SUIT-Regular';
	}
	#reBox {
		padding-top: 5px;
		text-align: center;
		font-family: 'SUIT-Regular';
	}
	#moBox {
		padding-top: 30px;
		text-align: center;
		font-size: 17px;
		font-family: 'SUIT-Regular';
	}
	#moBox a {
		text-decoration: none;
		font-weight: bold;
		color: black;
	}
	#moBox a:hover {
		text-decoration: underline;
	}
	#ct {
		text-align: center;
		font-family: 'SUIT-Regular';
	}
	#toBox {
		width: 500px;
		height: 450px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 100px;
		padding-top: 20px;
		text-align: center;
		border: 2px solid #e3e3e3;
		border-radius: 20px;
		background-color: white;
		font-family: 'SUIT-Regular';
	}
	.teBox {
		width: 200px;
		height: 30px;
		text-align: center;
		margin-left: auto;
		margin-right: auto;
		padding-top: 10px;
		padding-bottom: 5px;
		font-size: 20px;
		font-weight: bold;
		font-family: 'SUIT-Regular';
	}
	.cc {
		width: 200px;
		height: 50px;
		margin-top: 15px;
		font-size: 17px;
		font-weight: bold;
		border: 0;
		border-radius: 12px;
		background-color: #5392f9;
		color:#fff;
	}
	.cc:hover {
		border: 0;
		background:#74a6fa;
		transition: all 0.4s;
		color: white;
		cursor: pointer;
	}
	.cc:active {
		background: black;
		color: white;
	}
	.select {
		padding-top: 24px;
	}
	.select input[type=radio]{
	    display: none;
	}
	.select input[type=radio]+label{
	    display: inline-block;
	    cursor: pointer;
	    height: 30px;
	    width: 108px;
	    border: 1px solid #d0d0d0;
	    border-radius: 5px;
	    line-height: 30px;
	    text-align: center;
	    font-weight:bold;
	    font-size:13px;
	}
	.select input[type=radio]+label{
	    background-color: #f4f4f4;
	    color: #333;
	}
	.select input[type=radio]:checked+label{
	    background-color: #ae59f4;
	    color: #fff;
	}
	body {
		background-color: #fbf4ff;
	}
	h2 {
		font-size: 36px;
		text-align: center;
		font-family: 'SUIT-Regular';
	}
	form div input[type=text] {
		width: 230px;
		height: 30px;
		font-size: 17px;
		border: 1px solid gray;
		border-radius: 5px;
		text-align: center;
		font-family: 'SUIT-Regular';
		}
	form div input[type=text]:focus{
		outline:none;
	}
	
	form div input[type=text]:hover, form div input[type=text]:active, form div input[type=text]:focus{
		border-color: #cf30fe;
		transition: all 0.4s;
	}
		
	form div input[type=password] {
		width: 230px;
		height: 30px;
		font-size: 17px;
		border: 1px solid gray;
		border-radius: 5px;
		text-align: center;
		font-family: 'SUIT-Regular';
		}
		
	form div input[type=password]:focus {
		outline:none;
	}
	
	form div input[type=password]:hover, form div input[type=password]:active, form div input[type=password]:focus{
		border-color: #cf30fe;
		transition: all 0.4s;
	}
	
	form div [type=text]::placeholder {
		font-family: sans-serif; 
		font-size: 13px;
		font-family: 'SUIT-Regular';
	}
	form div [type=password]::placeholder {
		font-family: sans-serif; 
		font-size: 13px;
		font-family: 'SUIT-Regular';
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<h2>로그인</h2>
	<div id="toBox">
		  <div class="select">
		     <input type="radio" id="select" name="shop" value="normal" checked><label for="select">일반회원</label>
		     <input type="radio" id="select2" name="shop" value="company"><label for="select2">기업회원</label>
		</div>
		<form name="login" id="normalForm" action="login.do" method="post">
		    <div id="loBox">
		        <div id="idBox">
		            <div class="teBox">ID</div><input type="text" name="id" placeholder="아이디 입력" value="${cookie.saveid.value}">
		            <div id="reBox"><input type="checkbox" name="saveid" ${empty cookie.saveid.value?'':'checked' }>ID 기억하기</div>
		            <div class="teBox">Password</div><input type="password" name="pwd" placeholder="비밀번호 입력">
		            <br>
		            <div id="goBox"><input type="submit" value="로그인" class="cc"></div>
		            <div id="moBox">
		                회원이 아니라면?&nbsp;&nbsp;<a href="memberJoin.do">회원가입</a>
		            </div>
		        </div>
		    </div>
		</form>
		<form name="login" id="companyForm" action="login_com.do" method="post" style="display:none">
		    <div id="loBox">
		        <div id="idBox">
		            <div class="teBox">ID</div><input type="text" name="id" placeholder="아이디 입력" value="${cookie.comSaveid.value}">
		            <div id="reBox"><input type="checkbox" name="comSaveid" ${empty cookie.comSaveid.value?'':'checked' }>ID 기억하기</div>
		            <div class="teBox">Password</div><input type="password" name="pwd" placeholder="비밀번호 입력">
		            <div id="goBox"><input type="submit" value="로그인" class="cc"></div>
		            <div id="moBox">
		                회원이 아니라면?&nbsp;&nbsp;<a href="companyJoin.do">회원가입</a>
		            </div>
		        </div>
		    </div>
		</form>
		<script>
		    const normalRadio = document.querySelector('input[value="normal"]');
		    const companyRadio = document.querySelector('input[value="company"]');
		
		    const normalForm = document.getElementById('normalForm');
		    const companyForm = document.getElementById('companyForm');
		
		    normalRadio.addEventListener('change', () => {
		        normalForm.style.display = 'block';
		        companyForm.style.display = 'none';
		    });
		
		    companyRadio.addEventListener('change', () => {
		        normalForm.style.display = 'none';
		        companyForm.style.display = 'block';
		    });
		</script>
	</div>
	<%@include file="/WEB-INF/views/chatbot.jsp" %>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>