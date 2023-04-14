<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 정보수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<link href="/marrymate/css/style.css" rel="stylesheet">
<link href="/marrymate/css/revboot.css" rel="stylesheet">
<style>
.sizefix{
	width: 640px;
	margin: 0 auto;
}
.imgbox {
    width: 200px;
    height: 200px; 
    border-radius: 70%;
    overflow: hidden;
    margin: 0 auto;
    margin-bottom: 15px;
}
.profileimg {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article class="sizefix">
		<h2>My 정보수정</h2><br>
		<div class="imgbox">
		<img src="/marrymate/img/member/${userInfo.img }" class="profileimg rounded mx-auto d-block" alt="profile_img">
		</div>
		 <form name="imgChange" action="imgChange.do" method="post" enctype="multipart/form-data">
   		 <input type="hidden" name="midx" value=${sessionScope.loginMidx }>
		 <div class="input-group">
		  <input type="file" class="form-control" name="mimg" accept="image/*" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
		  <button class="btn btn-outline-secondary" type="submit" id="inputGroupFileAddon04">프로필 이미지 변경</button>
		 </div>
		 </form>
		 
		 <hr>
		 
		<form name="myInfoUpdate" action="update.do">
		
			<input type="hidden" name="midx" value=${sessionScope.loginMidx }>
			<div class="input-group mb-3">
			  <span class="input-group-text">이름</span>
			  <input type="text" name="name" value="${userInfo.name }" readonly required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">아이디</span>
			  <input type="text" name="id" value="${userInfo.id }" readonly required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">비밀번호</span>
			  <input type="password" name="pwd" value="${userInfo.pwd }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">생년월일</span>
			  <input type="date" name="birthday" value="${userInfo.birthday }" readonly required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">성별</span>
				<c:if test="${userInfo.gender eq '남' }">
				  <button type="button" class="btn btn-primary">남자</button>
				</c:if>
				<c:if test="${userInfo.gender eq '여' }">
				  <button type="button" class="btn btn-primary">여자</button>
				</c:if>
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">닉네임</span>
			  <input type="text" name="nick" value="${userInfo.nick }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">전화번호</span>
			  <input type="text" name="tel" value="${userInfo.tel }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">주소</span>
			  <input type="text" name="juso" value="${userInfo.juso }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">상세주소</span>
			  <input type="text" name="sjuso" value="${userInfo.sjuso }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">예식날짜</span>
			  <input type="date" name="marrydate" value="${userInfo.marrydate }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">배우자</span>
			  <input type="text" name="pname" value="${userInfo.pname }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<button type="submit" class="btn btn-primary">정보수정</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='index.do'">메인으로</button>
			<br>
			<br>
		</form>
	</article>
</section>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>