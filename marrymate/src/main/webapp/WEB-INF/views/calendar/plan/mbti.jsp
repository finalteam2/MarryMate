<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta name="charset" content="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- favicon -->
    <link rel="shortcut icon" href="img/korea1.ico">
    <link rel="apple-touch-icon-precomposed" href="img/korea1.ico">

    <title>한국어능력고사</title>
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
        Kakao.init('4b78306c2806c638eb2beb5301da89ef');
        Kakao.isInitialized();
    </script>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-7DMXD1KV1W">
    </script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag() { dataLayer.push(arguments); }
        gtag('js', new Date());
        gtag('config', 'G-7DMXD1KV1W');
    </script>

</head>

<body>
    <div class="container">
        <section id="main" class="mainfont mx-auto my-5 py-4 px-3">
            <div id="titlefont">웨딩능력고사</div>
            <div class="col-lg-6 col-md-8 col-sm-10 col-12 mx-auto">
                <img id="mainImg" src="./img/lv5.png" alt="mainImage" class="img-fluid" width="45%" , height="40%">
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
                1. 계좌번호<br>
                2. 굳이<br>
                3. 어이<br>
                4. 무난하게<br>
                5. 어떻게<br>
                6. 며칠<br>
                7. 수익률<br>
                8. 바람<br>
                9. 웬일<br>
                10. 먹은 지<br>
                11. 빨간색<br>
                12. 인마<br>
                13. 여러 가지<br>
                14. 해님<br>
                15. 곰곰이<br>
                16. 꾸준히<br>
                17. 뚜렷이<br>
                18. 말끔히<br>
                19. 파투<br>
                20. 박여<br>
            </div>

 
        </section>
    </div>
    <script src="/marrymate/js/data.js" charset="UTF-8"></script>
    <script src="/marrymate/js/start.js" charset="UTF-8"></script>
    <script src="/marrymate/js/share.js" charset="UTF-8"></script>
</body>

</html>