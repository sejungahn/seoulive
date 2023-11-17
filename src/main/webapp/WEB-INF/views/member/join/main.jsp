<%-- Created by IntelliJ IDEA. User: uneong Date: 2023/05/18 Time: 5:57 PM To change this template use File | Settings |
  File Templates. --%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>로그인</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/member/login/login.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

  <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
  <script src="https://kit.fontawesome.com/507ab4987a.js" crossorigin="anonymous"></script>

  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
  <link rel="icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
</head>

<jsp:include page="../../layout/header.jsp" />

<body>

  <div class="container">

    <div class="logo_wrap">
      <img src="${pageContext.request.contextPath}/resources/static/img/logo_ico.png">
      <p>서울 지금, SEOULIVE</p>
    </div>

    <div class="b_wrap">
      <div class="btn_wrap btn_kakao" onclick="kakaoLogin();">
        <i class="fab fa-kickstarter"></i> 카카오톡 회원가입
      </div>

      <div class="btn_wrap btn_email">
        <i class="fas fa-envelope"></i> 이메일 회원가입
      </div>

      <div>
        이미 계정이 있으신가요?
        <span class="a_wrap">로그인</span>
      </div>
    </div>

  </div>

  <script>
    $(function() {
      // 이메일 회원가입
      $('.btn_email').click(function() {
        location.href = "/member/join/email";
      });
      // 로그인
      $('.a_wrap').click(function() {
        location.href = "/member/login/main";
      });
    });

    // 카카오 로그인
    Kakao.init('78b5d0de698d4b39fd921b3542cbb137'); //발급받은 키 중 javascript키를 사용해준다.
    console.log(Kakao.isInitialized()); // sdk초기화여부판단
    function kakaoLogin() {
      Kakao.Auth.login({
        success: function (response) {
          Kakao.API.request({
            url: '/v2/user/me',
            success: function (response) {
              console.log(response)
            },
            fail: function (error) {
              console.log(error)
            },
          })
        },
        fail: function (error) {
          console.log(error)
        },
      })
    }
  </script>

</body>

<jsp:include page="../../layout/footer.jsp" />

</html>