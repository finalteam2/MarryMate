<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="MarryMate">
    <meta name="keywords" content="웨딩능력고사">
    <meta name="description" content="웨딩능력고사">

    <!-- sns share -->
    <meta property="og:url" content="http://localhost:9090/marrymate/weddingtest.do">
    <meta property="og:title" content="웨딩능력고사">
    <meta property="og:type" content="website">
    <meta property="og:description" content="테스트로 알아보는 나의 결혼지식 레벨은?">
    <meta property="og:image" content="img/weddingtest.png">

    <title>웨딩능력고사</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="../css/default.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/qna.css">
    <link rel="stylesheet" href="../css/animation.css">
    <link rel="stylesheet" href="../css/result.css">
    <script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.googletagmanager.com/gtag/js?id=UA-204374934-1&amp;l=dataLayer&amp;cx=c"></script><script src="https://developers.kakao.com/sdk/js/kakao.js">
    </script>
    <script>
        Kakao.init('4d5e7393a42511b525144bf7d8900207');
        Kakao.isInitialized();
    </script>

</head>

<body data-new-gr-c-s-check-loaded="14.1105.0" data-gr-ext-installed="">
    <section id="shareResult" class="resultfont mx-auto mt-5 mb-5 py-5 px-3">
        <div id="resultImg" class="my-3 col-lg-6 col-md-8 col-sm-10 col-12 mx-auto">
            <img src="/marrymate/img/result5.png" alt="0" class="img-fluid">
        </div>

        <button type="button" class="shareBtn mt-3 py-2 px-3" onclick="js:again()">나도 해보기</button>
        <button type="button" class="shareBtn mt-3 py-2 px-3" onclick="js:copy()">링크 복사하기</button>
    </section>
    <script src="/marrymate/js/datas.js" charset="UTF-8"></script>
    <script src="/marrymate/js/starttest.js" charset="UTF-8"></script>
    <script src="/marrymate/js/sharetest.js" charset="UTF-8"></script>
</body>
</html>