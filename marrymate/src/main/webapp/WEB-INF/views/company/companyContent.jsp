<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b6b897e9b2101fc41066a267ee940a5&libraries=services,clusterer,drawing"></script>
<link href="/marrymate/css/style.css" rel="stylesheet">
<script src="js/companyContent.js"></script>
</head>
<body onload="mapLoad()">
<%@include file="../header.jsp" %>
<div id="map" style="width:500px;height:350px;"></div>
<input type="hidden" id="cname" value="${dto.cname }">

CompanyDTO
dto

${dto.cidx } : cidx<br>
${dto.joindate } : joindate<br>
${dto.kind } : kind<br>
${dto.cname } : cname<br>
${dto.intro } : intro<br>
${dto.id } : id<br>
${dto.pwd } : pwd<br>
${dto.tel } : tel<br>
${dto.email } : email<br>
${dto.juso } : juso<br>
${dto.sjuso } : sjuso<br>
${dto.curl } : curl<br>
${dto.sido } : sido<br>
${dto.sigungu } : sigungu<br>
${dto.pay } : pay<br>
${dto.guest_num } : guest_num<br>
${dto.cnum } : cnum<br>
${dto.cfile } : cfile<br>
${dto.clevel } : clevel<br>
${dto.blind } : blind<br>
${dto.watch } : watch<br>
${dto.topfix } : topfix<br>
${dto.img } : img<br>

Com_ImgDTO
iarr

<c:forEach var="idto" items="${iarr }">
${idto.iidx } : iidx<br>
${idto.cidx } : cidx<br>
${idto.type } : type<br>
${idto.img } : img<br>
</c:forEach>


HallDTO
harr

<c:forEach var="hdto" items="${harr }">
${hdto.hidx } : hidx<br>
${hdto.cidx } : cidx<br>
${hdto.name } : name<br>
${hdto.worktime } : worktime<br>
</c:forEach>

FoodDTO
farr

<c:forEach var="fdto" items="${farr }">
${fdto.fidx } : fidx<br>
${fdto.cidx } : cidx<br>
${fdto.type } : type<br>
${fdto.name } : name<br>
${fdto.pay } : pay<br>
</c:forEach>


<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>