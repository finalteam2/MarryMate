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
	.iBox {
		width: 600px;
		height: 300px;
		margin: 50px auto;
		padding-left: 100px;
		line-height: 45px;
		border-bottom: 2px dashed black;
		text-align: ceter;
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
	#jBox {
		width: 350px;
		height: 60px;
		margin: auto;
		padding-top: 30px;
		text-align: center;
	}
</style>
<script>
function addFileInput() {
	  var fileInputs = document.getElementById("file-inputs");
	  if (fileInputs.children.length < 5) {
	    var newInput = document.createElement("input");
	    newInput.setAttribute("type", "file");
	    newInput.setAttribute("name", "img" + (fileInputs.children.length + 1));

	    var deleteButton = document.createElement("button");
	    deleteButton.setAttribute("type", "button");
	    deleteButton.setAttribute("onclick", "deleteFileInput(this.parentNode)");
	    deleteButton.textContent = "삭제";

	    var wrapper = document.createElement("div");
	    wrapper.appendChild(newInput);
	    wrapper.appendChild(deleteButton);

	    fileInputs.appendChild(wrapper);
	  }
	}

	function deleteFileInput(inputWrapper) {
	  inputWrapper.remove();
	}
</script>

</head>
<body>
	<section>
		<article>
			<h2>회원가입</h2>
			<div class="box">
				<form name="hallInfo" action="hallInfo.do" method="post">
					<div class="iBox">
						<h3>이용시간</h3>
						<div>
							<input type="checkbox" name="yoil1" value="월">월
							<input type="checkbox" name="yoil2" value="화">화
							<input type="checkbox" name="yoil3" value="수">수
							<input type="checkbox" name="yoil4" value="목">목
							<input type="checkbox" name="yoil5" value="금">금
							<input type="checkbox" name="yoil6" value="토">토
							<input type="checkbox" name="yoil7" value="일">일
						</div>
						<div>
							<input type="hidden" name="cidx" value="${sessionScope.cidx}">
							<input type="time" name="worktime" placeholder="오전/오후 00:00(24시간 형식으로 입력)">
							<input type="submit" value="추가하기">
						</div>
					</div>
					<div id="jBox">
						<input type="submit" class="w-btn-outline w-btn-red-outline" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" class="w-btn-outline w-btn-red-outline" value="다시입력">
					</div>
				</form>
				<form name="food" action="food.do" method="post">
				<div class="iBox">
					<h2>식사 추가</h2>
					<div>
						<input type="hidden" name="cidx" value="${sessionScope.cidx}">
						<input type="hidden" name="type" value="0">
						<div class="hClear">메뉴</div>
							<input type="text" name="name"><br>
						<div class="hTagBox">가격</div>
							<input type="text" name="pay"><br>
					</div>
				</div>
				<div id="jBox">
					<input type="submit" class="w-btn-outline w-btn-red-outline" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="w-btn-outline w-btn-red-outline" value="다시입력">
				</div>
				</form>
				<form name="hall" action="hall.do" method="post">
					<div class="iBox">
						<h2>홀 등록</h2>
						<input type="hidden" name="cidx" value="69">
						<div class="hClear">홀명칭</div>
							<input type="text" name="name"><br>
						<div class="hTagBox">예식시간</div>
							<input type="text" name="time"><br>
						<div class="hClear">홀사용료</div>
							<input type="text" name="pay"><br>
						<div class="hTagBox">보증인원</div>
							<input type="text" name="guest_num"><br>
						<div class="hClear">좌석수</div>
							<input type="text" name="seat_num">
					</div>	
					<div id="jBox">
						<input type="submit" class="w-btn-outline w-btn-red-outline" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" class="w-btn-outline w-btn-red-outline" value="다시입력">
					</div>
				</form>
				<form name="img" action="img.do" method="post" enctype="multipart/form-data">
					<div class="iBox">
						<h2>이미지 등록</h2>
						<input type="hidden" name="cidx" value="69">
						<div id="file-inputs">
							<input type="file" name="img1">
						</div>
						<button type="button" onclick="addFileInput()">파일 추가</button>
					</div>	
					<div id="jBox">
						<input type="submit" class="w-btn-outline w-btn-red-outline" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" class="w-btn-outline w-btn-red-outline" value="다시입력">
					</div>
				</form>
			</div>
		</article>
	</section>
</body>
</html>