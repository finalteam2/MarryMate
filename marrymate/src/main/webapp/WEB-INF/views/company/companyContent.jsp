<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/marrymate/css/style.css" rel="stylesheet">
</head>
<body>
<%@include file="../header.jsp" %>

CompanyDTO
dto

${dto.cidx }cidx;
${dto.joindate }joindate;
${dto.kind }kind;
${dto.cname }cname;
${dto.intro }intro;
${dto.id }id;
${dto.pwd }pwd;
${dto.tel }tel;
${dto.email }email;
${dto.juso }juso;
${dto.sjuso }sjuso;
${dto.curl }curl;
${dto.sido }sido;
${dto.sigungu }sigungu;
${dto.pay }pay;
${dto.guest_num }guest_num;
${dto.cnum }cnum;
${dto.cfile }cfile;
${dto.clevel }clevel;
${dto.blind }blind;
${dto.watch }watch;
${dto.topfix }topfix;
${dto.img }img;

HallDTO
harr

<c:forEach var="dto" items="${harr }">
${dto.hidx }hidx;
${dto.cidx }cidx;
${dto.name }name;
${dto.worktime }worktime;
</c:forEach>

FoodDTO
farr

<c:forEach var="dto" items="${farr }">
${dto.fidx }fidx;
${dto.cidx }cidx;
${dto.type }type;
${dto.name }name;
${dto.pay }pay;
</c:forEach>

Com_ImgDTO
iarr

<c:forEach var="dto" items="${iarr }">
${dto.iidx }iidx;
${dto.cidx }cidx;
${dto.type }type;
${dto.img }img;
</c:forEach>


<%@include file="../chatbot.jsp" %>
<%@include file="../footer.jsp" %>
</body>
</html>