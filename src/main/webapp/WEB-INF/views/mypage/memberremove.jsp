<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>탈퇴</title>

  <link rel="stylesheet" href="../../../resources/static/css/member/memberRemove.css">
  <link rel="stylesheet" href="../../../resources/static/css/layout/layout.css">


  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
  <script src="https://kit.fontawesome.com/4b84ea08f3.js" crossorigin="anonymous"></script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" ></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js" ></script>



</head>
<body>

<jsp:include page="../layout/header.jsp"/>

<form role="form" method="post" autocomplete="off">
  <div class="password">
    <div class="passwordbox">
      <input type="password" size="50" value="비밀번호"
             maxlength="20" id="passwordquote" style="height: 30px;">
    </div>

    <input type="button" value="확인" class="passwordnotibtn"
           style="width: 45px;height: 35px;", onclick="checkpassword()">

    <div id="errorMessage" class="passwordnoti"> </div>

  </div>
  <div class="secession">
    <div class="secessionreason">
      <div class="secessionreasonnoti">
        탈퇴 사유
      </div>
      <input type="text" size="50" value="탈퇴사유기입" maxlength="200" class="secessionreasonquote">
    </div>

  </div>
  </div>

  <div class="button">
    <button type="submit" class="buttoncheck">확인</button>
  </div>

</form>

<c:if test = "${msg == false}">
  <p>입력한 비밀번호가 잘못되었습니다.</p>
</c:if>

<jsp:include page="../layout/footer.jsp"/>
</body>


<script>
  function checkpassword() {
    var password = document.getElementById("passwordquote").value;
    var errorMessage = document.getElementById("errorMessage");


    if (password == "qlalfqjsgh") {
      alert("확인되었습니다.")



    }else {
      alert("틀린 비밀번호 입니다");

    }
  }


</script>
</html>