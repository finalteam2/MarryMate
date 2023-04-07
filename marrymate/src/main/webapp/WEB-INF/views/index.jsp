<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MarryMate</title>

<link href="/marrymate/css/style.css" rel="stylesheet">
<link rel="stylesheet" href="/marrymate/css/sakura.css">
<link rel="stylesheet" href="/marrymate/css/chatbot.css">
<link rel="stylesheet" href="/marrymate/css/chat.css">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="js/sakura.js"></script>
</head>

<body>
<script>
$(window).load(function () {
    $('body').sakura();
});


function handleVideoEnd() {
    var video = document.getElementById('video');
    var header = document.getElementById('header');
    var opacity = 1;
    
    var fadeOut = setInterval(function() {
        if (opacity > 0) {
            opacity -= 0.1;
            video.style.opacity = opacity;
        } else {
            clearInterval(fadeOut);
            video.style.display = "none";
            header.style.display = "block";
        }
    }, 40);
}
</script>
    <video id="video" muted autoplay onended="handleVideoEnd()">
		<source src="/marrymate/video/mainvi.mp4" type="video/mp4">
	</video>



<%@include file="header.jsp" %>


<h1>main입니다.</h1>
<h2>아래는 추후 수정 예정입니다!</h2>
<section id="mainevent">
	<div><a href=""><img src="/marrymate/img/ex1.png"></a></div>
	<div><a href=""><img src="/marrymate/img/ex2.png"></a></div>
	<div><a href=""><img src="/marrymate/img/ex3.png"></a></div>
</section>

<%@include file="chatbot.jsp" %>
<%@include file="footer.jsp" %>
</body>
</html>