<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 정보수정</title>
<style type="text/css">
	article div input[type=text] {
		width: 230px;
		height: 30px;
		font-size: 17px;
		font-family: 'GmarketSansMedium';
		border: 1px solid black;
		border-radius: 12px;
		text-align: center;
		}
	article div input[type=password] {
		width: 230px;
		height: 30px;
		font-size: 15px;
		border: 1px solid black;
		border-radius: 12px;
		text-align: center;
		}
	article div input[type=text]::placeholder {
		font-family: sans-serif; 
		font-size: 10px;
	}
	article div input[type=password]::placeholder {
		font-family: sans-serif; 
		font-size: 10px;
	}
	.hTagBox {
		width: 120px;
		height: 45px;
		text-align: center;
		float: left;
	}
	#fBox{
		width: 200px;
		heigth: 600px;
		position:absolute;
		top:20%;
		left:5%;
		text-align: center;
	}
	#mBox {
		width: 560px;
		height: 600px;
		margin: 50px auto;
		padding-left: 90px;
		line-height: 45px;
		position: absolute;
		top: 20%;
		left: 35%;
	}
	.bBox {
		width: 350px;
		height: 60px;
		margin: auto;
		text-align: center;
	}
	.iBox {
		width: 150px;
    	height: 150px; 
    	border-radius: 70%;
    	overflow: hidden;
    	margin:0px auto;
	}
	.profile {
		width: 100%;
    	height: 100%;
    	object-fit: cover;  	
	}
	.btn {
		width: 90px;
		height: 40px;
	    border: none;
	    display: inline-block;
	    border-radius: 15px;
	    font-family: 'GmarketSansMedium';
	    font-size: 14px;
	    font-weight: 600;
	    text-align: center;
	}
</style>
</head>
<body>
<section>
	<article>
		<h2>My 정보수정</h2><br>
		<hr>
		<div id="fBox">
		 <div class="iBox">
		 <img src="/marrymate/img/user.png" class="profile">
		 </div><br>
		 <div>
		 <input type="button" class="btn" value="사진변경" onclick="changeImg()"><br><br>
		 <input type="button" class="btn" value="회원탈퇴" onclick="memberDel()">
		 </div>
		</div>
		<div id="mBox">
				<div class="hTagBox">이름</div>
				<input type="text" name="name" value="" readonly required><br>
				<div class="hTagBox">아이디</div>
				<input type="text" name="id" value="" readonly required><br>
				<div class="hTagBox">생년월일</div>
				<input type="date" name="birthday" value="" readonly required><br>
				<div class="hTagBox">성별</div>
				<span><input type="radio" name="gender" value="male" checked>남
				<input type="radio" name="gender" value="female">여</span><br>
				<div class="hTagBox">닉네임</div>
				<input type="text" name="nick" value="" required><br>
				<div class="hTagBox">비밀번호</div>
				<input type="password" name="pwd" value="" required><br>
				<div class="hTagBox">전화번호</div>
				<input type="text" name="tel" value="" required><br>
				<div class="hTagBox">주소</div>
				<input type="text" name="juso" value="" required><br>			
				<div class="hTagBox">상세주소</div>
				<input type="text" name="sjuso" value="" required><br>
				<div class="hTagBox">예식날짜</div>
				<input type="date" name="marrydate" value="" required><br>
				<div class="hTagBox">배우자</div>
				<input type="text" name="pname" value="" required><br><br>
				<div class="bBox"><input type="button" class="btn" value="수정" onclick="memberUpdate()">
				<input type="reset" class="btn" value="취소"></div>
		</div>
	</article>
</section>
</body>
<script>
function changeImg(){
	
}
function memberDel(){
	
}
function memberUpdate(){
	
}
</script>
</html>