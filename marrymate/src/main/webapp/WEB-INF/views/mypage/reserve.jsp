<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역</title>
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
article table{
	width: 70%;
	margin-left: 25%;
	border-collapse: collapse;
	text-align: center;	
}
article table thead{
	border-bottom: 20px solid white;
	background-color: #c797eb;
}
article table thead th{
	color: white;
	font-family: 'SUIT-Regular';
	font-size: 20px;
	font-weight: bold;
}
.t{
	background-color: white;
}
article table tbody td{
	font-family: 'SUIT-Regular';
	font-size: 20px;
	font-weight: bold;
	padding-bottom: 10px;
}
h2{
	font-family: 'SUIT-Regular';
}
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-8 {
  background-color: #f0ecfc;
background-image: linear-gradient(315deg, #f0ecfc 0%, #c797eb 74%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-8 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-8:before,
.btn-8:after {
  position: absolute;
  content: "";
  right: 0;
  bottom: 0;
  background: #c797eb;
  transition: all 0.3s ease;
}
.btn-8:before{
   height: 0%;
   width: 2px;
}
.btn-8:after {
  width: 0%;
  height: 2px;
}
.btn-8:hover:before {
  height: 100%;
}
.btn-8:hover:after {
  width: 100%;
}
.btn-8:hover{
  background: transparent;
}
.btn-8 span:hover{
  color: #c797eb;
}
.btn-8 span:before,
.btn-8 span:after {
  position: absolute;
  content: "";
  left: 0;
  top: 0;
  background: #c797eb;
  transition: all 0.3s ease;
}
.btn-8 span:before {
  width: 2px;
  height: 0%;
}
.btn-8 span:after {
  height: 2px;
  width: 0%;
}
.btn-8 span:hover:before {
  height: 100%;
}
.btn-8 span:hover:after {
  width: 100%;
}
</style>
</head>
<body>
<section>
	<article>
		<h2>예 약 내 역</h2>
		<hr>
		<br>
		<table>
			<thead height="60">
				<tr>
					<th>업체명</th>
					<th>예약내용</th>
					<th>예약날짜</th>
					<th>승인여부</th>
					<th class="t">취소버튼</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>이젠예식장</td>
					<td>a홀</td>
					<td>2023-03-30</td>
					<td style="color: #00FF40;">예약대기</td>
					<td><button class="custom-btn btn-8"><span>예약취소</span></button></td>
				</tr>
				<tr>
					<td>토토웨딩홀</td>
					<td>vip홀</td>
					<td>2023-03-31</td>
					<td style="color: red;">예약취소</td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<hr>
	</article>
</section>
</body>
</html>