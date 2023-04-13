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
    width: 400px;
    height: 200px; 
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
		<img src="/marrymate/img/com_best/${comInfo.img }" class="profileimg rounded mx-auto d-block" alt="profile_img">
		</div>
		
		<form name="sImgChange" action="sImgChange.do" method="post" enctype="multipart/form-data">
		<input type="hidden" name="cidx" value=${sessionScope.com_cidx }>
		 <div class="input-group">
		  <input type="file" class="form-control" name="simg" accept="image/*" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
		  <button class="btn btn-outline-secondary" type="submit" id="inputGroupFileAddon04">대표 이미지 변경</button>
		 </div>
		</form>
		
		 <hr>
		 
		<form name="companyInfoUpdate" action="comUpdate.do">
		
			<input type="hidden" name="cidx" value=${sessionScope.com_cidx }>
			<div class="input-group mb-3">
			  <span class="input-group-text">업체명</span>
			  <input type="text" name="cname" value="${comInfo.cname }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">아이디</span>
			  <input type="text" name="id" value="${comInfo.id }" readonly required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">비밀번호</span>
			  <input type="password" name="pwd" value="${comInfo.pwd }" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">사업자등록번호</span>
			  <input type="text" name="cnum" value="${comInfo.cnum }" readonly required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">E-mail</span>
			  <input type="text" name="email" value="${comInfo.email }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">전화번호</span>
			  <input type="text" name="tel" value="${comInfo.tel }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">주소</span>
			  <input type="text" name="juso" value="${comInfo.juso }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">상세주소</span>
			  <input type="text" name="sjuso" value="${comInfo.sjuso }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">웹사이트</span>
			  <input type="text" name="curl" value="${comInfo.curl }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
			<div class="input-group mb-3">
			  <span class="input-group-text">기업소개</span>
			  <textarea class="form-control" name="intro" aria-label="With textarea">${comInfo.intro }</textarea>
		    </div>
			<div class="input-group mb-3">
			<c:if test="${comInfo.kind == '예식장' }">
			  <span class="input-group-text">최소식대</span>
			</c:if>
			<c:if test="${comInfo.kind != '예식장' }">
			  <span class="input-group-text">이용요금</span>
			</c:if>
			  <input type="text" name="pay" value="${comInfo.pay }" required class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
			</div>
		    
		    
		    		

			<button type="submit" class="btn btn-primary">정보수정</button>
			<button type="button" class="btn btn-secondary" onclick="location.href='index.do'">메인으로</button>
			<br>
			<br>
		</form>

		<hr>
		
		<h3>이용 시간 설정</h3>
		<c:if test="${empty barr }">예약 가능한 시간이 없습니다.</c:if>
		
		<table class="table table-hover">
	      <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">요일</th>
		      <th scope="col">시간</th>
		      <th scope="col" style="width: 70px;">삭제</th>
		    </tr>
		  </thead>
		  <tbody>
			<c:forEach varStatus="status" var="dto" items="${barr }">
			<form action="deleteBooktime.do" method="post">
			<input type="hidden" name="bktime_idx" value="${dto.bktime_idx }">
		    <tr>
		      <th scope="row">${status.count }</th>
		      <td>${dto.yoil }</td>
		      <td>${dto.worktime }</td>
		      <td><button type="submit" class="btn btn-outline-danger">삭제</button></td>
		    </tr>
			</form>
			</c:forEach>
		  </tbody>
		</table>
		
		<br>
		<!-- 예약 시간 추가 -->
		<form name="hallInfo" action="hallInfo.do" method="post">
		<input type="hidden" name="cidx" value=${sessionScope.com_cidx }>
		<div class="input-group mb-3">
		  <div class="input-group-text">
		    &nbsp;&nbsp;월<input class="form-check-input mt-0" type="checkbox" name="yoil1" value="월" aria-label="Checkbox for following text input">
		    &nbsp;&nbsp;화<input class="form-check-input mt-0" type="checkbox" name="yoil2" value="화" aria-label="Checkbox for following text input">
		    &nbsp;&nbsp;수<input class="form-check-input mt-0" type="checkbox" name="yoil3" value="수" aria-label="Checkbox for following text input">
		    &nbsp;&nbsp;목<input class="form-check-input mt-0" type="checkbox" name="yoil4" value="목" aria-label="Checkbox for following text input">
		    &nbsp;&nbsp;금<input class="form-check-input mt-0" type="checkbox" name="yoil5" value="금" aria-label="Checkbox for following text input">
		    &nbsp;&nbsp;토<input class="form-check-input mt-0" type="checkbox" name="yoil6" value="토" aria-label="Checkbox for following text input">
		    &nbsp;&nbsp;일<input class="form-check-input mt-0" type="checkbox" name="yoil7" value="일" aria-label="Checkbox for following text input">
		  </div>
		  <input type="time" name="worktime" class="form-control" aria-label="Text input with checkbox">
		  <button class="btn btn-outline-secondary" type="submit" id="button-addon2">예약 시간 추가</button>
		</div>
		</form>
				
		<hr>
		
		<h3>이미지 갤러리</h3>
		
		<c:if test="${empty iarr }">저장된 이미지가 없습니다.</c:if>
		<table class="table table-hover">
	      <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">제목</th>
		      <th scope="col">이미지</th>
		      <th scope="col" style="width: 70px;">삭제</th>
		    </tr>
		  </thead>
		  <tbody>
			<c:forEach varStatus="status" var="dto" items="${iarr }">
			<form action="deleteComimg.do" method="post">
			<input type="hidden" name="iidx" value="${dto.iidx }">
		    <tr>
		      <th scope="row">${status.count }</th>
		      <td>${dto.img }</td>
		      <td>
				<div class="imgbox">
				<img src="/marrymate/img/com_img/${dto.img }" class="profileimg rounded mx-auto d-block" alt="profile_img">
				</div>
			  </td>
		      <td><button type="submit" class="btn btn-outline-danger">삭제</button></td>
		    </tr>
			</form>
			</c:forEach>
		  </tbody>
		</table>
		
		<form name="img" action="img.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="cidx" value=${sessionScope.com_cidx }>
			 <div class="input-group">
			  <input type="file" class="form-control" name="img" accept="image/*" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" aria-label="Upload">
			  <button class="btn btn-outline-secondary" type="submit" id="inputGroupFileAddon04">이미지 등록</button>
			 </div>
		</form>
		
		<hr>

		<c:if test="${comInfo.kind == '예식장' }">
		
		<!-- 웨딩홀 종류 -->
		<table class="table table-hover">
	      <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">홀 명칭</th>
		      <th scope="col">예식시간(시간)</th>
		      <th scope="col">대관료(원)</th>
		      <th scope="col">보증인원(명)</th>
		      <th scope="col" style="width: 70px;">수정</th>
		      <th scope="col" style="width: 70px;">삭제</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach varStatus="status" var="hall" items="${hallInfo }">
			<form name="hallInfoUpdate" action="hallUpdate.do">
			<input type="hidden" name="hidx" value=${hall.hidx }>
		    <tr>
		      <th scope="row">${status.count }</th>
		      <td><input type="text" name="name" class="form-control" value="${hall.name }" required></td>
		      <td><input type="text" name="time" class="form-control" value="${hall.time }" required></td>
		      <td><input type="text" name="pay" class="form-control" value="${hall.pay }" required></td>
		      <td><input type="text" name="guest_num" class="form-control" value="${hall.guest_num }" required></td>
		      <td><button type="submit" class="btn btn-outline-primary">수정</button></td>
			</form>	
			<form name="hallDelete" action="deleteHall.do" method="POST">
			<input type="hidden" name="hidx" value=${hall.hidx }>
		      <td><button type="submit" class="btn btn-outline-danger">삭제</button></td>
			</form>	
		    </tr>
		  </c:forEach>
			<form name="hallInsert" action="insertHall.do" method="POST">
			<input type="hidden" name="cidx" value=${sessionScope.com_cidx }>
			<tr>
				<th scope="row">#</th>
				<td><input type="text" name="name" class="form-control" required></td>
				<td><input type="text" name="time" class="form-control" required></td>
				<td><input type="text" name="pay"  class="form-control" required></td>
				<td><input type="text" name="guest_num" class="form-control" required></td>
		        <td colspan="2"><button type="submit" class="btn btn-outline-primary">추가</button></td>
			</tr>
			</form>	
		  </tbody>
		</table>
		
		<hr>
			
		<!-- 식사 종류 -->		
		<table class="table table-hover">
	      <thead>
		    <tr>
		      <th scope="col">#</th>
		      <th scope="col">식사종류</th>
		      <th scope="col">식사가격</th>
		      <th scope="col" style="width: 70px;">수정</th>
		      <th scope="col" style="width: 70px;">삭제</th>
		    </tr>
		  </thead>
		  <tbody>
		  <c:forEach varStatus="status" var="food" items="${foodInfo }">
			<form name="foodInfoUpdate" action="foodUpdate.do">
		    <input type="hidden" name="fidx" value=${food.fidx }>
		    <tr>
		      <th scope="row">${status.count }</th>
		      <td><input type="text" name="name" class="form-control" value="${food.name }" required></td>
		      <td><input type="text" name="pay" class="form-control" value="${food.pay }" required></td>
		      <td><button type="submit" class="btn btn-outline-primary">수정</button></td>
			</form>	
			<form name="foodDelete" action="deleteFood.do" method="POST">
			<input type="hidden" name="fidx" value=${food.fidx }>
		      <td><button type="submit" class="btn btn-outline-danger">삭제</button></td>
			</form>	
		    </tr>
		  </c:forEach>
			<form name="foodinsert" action="insertFood.do" method="POST">
			<input type="hidden" name="cidx" value=${sessionScope.com_cidx }>
			<tr>
				<th scope="row">#</th>
				<td><input type="text" name="name" class="form-control" required></td>
				<td><input type="text" name="pay"  class="form-control" required></td>
		        <td colspan="2"><button type="submit" class="btn btn-outline-primary">추가</button></td>
			</tr>
			</form>	
		  </tbody>
		</table>
		
		<hr>
		</c:if>

		<button type="button" class="btn btn-secondary" onclick="location.href='index.do'">메인으로</button>
		<br>
		<br>
	</article>
</section>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>