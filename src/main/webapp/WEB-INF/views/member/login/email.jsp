<%--
  Created by IntelliJ IDEA.
  User: uneong
  Date: 2023/05/18
  Time: 6:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>이메일 로그인</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/member/login/login_email.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">

  <script defer src="${pageContext.request.contextPath}/resources/static/js/member/login/login.js"></script>

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

  <script src="https://kit.fontawesome.com/507ab4987a.js" crossorigin="anonymous"></script>

  <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
  <link rel="icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
</head>

<jsp:include page="../../layout/header.jsp" />

<body>

<div class="container">
  <h2>이메일 로그인</h2>
  <form action="/member/loginPost" method="post">
    <div class="form_wrap">
      <input type="text" id="email" name="email" placeholder="이메일" required>
    </div>
    <div class="form_wrap">
      <input type="password" id="password" name="password" placeholder="비밀번호" required>
    </div>

    <div>
      <input type="checkbox" name="rememberMe" id="rememberMe">
      <label for="rememberMe">로그인 상태 유지</label>
    </div>
    <div class="form_wrap">
      <input type="submit" value="로그인" id="mypage">
      
      
    </div>
  </form>
	
  <div class="a_wrap">
    <div class="find_wrap">
                <span class="forgot">
                    <a href="/member/find_email">아이디 찾기</a>
                </span>
      <span class="forgot">
                    <a href="/member/find_password">비밀번호 찾기</a>
                </span>
    </div>

    <div class="join">
      <a href="/member/join/email">회원가입</a>
    </div>
  </div>

</div>

<script>
  // To display sign-in result.
  var result = "${param.__RESULT__}";

  if(result != null && result.length > 0) {
    alert(result);
  } // if
  
  $(function(){
		$('#mypage').click(function(){
	            location.href="/mypage/mypage";
	        }); // function login 후 ;
	});
  
</script>

</body>

<jsp:include page="../../layout/footer.jsp" />

</html>