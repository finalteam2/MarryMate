<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>search.jsp</h1>

<form>
<table>
<tr>
	<th>카테고리</th>
	<td>
		<select name="category">
			<option>스튜디오</option>
			<option>드레스</option>
			<option>헤어/메이크업</option>
		</select>
	</td>
</tr>
<tr>
	<th>지역</th>
	<td>
		<select name="sido">
			<option>sido1</option>
			<option>sido2</option>
		</select>
		<select name="sigungu">
			<option>sigungu1</option>
			<option>sigungu2</option>
		</select>
	</td>
</tr>
<tr>
	<th>가격</th>
	<td>
		<input type="text" name="foodMin">
		<input type="text" name="foodMax">
	</td>
</tr>
<tr>
	<th>이름</th>
	<td>
		<input type="text" name="name">
	</td>
</tr>

<tr>
	<td colspan="2">
		<input type="submit" value="검색">
		<input type="reset" value="다시입력">
	</td>
</tr>
</table>
</form>

<div>
<input type="button" value="이름순" onclick="">
<input type="button" value="조회수순" onclick="">
<input type="button" value="낮은가격순" onclick="">
<input type="button" value="높은가격순" onclick="">
<select onselect="">
	<option>5개씩 보기</option>
	<option>10개씩 보기</option>
	<option>15개씩 보기</option>
</select>
</div>

<div>
	search result
</div>

<div>
</div>
</body>
</html>