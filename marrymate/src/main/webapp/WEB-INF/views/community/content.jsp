<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>게시판 본문</title>
    <style>
    	body {
			background-color: #fbf4ff;
		}
        .board {
            width: 800px;
            margin: 0 auto;
        }
        .post {
            margin: 20px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            background-color: #f9f9f9;
        }
        .post .title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
        }
        .post .author {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }
        .post .date {
            font-size: 12px;
            color: #999;
            margin-bottom: 10px;
        }
        .post .content {
            font-size: 16px;
            line-height: 1.5;
            margin-top: 10px;
        }
        comment-wrapper {
            margin-top: 20px;
        }
        .comment {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            background-color: #f9f9f9;
            margin-bottom: 10px;
        }
        .comment .author {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }
        .comment .date {
            font-size: 12px;
            color: #999;
            margin-bottom: 10px;
        }
        .comment .content {
            font-size: 16px;
            line-height: 1.5;
            margin-top: 10px;
        }
        /* 댓글 작성 양식 스타일 */
        .comment-form {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            background-color: #f9f9f9;
            margin-top: 20px;
        }
        .comment-form input[type="text"],
        .comment-form textarea {
            width: 90%;
            padding: 10px;
            font-size: 16px;
            margin-bottom: 10px;
        }
        .comment-form input[type="submit"] {
            background-color: #3498db;
            color: #fff;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
        }
        #reply {
        	margin-left: auto;
        	margin-right: auto;
        	margin-top: 50px;
        	text-align: center;
        }
    </style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    <div class="board">
        <div class="post">
            <div class="title">${dto.subject}</div>
            <div class="author">작성자: ${dto.nick}</div>
            <div class="date">작성일: ${dto.writedate}</div>
            <div class="content">
                ${dto.content}
            </div>
            <div class="comment-wrapper">
            	<c:forEach var="reply" items="${list}">
			        <div class="comment">
			            <div class="author">작성자: ${reply.nick}</div>
			            <div class="date">작성일: ${reply.writedate}</div>
			            <div class="content">
			                ${reply.content}
			            </div>
			        </div>
		        </c:forEach>
		        <!-- 댓글을 추가할 때마다 위와 같은 .comment 클래스를 가진 div 요소를 생성합니다. -->
		        <div class="comment-form">
		            <form name="reply" action="reply.do" method="post">
		            	<input type="hidden" name="bidx" value="${param.bidx}">
		            	<input type="hidden" name="midx" value="${sessionScope.loginMidx}">
					    <input type="hidden" name="id" value="${sessionScope.loginId}">
		                <label for="author">작성자</label><br>
		                <input type="text" id="author" name="nick" value="${sessionScope.loginNick}" readonly><br>
		                <label for="comment">댓글 내용</label><br>
		                <textarea id="comment" name="content"></textarea>
		                <input type="submit" value="댓글 작성">
		            </form>
		        </div>
		    </div>
        </div>
    </div>
    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>

