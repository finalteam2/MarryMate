<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarryMate</title>
<link rel="stylesheet" type="text/css" href="css/companyJoin.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="js/jusoSelector.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/comJoinCheck.js"></script>
<script>
	function openAddressSearch() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById('juso').value = data.address;
				document.getElementById('sjuso').focus();
			}
		}).open();
	}
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<section>
		<article>
			<h2>회원가입</h2>
			<form name="companyJoin" action="companyJoin.do" method="post" enctype="multipart/form-data" onsubmit="return allCheckForm()">
			<div class="box">
				<div id="iBox">
					<div class="button-container">
						<a href="memberJoin.do" class="buttonOne">일반 회원가입</a>
						<a href="companyJoin.do" class="buttonTwo">기업 회원가입</a>
					</div>
					<div class="hClear">아이디</div> 
						<input type="text" id="id" name="id" placeholder="중복확인 진행">&nbsp;&nbsp;
						<input type="button" value="중복확인" id="idcb" class="cc"><br>
						<div id="idCheck" class="sc"></div>
						
						
					<div class="hTagBox">비밀번호</div>
						<input type="password" id="pwd" name="pwd" placeholder="8자 이상(대소문자 및 특수문자 포함)" onchange="checkPwd()"><br>
						<div id="pwdMsg" class="sc"></div>
					<div class="hClear">비밀번호 확인</div>
						<input type="password" id="reCheckPwd" placeholder="설정한 비밀번호 재입력" onchange="checkPwd()">
						<div id="rePwdMsg" class="sc"></div>
						
						
					<div class="hTagBox">전화번호</div>
						<input type="text" name="tel" placeholder="('-'없이 입력)"><br>
					<div class="hClear">이메일</div>
						<input type="text" name="email" placeholder="아이디@주소.com 형식으로 작성"><br>
					<div class="hTagBox">주소</div>
						<input type="text" id="juso" name="juso" placeholder="주소검색을 통해 입력" readonly>&nbsp;&nbsp;
						<input type="button" value="주소 검색" class="cc" onclick="openAddressSearch()"><br>
					<div class="hClear">상세주소</div>
						<input type="text" id="sjuso" name="sjuso" placeholder="상세주소 입력">
						
						
				</div>
				<div id="aBox">
					<h3>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;기업 정보</h3>
					<div id="tagBox">
						<div class="buBox">업종 카테고리 선택</div>
						<div class="buBox"><input type="radio" name="kind" value="예식장">예식장</div>
						<div class="buBox"><input type="radio" name="kind" value="스튜디오">스튜디오</div>
						<div class="buBox"><input type="radio" name="kind" value="드레스">드레스</div>
						<div class="buBox"><input type="radio" name="kind" value="헤어메이크업">헤어메이크업</div>
						<div class="buBox"><input type="radio" name="kind" value="스냅DVD">스냅DVD</div>
						<div class="buBox"><input type="radio" name="kind" value="주례">주례</div>
						<div class="buBox"><input type="radio" name="kind" value="사회">사회</div>
						<div class="buBox"><input type="radio" name="kind" value="축가">축가</div>
					</div>
					<div id="head">
					<div class="hTagBox">사업자등록번호</div>
					<input type="text" name="cnum" placeholder="xxx-xx-xxxxx('-'없이 입력)">&nbsp;<input type="file" name="cnumfile"><br>
					</div>
					<div class="hClear">기업명</div>
					<input type="text" name="cname" placeholder="기업명 입력"><br>
					<div class="hTagBox">지역</div>
					<select name="sido" onchange="jusoKindChange(this)">
						<option>도/특별시/광역시</option>
						<option value="서울">서울</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
						<option value="인천">인천</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="충북">충북</option>
						<option value="충남">충남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="제주">제주</option>
					</select>
					<select id="jusoKindS" name="sigungu">
						<option>시/군/구</option>
					</select>
					<div class="hClear">기업소개</div>
						<textarea name="intro" class="ta" rows="11" cols="50" placeholder="기업 소개 입력"></textarea>
					<div class="hTagBox">기업 웹사이트</div>
						<input type="text" name="curl" placeholder="기업 웹사이트 입력(선택)"><br>
					<div class="hClear">대표 이미지</div>
						<input type="file" name="bestimg"><br>
					<div class="hTagBox">상품 가격</div>
						<input type="text" name="pay" placeholder="상품 가격 입력(','없이 입력)"><br>
				</div>
				<div id="jBox">
					<input type="submit" class="w-btn-outline w-btn-red-outline" value="정보입력">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" class="w-btn-outline w-btn-red-outline" value="다시입력">
				</div>
			</div>
			</form>
		</article>
	</section>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>