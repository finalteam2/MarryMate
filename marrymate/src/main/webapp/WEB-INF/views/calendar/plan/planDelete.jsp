<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>MBTI Test Result</h1>
    <h2>Your MBTI Type:</h2>
    <%
        String q1 = request.getParameter("q1");
        // Retrieve answers for questions 2 to 10
        // and calculate MBTI type based on the answers
        // (e.g., ISTJ, ENFP, etc.)
        String mbtiType = ""; // Calculate MBTI type based on answers
    %>
    <p>Your MBTI type is: <%= mbtiType %></p>
</body>
</html>