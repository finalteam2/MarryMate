<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <title>D-Day</title>
    
    <script>
    var dday = new Date("${sessionScope.loginMD}").getTime();

    setInterval(function() {
      var today = new Date().getTime();
      var gap = dday - today;
      var day = Math.ceil(gap / (1000 * 60 * 60 * 24));
      var hour = Math.ceil((gap % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var min = Math.ceil((gap % (1000 * 60 * 60)) / (1000 * 60));
      var sec = Math.ceil((gap % (1000 * 60)) / 1000);

      document.getElementById("count").innerHTML = "D-DAY까지 " + day + "일 " + hour + "시간 " + min + "분 " + sec + "초 남았습니다.";
    }, 1000);
    </script>
  </head>
  <body>
    <h1>D-Day</h1>
   <div class="weddingDay">
  <span class="date">
    <c:if test="${!empty sessionScope.loginId}">
      <div>${sessionScope.loginMD}</div>
    </c:if>
  </span> 
  <span class="d-day" id="dDay"></span><br> 
  <div id="count">
  
  </div>
</div>
    <p>${sessionScope.loginMD} D-(${daysDiff}) </p>
  </body>
</html>
