<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>MarryMate</title>
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
	margin-top: 20px;
}

comment-wrapper {
	margin-top: 20px;
	overflow: hidden;
}

.comment {
	overflow: hidden;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	background-color: #f9f9f9;
	margin-top: 20px;
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

.comment-form {
	width: 736px;
	height: 160px;
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px;
	background-color: #f9f9f9;
	margin-top: 20px;
}

.comment-form input[type="text"], .comment-form textarea {
	width: 95%;
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

.button-container {
	padding-top: 30px;
	padding-bottom: 20px;
	text-align: center;
}

.button {
	background-color: #3498db;
	color: #fff;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	border-radius: 5px;
	cursor: pointer;
	margin: 0 10px;
	text-decoration: none;
}

.button-edit {
	background-color: #27ae60;
	color: #fff;
	border: none;
}

.button-delete {
	background-color: #c0392b;
	color: #fff;
	border: none;
}

.button-container-a {
	display: flex;
	margin-top: 20px;
	margin-bottom: 10px;
	justify-content: center;
}

.button-container-a button {
	margin: 0 10px;
}

#reply {
	margin-left: auto;
	margin-right: auto;
	margin-top: 50px;
	text-align: center;
}

#likeBtn {
	border: 1px solid #ccc;
	background-color: transparent;
	cursor: pointer;
	display: inline-flex;
	align-items: center;
	font-size: 14px;
	color: #666;
	width: 100px;
	height: 30px;
}

#likeBtn:hover {
	color: #000;
}

#likeBtn img {
	margin-right: 5px;
	height: 16px;
	width: 16px;
}

#dislikeBtn {
	border: 1px solid #ccc;
	background-color: transparent;
	cursor: pointer;
	display: inline-flex;
	align-items: center;
	font-size: 14px;
	color: #666;
	width: 100px;
	height: 30px;
}

#dislikeBtn:hover {
	color: #000;
}

#dislikeBtn img {
	margin-right: 5px;
	height: 16px;
	width: 16px;
}

#likeDis {
	text-align: center;
	margin-top: 30px;
}

#imgBox {
	width: 300px;
	height: 300px;
	overflow: hidden;
	margin-top: 30px;
	margin-bottom: 30px;
	margin-left: auto;
	margin-right: auto;
}

#imgBox img {
	width: 100%;
	height: auto;
}

.image {
	border-radius: 15px;
	float: left;
	margin-right: 10px;
	width: 100px;
	height: 100px;
	overflow: hidden;
}

.image img {
	width: 100%;
	height: auto;
}

.subImg {
	border: 1px solid black;
	border-radius: 15px;
	float: right;
	margin-right: 10px;
	width: 100px;
	height: 100px;
	overflow: hidden;
}

.subImg img {
	width: 100%;
	height: auto;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function checkReply() {
	    if(confirm('댓글을 작성하시겠습니까?')) {
	        if ('${sessionScope.loginMidx}' === '') {
	            alert('로그인 후 이용가능합니다.');
	            return false;
	        }
	        return true;
	    }
	    else {
	        return false;
	    }
	}
    function checkReWrite() {
        if ('${dto.midx}' !== '${sessionScope.loginMidx}') {
            alert('작성자만 수정이 가능합니다.');
            return false;
        }
        return true;
    }
    function checkDelete() {
        if ('${dto.midx}' !== '${sessionScope.loginMidx}') {
            alert('작성자만 삭제 가능합니다.');
            return false;
        }
        confirm('게시글을 삭제하시겠습니까?');
        return true;
    }
    $(function() {
        $('#likeBtn, #dislikeBtn').on('click', function() {
          var bidx = '${dto.bidx}';
          var midx = '${sessionScope.loginMidx}';
          var url = '';
          var msg = '';

          if ($(this).attr('id') === 'likeBtn') {
            url = 'best.do';
            msg = '추천';
          } else {
            url = 'worst.do';
            msg = '비추천';
          }

          $.ajax({
            url: url,
            type: 'POST',
            data: { midx: midx, bidx: bidx },
            success: function(result) {
              if (result == 'false') {
                alert('이미 추천 혹은 비추천을 하였습니다.');
              } else {
                alert(msg + '하였습니다.');
                location.reload();
              }
            },
            error: function() {
              alert('서버와의 통신에 실패하였습니다.');
            }
          });
        });
      });
</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
	<div class="board">
		<div class="post">
			<div class="title">
				<c:if test="${!empty dto.horse && '없음' ne dto.horse}">
					[${dto.horse}]
				</c:if>${dto.subject}
				<c:if test="${!dto.kind eq '공지사항'}">
					<div class="subImg">
						<img alt="게시물 이미지" src="/marrymate/img/member/${dto.memimg}">
					</div>
				</c:if>
			</div>
			<c:choose>
				<c:when test="${dto.kind eq '공지사항'}">
					<div class="author">작성자: 관리자</div>
				</c:when>
				<c:otherwise>
					<div class="author">작성자: ${dto.nick}</div>
				</c:otherwise>
			</c:choose>
			<div class="date">작성일: ${dto.writedate}</div>
			<div class="content">${dto.content}</div>
			<c:choose>
				<c:when test="${dto.img eq '없음'}">

				</c:when>
				<c:otherwise>
					<c:if test="${!dto.kind eq '공지사항'}">
						<div id="imgBox">
							<img alt="게시물 이미지" src="/marrymate/img/bbs_img/${dto.img}">
						</div>
					</c:if>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${dto.kind eq '공지사항'}">

				</c:when>
				<c:otherwise>
					<div id="likeDis">
						<button id="likeBtn">
							<img src="/marrymate/img/thumb-up.png" alt="추천">추천 :
							${dto.best}
						</button>
						<button id="dislikeBtn">
							<img src="/marrymate/img/thumb-down.png" alt="비추천">비추천 :
							${dto.worst}
						</button>
					</div>
					<div class="button-container">
						<a href="#" class="button" onclick="window.history.back()">목록</a>
						<c:url var="reWriteUrl" value="reWrite.do">
							<c:param name="bidx">${dto.bidx}</c:param>
						</c:url>
						<a href="${reWriteUrl}" class="button button-edit"
							onclick="return checkReWrite()">수정</a>
						<c:url var="deleteUrl" value="delete.do">
							<c:param name="bidx">${dto.bidx}</c:param>
						</c:url>
						<a href="${deleteUrl}" class="button button-delete"
							onclick="return checkDelete()">삭제</a>
					</div>
					
					<c:forEach var="reply" items="${list}">
						<div class="comment-wrapper">
							<div class="comment">
								<div class="image">
									<img alt="멤버 이미지" src="/marrymate/img/member/${reply.img}">
								</div>
							    <div class="content">
							        <div class="author">작성자: ${reply.nick}</div>
							        <div class="date">작성일: ${reply.writedate}</div>
							        <div class="text">${reply.content}</div>
							    </div>
							</div>				
						</div>
					</c:forEach>
					<div class="comment-form">
						<form name="reply" action="reply.do" method="post" onsubmit="replyCall();">
								<input type="hidden" name="bidx" value="${param.bidx}">
								<input type="hidden" name="midx" value="${sessionScope.loginMidx}">
								<input type="hidden" name="id" value="${sessionScope.loginId}">
								<input type="hidden" id="author" name="nick" value="${sessionScope.loginNick}" readonly><br>
								<label for="comment">댓글 내용</label><br>
								<textarea id="comment" name="content"></textarea>
								<input type="submit" value="댓글 작성" onclick="return checkReply()">
							</form>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>
</body>
</html>

