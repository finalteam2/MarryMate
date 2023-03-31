<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarryMate</title>
<link href="/marrymate/css/style.css" rel="stylesheet">
<link href="/marrymate/css/searchStyle.css" rel="stylesheet">
<script src="/marrymate/js/httpRequest.js"></script>
<script src="js/searchHall.js"></script>

</head>
<body onload="searchHall('1')">
<%@include file="../header.jsp" %>
<h1>예식장</h1>
<input type="hidden" name="kind" id="kind" value="${kind }">
<div class="searchbox">
<table>
<tr>
	<th>지역</th>
	<td>
		<select name="sido" id="sido">
			<option>전국</option>
			<option>서울</option>
			<option>인천</option>
			<option>대전</option>
			<option>광주</option>
			<option>울산</option>
			<option>부산</option>
			<option>경기</option>
			<option>강원</option>
			<option>충북</option>
			<option>충남</option>
			<option>전북</option>
			<option>전남</option>
			<option>경북</option>
			<option>경남</option>
			<option>제주</option>
		</select>
		<select name="sigungu" id="sigungu">
			<option>시군구</option>
			<option>강남구</option>
			<option>동대문구</option>
		</select>
	</td>
</tr>
<tr>
	<th>식대비용</th>
	<td>
		<input type="text" name="payMin" id="payMin">
		<input type="text" name="payMax" id="payMax">
	</td>
</tr>
<tr>
	<th>하객보증인원</th>
	<td>
		<input type="text" name="guestMin" id="guestMin">
		<input type="text" name="guestMax" id="guestMax">
	</td>
</tr>
<tr>
	<th>예식장명</th>
	<td>
		<input type="text" name="name" id="name">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="button" value="검색" onclick="searchHall('1')">
		<input type="reset" value="다시입력">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="radio" name="sort" value="1" checked="checked">이름순
		<input type="radio" name="sort" value="2">조회수순
		<input type="radio" name="sort" value="3">낮은가격순
		<input type="radio" name="sort" value="4">높은가격순
		<select name="view" id="view">
			<option value="4" selected="selected">4개씩 보기</option>
			<option value="8">8개씩 보기</option>
			<option value="12">12개씩 보기</option>
		</select>
	</td>
</tr>
</table>
</div>
<div id="totalCnt"></div>
<div class="container" id="container"></div>
<div id="paging"></div>
<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>