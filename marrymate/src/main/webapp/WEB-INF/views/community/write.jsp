<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>marrymate</title>
<style>
	article div input[type=text] {
		width: 350px;
		height: 30px;
		font-size: 13px;
		border: 1px solid black;
		border-radius: 12px;
		}
	article div input[type=file] {
		width: 200px;
		}
	article div input[type=text]::placeholder {
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
	select {
		width: 150px; 
		padding: .8em .5em; 
		margin-top: 5px;
		margin-bottom: 5px;
		border: 1px solid #999;
		text-align: center;
		font-family: inherit;  
		background: no-repeat 95% 50%; 
		border-radius: 0px; 
		-webkit-appearance: none; 
		-moz-appearance: none;
		appearance: none;
	}
	.box {
		width: 850px;
		border: 1px solid black;
		border-radius: 30px;
		margin: 0px auto;
		margin-bottom: 50px;
	}
	.hTagBox {
		width: 120px;
		height: 45px;
		text-align: center;
		float: left;
		font-size: 13px;
	}
	.hClear {
		width: 120px;
		height: 45px;
		clear: both;
		float: left;
		text-align: center;
		font-size: 13px;
	}
	.jcBox input:required {
		font-size: 13px;
	}
	.ta {
		margin-top: 10px;
		resize: none;
		font-family: sans-serif;
	}
	.tc {
		text-align: center;
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
	#iBox {
		width: 800px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 50px;
		margin-top: 20px;
		padding-bottom: 10px;
		line-height: 45px;
		border-bottom: 2px dashed black;
	}
	#jBox {
		width: 350px;
		height: 60px;
		margin-left: auto;
		margin-right: auto;
		margin-bottom: 30px;
		text-align: center;
	}
</style>
</head>
<body>
	<section>
		<article>
			<h2>게시글 작성</h2>
			<form name="write" action="write.do" method="post" enctype="multipart/form-data">
			<div class="box">
				<div id="iBox">
					<input type="hidden" name="midx" value="${sessionScope.loginMidx}">
					<div class="hTagBox">카테고리</div>
						<select name="kind">
							<option value="웨딩후기">웨딩후기</option>
							<option value="웨딩톡톡">웨딩톡톡</option>
						</select><br>
					<div class="hClear">말머리</div>
						<select name="horse">
							<option value="가전">가전</option>
							<option value="신혼집">신혼집</option>
							<option value="신혼혼수">신혼혼수</option>
							<option value="상견례">상견례</option>
							<option value="프로포즈">프로포즈</option>
							<option value="인테리어">인테리어</option>
							<option value="다이어트">다이어트</option>
						</select><br>
					<div class="hClear">제목</div>
						<input type="text" name="subject"><br>
					<div class="hTagBox">내용</div>
						<textarea name="content" rows="20" cols="80" class=ta></textarea><br>
					<div class="hClear">이미지 첨부</div>	
						<input type="file" name="img">
				</div>
				<div id="jBox">
					<input type="submit" class="w-btn-outline w-btn-red-outline" value="작성완료">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="w-btn-outline w-btn-red-outline" value="다시쓰기">
				</div>
			</div>
			</form>
		</article>
	</section>
</body>
</html>