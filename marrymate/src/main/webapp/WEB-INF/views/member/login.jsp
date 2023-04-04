<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>marrymate</title>
<style>
	#loBox {
		width: 500px;
		height: 360px;
		margin: auto;
		text-align: center;
		border: 1px solid black;
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
	<h2>로그인</h2>
	<form name="login" action="login.do" method="post">
		<div id="loBox">
			<div id="idBox">
				<div class="teBox">ID</div><input type="text" name="id" placeholder="아이디 입력">
				<div id="reBox"><input type="checkbox" value="saveid">ID 기억하기</div>
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
</body>
</html>