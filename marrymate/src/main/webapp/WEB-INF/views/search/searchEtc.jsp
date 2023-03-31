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
<script src="/marrymate/js/searchEtc.js"></script>
</head>
<body onload="searchEtc('1')">
<%@include file="../header.jsp" %>
<h1>웨딩컬렉션</h1>
<div class="searchbox">
<table>
<tr>
	<th>분류</th>
	<td>
		<select name="kind" id="kind">
			<option>스튜디오</option>
			<option>헤어메이크업</option>
			<option>드레스</option>
			<option>사진영상</option>
			<option>주례</option>
			<option>사회</option>
			<option>축가</option>
		</select>
	</td>
</tr>
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
	</td>
</tr>
<tr>
	<th>비용</th>
	<td>
		<input type="text" name="payMin" id="payMin">
		<input type="text" name="payMax" id="payMax">
	</td>
</tr>
<tr>
	<th>업체명</th>
	<td>
		<input type="text" name="name" id="name">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="button" value="검색" onclick="searchEtc('1')">
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