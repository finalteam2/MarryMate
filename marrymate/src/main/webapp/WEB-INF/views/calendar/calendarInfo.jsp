<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta name="charset" content="UTF-8">
<title>웨딩캘린더</title>

  </head>
  <body onload="checkList();">
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    <h1>calendar info page</h1>
    <input type="hidden" name="midx" value="${sessionScope.loginMidx}">
    	<c:if test="${empty checkList}">
					<tr>
						<td colspan="5" align="center">설정해둔 체크리스트가 없습니다.</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${checkList}">
					<tr>
						<td class="text-center">${dto.midx}</td>
						<td class="text-center">${dto.dday}</td>
						<td class="text-center">${dto.chschedule}</td>
					</tr>
				</c:forEach>
				
	<div class="checklistbox">
		<ul>
			<li><input type="checkbox" name="chitem1" value="Item 1"></li>
			<li><input type="checkbox" name="chitem2" value="Item 2">Item 2</li>
			<li><input type="checkbox" name="chitem3" value="Item 3">Item 3</li>
			<li><input type="checkbox" name="chitem4" value="Item 4">Item 4</li>
			<li><input type="checkbox" name="chitem5" value="Item 5">Item 5</li>
			<li><input type="checkbox" name="chitem6" value="Item 6">Item 6</li>
			<li><input type="checkbox" name="chitem7" value="Item 7">Item 7</li>
			<li><input type="checkbox" name="chitem8" value="Item 8">Item 8</li>
			<li><input type="checkbox" name="chitem9" value="Item 9">Item 9</li>
			<li><input type="checkbox" name="chitem10" value="Item 10">Item 10</li>
			<li><input type="checkbox" name="chitem11" value="Item 11">Item 11</li>
			<li><input type="checkbox" name="chitem12" value="Item 12">Item 12</li>
			<li><input type="checkbox" name="chitem13" value="Item 13">Item 13</li>
			<li><input type="checkbox" name="chitem14" value="Item 14">Item 14</li>
			<li><input type="checkbox" name="chitem15" value="Item 15">Item 15</li>
			<li><input type="checkbox" name="chitem16" value="Item 16">Item 16</li>
		</ul>
	</div>
<jsp:include page="/WEB-INF/views/chatbot.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
  </body>
</html>
