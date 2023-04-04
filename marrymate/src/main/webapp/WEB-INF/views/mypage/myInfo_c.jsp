<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
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
	#ht{
	width: 90%;
	margin: auto;
	border-collapse: collapse;
	text-align: center;	
	}
	#ht thead{
	border-bottom: 20px solid white;
	background-color: #c797eb;
	}
	#ht thead th{
	color: white;
	font-family: 'SUIT-Regular';
	font-size: 14px;
	font-weight: bold;
	}
	.hTagBox {
		width: 120px;
		height: 45px;
		text-align: center;
		float: left;
	}
	#cBox {
		width: 560px;
		height: 600px;
		margin: 0px auto;
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
		<br>
		<div id="cBox">
			<form name="companyInfo" action="comUpdate.do">
				<div class="hTagBox">아이디</div>
				<input type="text" name="id" value="${comInfo.id }" readonly required><br>
				<div class="hTagBox">비밀번호</div>
				<input type="password" name="pwd" value="${comInfo.pwd }" readonly required><br>
				<div class="hTagBox">사업자등록번호</div>
				<input type="text" name="cnum" value="${comInfo.cnum }" readonly required><br>
				<div class="hTagBox">업체명</div>
				<input type="text" name="cname" value="${comInfo.cname }" required><br>
				<div class="hTagBox">전화번호</div>
				<input type="text" name="tel" value="${comInfo.tel }" required><br>
				<div class="hTagBox">E-mail</div>
				<input type="text" name="email" value="${comInfo.email }" required><br>
				<div class="hTagBox">주소</div>
				<input type="text" name="juso" value="${comInfo.juso }" required><br>			
				<div class="hTagBox">상세주소</div>
				<input type="text" name="sjuso" value="${comInfo.sjuso }" required><br> 
				<div class="hTagBox">웹사이트</div>
				<input type="text" name="curl" value="${comInfo.curl }" required><br>
				<div class="hTagBox">기업소개</div>
				<textarea style="resize: none" name="intro" rows="11" cols="50" value="${comInfo.intro }"></textarea><br><br>
				<hr>
				<br>
				<div class="hTagBox">대표이미지</div>
				<c:if test="${!empty comInfo.img}">
				<img src="/marrymate/img/company/${comInfo.img }">
				</c:if>
				<c:if test="${empty comInfo.img}">
				<img src="/marrymate/img/nomal.png">
				</c:if>
				<input type="file" name="aimg" accept="image/*"><br>
				<hr>
				<br>
				<div class="hTagBox">홀</div><br>
				<table id="ht">
					<thead>
						<tr>
							<th>홀 명칭</th>
							<th>예식시간</th>
							<th>홀 대여료</th>
							<th>보증인원</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							
						</tr>
					</tbody>
				</table>
				<hr>
				<br>
				<div class="hTagBox">식대</div><br>
				<table id="ht">
					<thead>
						<tr>
							<th>식사종류</th>
							<th>식사메뉴</th>
							<th>식사가격</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" value="${foodInfo.type }"></td>
							<td><input type="text" value="${foodInfo.name }"></td>
							<td><input type="text" value="${foodInfo.pay }"></td>
						</tr>
					</tbody>
				</table>
				<br>
				<div class="bBox">
				<input type="submit" class="btn" value="수정">
				<input type="reset" class="btn" value="취소"></div>
			</form>
		</div>
	</article>
</section>
</body>
</html>