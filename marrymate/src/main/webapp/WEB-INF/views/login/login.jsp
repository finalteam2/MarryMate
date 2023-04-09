<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarryMate</title>
<style>
	#loBox {
		width: 450px;
		height: 360px;
		margin: auto;
		text-align: center;
	}
	#idBox {
		width: 300px;
		height: 200px;
		margin: auto;
		padding-top: 20px;
	}
	#goBox {
		padding-top: 30px;
	}
	#reBox {
		padding-top: 5px;
		text-align: center;
	}
	#moBox {
		padding-top: 30px;
		text-align: center;
	}
	#ct {
		text-align: center;
	}
	#toBox {
		width: 500px;
		height: 400px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50px;
		padding-top: 20px;
		text-align: center;
		border: 1px solid black;
	}
	.teBox {
		width: 200px;
		height: 30px;
		text-align: center;
		margin: auto;
		padding-top: 10px;
		padding-bottom: 5px;
		font-size: 20px;
		font-weight: bold;
	}
	.cc {
		width: 200px;
		height: 50px;
		font-size: 15px;
		font-weight: bold;
		border: 0;
	}
	.cc:hover {
		border: 0;
		background-color: blue;
		color: white;
		cursor: pointer;
	}
	.cc:active {
		background: black;
		color: white;
	}
	h2 {
		font-size: 36px;
		text-align: center;
	}
	form div input[type=text] {
		width: 230px;
		height: 30px;
		font-size: 17px;
		border: 1px solid black;
		border-radius: 12px;
		text-align: center;
		}
	form div input[type=password] {
		width: 230px;
		height: 30px;
		font-size: 17px;
		border: 1px solid black;
		border-radius: 12px;
		text-align: center;
		}
	form div [type=text]::placeholder {
		font-family: sans-serif; 
		font-size: 10px;
	}
	form div [type=password]::placeholder {
		font-family: sans-serif; 
		font-size: 10px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<h2>로그인</h2>
	<div id="toBox">
		<input type="radio" name="userType" value="normal" checked>일반회원
		<input type="radio" name="userType" value="company">기업회원
		<form name="login" id="normalForm" action="login.do" method="post">
		    <div id="loBox">
		        <div id="idBox">
		            <div class="teBox">ID</div><input type="text" name="id" placeholder="아이디 입력" value="${cookie.saveid.value}">
		            <div id="reBox"><input type="checkbox" name="saveid" ${empty cookie.saveid.value?'':'checked' }>ID 기억하기</div>
		            <div class="teBox">Password</div><input type="password" name="pwd" placeholder="비밀번호 입력">
		            <div id="goBox"><input type="submit" value="로그인" class="cc"></div>
		            <div id="moBox">
		                <a href="memberJoin.do">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		                <a href="#">ID 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		                <a href="#">비밀번호 찾기</a>
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
		                <a href="companyJoin.do">회원가입</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		                <a href="#">ID 찾기</a>&nbsp;&nbsp;|&nbsp;&nbsp;
		                <a href="#">비밀번호 찾기</a>
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
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>