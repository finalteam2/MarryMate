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
	article div input[type=number] {
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
	article div input[type=number]::placeholder {
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
	#cBox {
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
		 <input type="button" class="btn" value="상세정보" onclick="">
		 </div>
		</div>
		<div id="cBox">
			<form name="companyInfo" action="">
				<div class="hTagBox">아이디</div>
				<input type="text" name="cid" readonly required><br>
				<div class="hTagBox">비밀번호</div>
				<input type="password" name="pwd" readonly required><br>
				<div class="hTagBox">사업자등록번호</div>
				<input type="number" name="cnum" readonly required><br>
				<div class="hTagBox">업체명</div>
				<input type="text" name="cname" required><br>
				<div class="hTagBox">전화번호</div>
				<input type="text" name="tel" required><br>
				<div class="hTagBox">E-mail</div>
				<input type="text" name="email" required><br>
				<div class="hTagBox">주소</div>
				<input type="text" name="juso" required><br>			
				<div class="hTagBox">상세주소</div>
				<input type="text" name="sjuso" required><br>
				<div class="hTagBox">지역</div>
				 <select name="local">
					<option value="서울">서울</option>
					<option value="경기">경기</option>
					<option value="인천">인천</option>
					<option value="부산">부산</option>
					<option value="대전">대전</option>
					<option value="대구">대구</option>
					<option value="광주">광주</option>
					<option value="울산">울산</option>
					<option value="제주">제주</option>
					<option value="강원">강원</option>
					<option value="경북">경북</option>
					<option value="경남">경남</option>
					<option value="전북">전북</option>
					<option value="전남">전남</option>
					<option value="충북">충북</option>
					<option value="충남">충남</option>
				</select> 시,도
				<select>
				
				</select> 시,군,구<br>
				<div class="hTagBox">웹사이트</div>
				<input type="text" name="curl" required><br>
				<div class="hTagBox">기업소개</div>
				<textarea style="resize: none" name="intro" rows="11" cols="50"></textarea><br><br>
				<div class="bBox"><input type="submit" class="btn" value="수정">
				<input type="reset" class="btn" value="취소"></div>
			</form>
		</div>
	</article>
</section>
</body>
</html>