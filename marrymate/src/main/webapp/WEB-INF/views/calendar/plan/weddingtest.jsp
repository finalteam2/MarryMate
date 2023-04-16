<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
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

    <!-- favicon -->
    <link rel="shortcut icon" href="img/korea1.ico">
    <link rel="apple-touch-icon-precomposed" href="img/korea1.ico">

    <title>웨딩능력고사</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" href="/marrymate/css/default.css">
    <link rel="stylesheet" href="/marrymate/css/main.css">
    <link rel="stylesheet" href="/marrymate/css/qna.css">
    <link rel="stylesheet" href="/marrymate/css/animation.css">
    <link rel="stylesheet" href="/marrymate/css/result.css">
    <script src="https://developers.kakao.com/sdk/js/kakao.js">

    </script>
    <script>
        Kakao.init('4d5e7393a42511b525144bf7d8900207');
        Kakao.isInitialized();
    </script>


</head>

<body>
    <div class="container">
        <section id="main" class="mainfont mx-auto my-5 py-4 px-3">
            <div id="titlefont">&nbsp;&nbsp;웨딩능력고사</div>
            <div class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto">
                <img id="mainImg" src="/marrymate/img/weddingtest.png" alt="mainImage" class="img-fluid" width="45%" , height="40%">
            </div>
            <p id="subfont">
                테스트로 알아보는 <br>
                나의 결혼지식 레벨은?
            </p>
            <button type="button" class="startBtn mx-auto" onclick="js:begin()">시작하기</button>
            <p id="tagfont">
                #결혼 #20문제 #5단계
            </p>
        </section>

        <section id="qna" class="qnafont mx-auto my-5 py-4 px-3">
            <div class="statusNum">
            </div>
            <div class="status mx-auto mt-2">
                <div class="statusBar">
                </div>
            </div>
            <table align="center" style="width: 100%">
                <tr>
                    <td>
                        <div class="qBox my-5 my-5 py-3 mb-2 mx-auto">
                        </div>
                    </td>
                </tr>
            </table>

            <div class="answerBox">
            </div>
        </section>

        <section id="result" class="resultfont mx-auto my-5 py-4 px-3">
            <div id="resultImg" class="my-3 col-lg-6 col-md-8 col-sm-10 col-12 mx-auto">
            </div>

            <button type="button" class="shareBtn mt-3 py-2 px-3" onclick="js:again()">다시하기</button>
            <br>

            <button id="answer" type="button" class="shareBtn mt-3 py-2 px-3" onclick="js:openCloseToc()">정답 보기</button>
            <br>
            <div id="toc-content">
                1. 버진로드<br>
                2. 드레스투어<br>
                3. 메이크업<br>
                4. 워크인<br>
                5. 가봉<br>
                6. 보증인원<br>
                7. 포토테이블<br>
                8. 원판<br>
                9. 골든타임<br>
                10. 성혼선언문<br>
                11. 부토니아<br>
                12. 애교예단<br>
                13. 봉채비<br>
                14. 혼구용품<br>
                15. 헬퍼<br>
                16. 플라워샤워<br>
                17. 동시예식<br>
                18. 예물<br>
                19. 단독홀<br>
                20. 식전영상<br>
            </div>
				<br>
   			<!--sns 공유-->
            <img id="shareImg" src="/marrymate/img/kakao-talk.png" onclick="js:setShare()">
            <img id="shareImg" src="/marrymate/img/facebook.png" onclick="js:shareFacebook()" />
            <img id="shareImg" src="/marrymate/img/twitter.png" onclick="js:shareTwitter()" />
            <img id="shareImg" src="/marrymate/img/link.png" onclick="js:copy()" />

            <!--저작권 -->
				<br><br><br><br>
                Copyrightⓒ2023 by MarryMate.
        </section>
    </div>
    <script src="/marrymate/js/datas.js" charset="UTF-8"></script>
    <script src="/marrymate/js/starttest.js" charset="UTF-8"></script>
    <script src="/marrymate/js/sharetest.js" charset="UTF-8"></script>
</body>

</html>