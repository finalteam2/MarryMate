<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
					<input type="time" name="worktime"> <input type="submit"
						value="추가하기">
				</div>
			</div>
			<div id="jBox">
				<input type="submit" class="w-btn-outline w-btn-red-outline" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="reset" class="w-btn-outline w-btn-red-outline" value="다시입력">
			</div>
		</form>
		<form name="img" action="img.do" method="post" enctype="multipart/form-data">
			<div class="iBox">
				<h2>이미지 등록</h2>
				<input type="hidden" name="cidx" value="${sessionScope.cidx}">
				<div id="file-inputs">
					<input type="file" name="img1">
				</div>
				<button type="button" onclick="addFileInput()">파일 추가</button>
			</div>
			<div id="jBox">
				<input type="submit" class="w-btn-outline w-btn-red-outline" value="회원가입">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="reset" class="w-btn-outline w-btn-red-outline" value="다시입력">
			</div>
		</form>
	</div>
</body>
</html>