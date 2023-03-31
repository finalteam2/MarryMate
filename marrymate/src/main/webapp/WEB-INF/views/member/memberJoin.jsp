<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>marrymate</title>
<style>
	article div input[type=text] {
		width: 230px;
		height: 30px;
		font-size: 17px;
		border: 1px solid black;
		border-radius: 12px;
		text-align: center;
		}
	article div input[type=password] {
		width: 230px;
		height: 25px;
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
	h2{
		font-size: 32px;
		text-align: center;
	}
	h3 {
		font-size: 20px;
	}
	.box {
		width: 850px;
		height: 1800px;
		border: 1px solid black;
		border-radius: 30px;
		margin: 0px auto;
		margin-bottom: 50px;
	}
	.hTagBox {
		width: 120px;
		height: 45px;
		text-align: center;
		font-size: 13px;
		float: left;
	}
	.hClear {
		width: 120px;
		height: 45px;
		clear: both;
		float: left;
		text-align: center;
		font-size: 13px;
	}
	.tBox {
		width: 700px;
		height: 280px;
		margin: auto;
		text-align: center;
	}
	.jcBox {
		width: 620px;
		height: 18px;
		margin: auto;
		text-align: right;
		font-size: 13px;
	}
	.jcBox input:required {
		font-size: 13px;
	}
	.ta {
		resize: none;
	}
	.w-btn-red {
	    background-color: #ff5f2e;
	    color: #e1eef6;
	}
	.w-btn-red-outline {
	    border: 3px solid #ff5f2e;
	    background-color: white;
	    color: black;
	}
	.w-btn-red-outline:hover {
	    background-color: #ff5f2e;
	    color: #e1eef6;
	}
	.w-btn {
		width: 130px;
		height: 60px;
	    position: relative;
	    border: none;
	    display: inline-block;
	    padding: 15px 30px;
	    border-radius: 15px;
	    font-size: 18px;
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
	    
	}
	.w-btn-outline {
	    position: relative;
	    padding: 15px 30px;
	    border-radius: 15px;
	    font-size: 18px;
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
	    
	}
	.w-btn:hover {
	    letter-spacing: 2px;
	    transform: scale(1.2);
	    cursor: pointer;
	}
	
	.w-btn-outline:hover {
	    letter-spacing: 2px;
	    transform: scale(1.2);
	    cursor: pointer;
	}
	
	.w-btn:active {
	    transform: scale(1.5);
	}
	
	.w-btn-outline:active {
	    transform: scale(1.5);
	}
	.cc {
		width: 80px;
		height: 30px;
		border: 0;
		border-radius: 12px;
	}
	.cc:hover {
		border: 0;
		border-radius: 12px;
		background-color: blue;
		color: white;
		cursor: pointer;
	}
	.cc:active {
		background: black;
		color: white;
	}
	.id_ok{
	color:#008000;
	display: none;
	}
	.id_already{
	color:#6A82FB; 
	display: none;
	}
	#iBox {
		width: 600px;
		height: 625px;
		margin: 50px auto;
		padding-left: 100px;
		line-height: 45px;
		border-bottom: 2px dashed black;
	}
	#jBox {
		width: 350px;
		height: 60px;
		margin: auto;
		padding-top: 30px;
		text-align: center;
	}
</style>
<script>
</script>
</head>
<body>
	<section>
		<article>
			<h2>회원가입</h2>
			<form name="memberJoin" action="memberJoin.do" method="post">
			<div class="box">
				<div id="iBox">
					<input type="hidden" name="point" value="0">
					<input type="hidden" name="img" value="imgfile">
					<div class="hClear">이름</div>
					<input type="text" name="name"><br>
					<div class="hTagBox">생년월일</div>
					<input type="date" name="birthday" placeholder="xxxx-xx-xx ('-'없이 입력)"><br>
					<div class="hClear">성별</div>
					<input type="radio" name="gender" value="남">남
					<input type="radio" name="gender" value="여">여<br>
					<div class="hTagBox">닉네임</div>
					<input type="text" name="nick" placeholder="중복확인을 진행해주세요">&nbsp;&nbsp;
					<input type="button" value="중복확인" class="cc" onblur="checkNick()"><br>
					<div class="hClear">아이디</div>
					<input type="text" id="id" name="id" oninput = "checkId()" placeholder="중복확인을 진행해주세요">&nbsp;&nbsp;
					<input type="button" value="중복확인" class="cc">
					<span class="id_ok">사용 가능한 아이디입니다.</span>
					<span class="id_already">누군가 이 아이디를 사용하고 있어요.</span><br>
					<div class="hTagBox">비밀번호</div>
					<input type="password" id="pwd" name="pwd" onchange="check_pwd()" placeholder="6자 이상 16자 이하(!,@,#,$,% 포함)"><br>
					<div class="hTagBox">전화번호</div>
					<input type="text" name="tel" placeholder="010-xxxx-xxxx"><br>
					<div class="hClear">주소</div>
					<input type="text" name="juso"><br>
					<div class="hTagBox">상세주소</div>
					<input type="text" name="sjuso"><br>
					<div class="hClear">추천인</div>
					<input type="text" name="gname"><br>
					<div class="hTagBox">예식날짜</div>
					<input type="date" name="marrydate" placeholder="xxxx-xx-xx ('-'없이 입력)">&nbsp;&nbsp;&nbsp;<input type="checkbox" name="marrydate">미정<br>
					<div class="hClear">배우자</div>
					<input type="text" name="pname"><br>
				</div>
				<div class="tBox">
					<h3>이용약관</h3>
					<textarea class="ta" rows="15" cols="80" readonly>
						<jsp:include page="memberRule_1.jsp"></jsp:include>
					</textarea>
				</div>
				<div class="jcBox">
					<input type="checkbox">&nbsp;약관에 동의합니다.
				</div>
				<div class="tBox">
					<h3>개인정보 취급방침</h3>
					<textarea class="ta" rows="15" cols="80" readonly>
						<jsp:include page="memberRule_2.jsp"></jsp:include>
					</textarea>
					</div>
				<div class="jcBox">
					<input type="checkbox">&nbsp;개인정보 취급방침에 동의합니다.
				</div>
				<div class="tBox">
					<h3>이벤트 수신약관 동의(선택)</h3>
					<textarea class="ta" rows="15" cols="80" readonly>
						<jsp:include page="memberRule_3.jsp"></jsp:include>						
					</textarea>
				</div>
				<div class="jcBox">
					<input type="checkbox" name="e_check" value="1">&nbsp;이벤트 수신에 동의합니다.
				</div>
				<div id="jBox">
					<input type="submit" class="w-btn-outline w-btn-red-outline" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="w-btn-outline w-btn-red-outline" value="다시입력">
				</div>
			</div>
			</form>
		</article>
	</section>
</body>
</html>