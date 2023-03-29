<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>통 합 예 약</title>
<style>
@font-face {
    font-family: 'SUIT-Regular';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_suit@1.0/SUIT-Regular.woff2') format('woff2');
    font-weight: normal;
    font-style: normal;
}
body{
	margin:0px;
	padding:0px;
	font-family: 'SUIT-Regular';
	background:#fbf4ff;
}
video{
	width:100%;
}
.bg_box{
	position:relative;
	width:100%;
	height:340px;
	overflow:hidden;
	margin:0px auto;
	outline:none;
	border:none;
}
.bg_text{
	position:absolute;
	top:10%;
	left:50%;
	transform:translate(-50%,-10%);
	color:#fff;
}
.title{
	text-align:center;
	font-size:43px;
	margin-bottom:0px;
	font-weight:bold;
}
.sub_title{
	text-align:center;
	font-size:22px;
	margin-top:20px;
}
.top_box{
	border:2px solid #e1e1e1;
	position:absolute;
	top:38%;
	left:50%;
	transform:translate(-50%,-38%);
	width:65%;
	height:35%;
	background:#fff;
	border-radius:5px;
}
.search_box{
	margin:20px auto;
	width:60%;
	text-align:center;
}
.search_input{
	width:98%;
	height:37px;
	font-size:17px;
	padding-left:17px;
	font-family: 'SUIT-Regular';
	background-image:url(/marrymate/img/search_small.png);
	background-repeat:no-repeat;
	background-position:96.5% center;
	background-size:25px;
	border:1px solid #515151;
	border-radius:20px;
}
.search_input:focus{
	outline:none;
}
.calendar_box{
	border:1px solid #515151;
	position:absolute;
	left:20.7%;
	width:30.3%;
	height:60.8%;
	border-radius:3px;
}
.filter_box{
	border:1px solid #515151;
	position:absolute;
	left:53.4%;
	width:26.7%;
	height:60.8%;
	border-radius:3px;
}
.left_box{
	border:2px solid #e1e1e1;
	border-radius:5px;
	position:absolute;
	top:68%;
	left:17.45%;
	width:42.8%;
	background:#fff;
}
.right_box{
	border:2px solid #e1e1e1;
	border-radius:5px;
	position:absolute;
	top:68%;
	left:61.8%;
	width:20.65%;
	background:#fff;
}
.order_box{
	position:absolute;
	top:63.3%;
	left:17.45%;
	width:23%;
	height:5.2%;
}
.order_button{
	border:2px solid #e1e1e1;
	border-radius:5px;
	background:#fff;
	cursor:pointer;
	width:24.2%;
	height:100%;
	font-size:14px;
	font-family: 'SUIT-Regular';
}
.cate_title{
	color:#4e4e4e;
	width:50%;
	margin-left:30px;
	font-size:27px;
}
.category{
	color:#4e4e4e;
	text-align:center;
	margin:24px auto;
}
.list_table{
	width:86%;
	margin:20px auto;
	border:1px solid black;
	border-spacing:0px;
	padding:8px;
}
.cate_menu{
	border:1px solid #e8e6e6;
	background:#f0eeee;
	width:90%;
	font-weight:normal;
	font-size:18px;
	margin:6px auto;
	padding:8px;
	border-radius:2px;
	color:#4e4e4e;
}
.allClear_box{
	width:93%;
	margin:20px auto;
	text-align:right;
}
.allClear_button{
	padding:7px;
	cursor:pointer;
	background:#756983;
	color:#fff;
	border-radius:4px;
	border:none;
	font-size:14px;
	font-family: 'SUIT-Regular';
}
.sumPay_text1{
	text-align:right;
	width:93%;
	margin-top:50px;
	margin-bottom:0px;
	margin-left:auto;
	margin-right:auto;
	font-size:26px;
}
.sumPay_text2{
	text-align:right;
	width:93%;
	margin-top:10px;
	margin-left:auto;
	margin-right:auto;
	font-size:26px;
}
.book_box{
	text-align:center;
	width:93%;
	margin-left:auto;
	margin-right:auto;
	margin-bottom:26px;
}
.book_button{
	width:100%;
	border-radius:8px;
	background:#a664ff;
	border:none;
	color:#fff;
	font-size:25px;
	font-weight:bold;
	font-family: 'SUIT-Regular';
	cursor:pointer;
	padding-top:14px;
	padding-bottom:14px;
}
.book_button:hover{
	background:#a35eff;
}
</style>
</head>
<body>
<section>
	<article>
		<div class="bg_box">
			<video muted autoplay loop>
				<source src="/marrymate/video/bg_book.mp4" type="video/mp4">
			</video>
			<div class="bg_text">
				<p class="title">통 합 예 약</p>
				<p class="sub_title">홀을 제외한 모든 예약을 한번에 하세요!</p>
			</div>
		</div>
	</article>
	<article>
		<div class="top_box">
			<div class="search_box">
				<input class="search_input" type="text" name="search_text" placeholder="지역, 업체명을 입력해주세요.">
			</div>
			<div class="calendar_box">
				캘린더 들어갈 영역
			</div>
			<div class="filter_box">
				필터 들어갈 영역
			</div>
		</div>
	</article>
	<article>
		<div class="order_box">
			<input class="order_button" type="button" value="이름순">
			<input class="order_button" type="button" value="조회수순">
			<input class="order_button" type="button" value="낮은가격순">
			<input class="order_button" type="button" value="높은가격순">
		</div>
		<div class="left_box">
			<div>
				<h2 class="cate_title">스튜디오</h2>
				<hr style="width:93%;border:1px solid #6c6c6c;">
				<table class="list_table">
					<tr>
						<td rowspan="3" width="28%" align="center">
						이미지
						</td>
						<td width="36%">이름</td>
						<td width="36%" align="right">날짜선택</td>
					</tr>
					<tr>
						<td>지역<br><br><br></td>
						<td align="right">시간선택<br><br><br></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right">버튼</td>
					</tr>
				</table>
				<table class="list_table">
					<tr>
						<td rowspan="3" width="28%" align="center">
						이미지
						</td>
						<td width="36%">이름</td>
						<td width="36%" align="right">날짜선택</td>
					</tr>
					<tr>
						<td>지역<br><br><br></td>
						<td align="right">시간선택<br><br><br></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right">버튼</td>
					</tr>
				</table>
				<table class="list_table">
					<tr>
						<td rowspan="3" width="28%" align="center">
						이미지
						</td>
						<td width="36%">이름</td>
						<td width="36%" align="right">날짜선택</td>
					</tr>
					<tr>
						<td>지역<br><br><br></td>
						<td align="right">시간선택<br><br><br></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right">버튼</td>
					</tr>
				</table>
				<table class="list_table">
					<tr>
						<td rowspan="3" width="28%" align="center">
						이미지
						</td>
						<td width="36%">이름</td>
						<td width="36%" align="right">날짜선택</td>
					</tr>
					<tr>
						<td>지역<br><br><br></td>
						<td align="right">시간선택<br><br><br></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right">버튼</td>
					</tr>
				</table>
				<table class="list_table">
					<tr>
						<td rowspan="3" width="28%" align="center">
						이미지
						</td>
						<td width="36%">이름</td>
						<td width="36%" align="right">날짜선택</td>
					</tr>
					<tr>
						<td>지역<br><br><br></td>
						<td align="right">시간선택<br><br><br></td>
					</tr>
					<tr>
						<td>가격</td>
						<td align="right">버튼</td>
					</tr>
				</table>
				<hr style="width:93%;border:1px solid #6c6c6c;">
			</div>
		</div>
	</article>
	<article>
		<div class="right_box">
			<div>
				<h2 class="category">카 테 고 리</h2>
			</div>
			<h3 class="cate_menu">
			<label>스튜디오</label>
			</h3>
			<h3 class="cate_menu">
			<label>드레스</label>
			</h3>
			<h3 class="cate_menu">
			<label>헤어/메이크업</label>
			</h3>
			<h3 class="cate_menu">
			<label>사진</label>
			</h3>
			<h3 class="cate_menu">
			<label>DVD</label>
			</h3>
			<h3 class="cate_menu">
			<label>주례</label>
			</h3>
			<h3 class="cate_menu">
			<label>사회</label>
			</h3>
			<h3 class="cate_menu">
			<label>축가</label>
			</h3>
			<div class="allClear_box">
				<input class="allClear_button" type="button" value="전체삭제">
			</div>
			<h3 class="sumPay_text1">총 금액</h3>
			<h3 class="sumPay_text2">150,000 원</h3>
			<div class="book_box">
				<input class="book_button" type="submit" value="예 약 하 기">
			</div>
		</div>
	</article>
</section>
</body>
</html>