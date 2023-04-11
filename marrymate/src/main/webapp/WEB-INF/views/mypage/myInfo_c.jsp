<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My 정보수정</title>
<link href="/marrymate/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<h2>My 정보수정</h2><br>
		<hr>
		<br>
		<div id="cBox">
			<form name="companyInfoUpdate" action="comUpdate.do">
			<input type="hidden" name="cidx" value=${sessionScope.com_cidx }>
				<div class="hTagBox">아이디</div>
				<input type="text" name="id" value="${comInfo.id }" disabled required><br>
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
				<input type="text" name="curl" value="${comInfo.curl }"><br>
				<div class="hTagBox">기업소개</div>
				<textarea style="resize: none" name="intro" rows="11" cols="50">${comInfo.intro }</textarea><br>
				<br>
				<div class="hTagBox">대표이미지</div>
				<img src="/marrymate/img/com_best/${comInfo.img }">
				<input type="file" name="aimg" accept="image/*"><br>
				<br>
				<div class="bBox">
				<input type="submit" class="btn" value="수정">
				<input type="reset" class="btn" value="다시작성"></div>
			</form>
			
				<hr>
				<div>booktime</div>
				<c:if test="${empty barr }">업서용</c:if>
				<c:forEach var="dto" items="${barr }">
				${dto.bktime_idx }
				${dto.cidx }
				${dto.yoil }
				${dto.worktime }
				<br>
				</c:forEach>
				<hr>
				<hr>
				<div>comimg</div>
				<c:if test="${empty iarr }">업서용</c:if>
				<c:forEach var="dto" items="${iarr }">
				${dto.iidx }
				${dto.cidx }
				${dto.type }
				${dto.img }
				<br>
				</c:forEach>
				
				<hr>
			
				<c:if test="${comInfo.kind == '예식장' }">
				<div class="hTagBox">홀</div><br>
				<table id="ht">
					<thead>
						<tr>
							<th>홀 명칭</th>
							<th>예식시간</th>
							<th>홀 대여료</th>
							<th>보증인원</th>
							<th class="t">수정</th>
							<th class="t">삭제</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="hall" items="${hallInfo }">
						<tr>
							<td>
							<form name="hallInfoUpdate" action="hallUpdate.do">
							<input type="hidden" name="hidx" value=${hall.hidx }>
							<input type="text" name="name" value="${hall.name }" required> 홀</td>
							<td><input type="text" name="time" value="${hall.time }" required> 시간</td>
							<td><input type="text" name="pay" value="${hall.pay }" required> 원</td>
							<td><input type="text" name="guest_num" value="${hall.guest_num }" required> 명</td>
							<td><input type="submit" value="수정">
							</form>	
							</td>
							<td>
							<form name="hallDelete" action="deleteHall.do" method="POST">
							<input type="hidden" name="hidx" value=${hall.hidx }>
							<input type="submit" value="삭제">
							</form>	
							</td>
						</tr>
					</c:forEach>
						<tr>
							<td>
							<form name="hallInsert" action="insertHall.do" method="POST">
							<input type="hidden" name="cidx" value=${sessionScope.com_cidx }>
							<input type="text" name="name" required> 홀</td>
							<td><input type="text" name="time" required> 시간</td>
							<td><input type="text" name="pay"  required> 원</td>
							<td><input type="text" name="guest_num" required> 명</td>
							<td colspan="2"><input type="submit" value="추가">
							</form>	
							</td>
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
							<th>식사가격</th>
							<th class="t">수정</th>
							<th class="t">삭제</th>
						</tr>
					</thead>
					<tbody>
					<c:forEach var="food" items="${foodInfo }">
						<tr>
							<td>
							<form name="foodInfoUpdate" action="foodUpdate.do">
							<input type="text" name="name" value="${food.name }" required></td>
							<td><input type="text" name="pay" value="${food.pay }" required>원</td>
							<td><input type="submit" value="수정">
							</form>	
							</td>
							<td>
							<form name="foodDelete" action="deleteFood.do" method="POST">
							<input type="hidden" name="fidx" value=${food.fidx }>
							<input type="submit" value="삭제">
							</form>	
							</td>
						</tr>
					</c:forEach>
						<tr>
							<td>
							<form name="foodinsert" action="insertFood.do" method="POST">
							<input type="hidden" name="cidx" value=${sessionScope.com_cidx }>
							<input type="text" name="name" value="${food.name }" required></td>
							<td><input type="text" name="pay" value="${food.pay }" required>원</td>
							<td><input type="submit" value="추가">
							</form>	
							</td>
						</tr>
					</tbody>
				</table>
				</c:if>
				<c:if test="${comInfo.kind != '예식장' }">
				<div class="hTagBox">요금</div><br>
				<table id="ht">
					<thead>
						<tr>
							<th>금액</th>
						</tr>
						<td><input type="text" value="${comInfo.pay }" required>원</td>
					</thead>
				</table>	
				</c:if>
				<br>
				<div class="bBox">
				<input type="button" class="btn2" value="수정완료" onclick="location.href='index.do'"></div>
		</div>
	</article>
</section>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>