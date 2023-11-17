
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>find_id</title>

    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="/resources/static/css/layout/reset.css">
    <!-- layout css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">
    <link rel="stylesheet" href="/resources/static/css/layout/header.css">
    <link rel="stylesheet" href="/resources/static/css/layout/footer.css">
    <!-- main css -->
    <link rel="stylesheet" href="/resources/static/css/layout/main.css">
    <link rel="stylesheet" href="https://kit.fontawesome.com/889f069cfd.css" crossorigin="anonymous">

    <link rel="stylesheet" href="css/course_write_copy.css">
    

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/889f069cfd.js" crossorigin="anonymous"></script>

  
</head>

<body>
    <jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/layout/header.jsp"/>
<style>
    #main{
        width: 1200px;
        height: 1px;
        /* border: 1px solid black; */
    
        /* position:relative; */
        /* float:none; */
        /* flex: auto; */
        justify-content: center;
        /* display:block; */
        display:flex;
        align-items: center;
        align-content: center;
        position: relative;
    }
    #other{
        position: relative;
        width:20%;
        height:450px;
        justify-content: center;
        display:inline-flex;
        /* align-items: center; */
        /* align-content: center; */
        /* border:1px dotted red; */
    }
    #other>div{
        position: relative;
        /* background-color :aqua */
    }
    #mainBloack{
        position: relative;
        height:450px;
        width:70%;
/*         border:1px solid grey; */
        justify-content: center;
        display:inline-flex;
        background-color: FFFFFF

    }
    #maindBloack>div{
        position: relative;
    }
    #mainBloack>div>div{
        position: relative;
        display:flex;
        /* justify-content: center; */
        align-items: center;
        align-content: center;
        width: 80%;
        height:9.5%;
        /* border:1px solid orange; */
    }
    #block{
        position: relative;
        width: 100%;
        /* background-color: aliceblue; */
    }
    form,input,label{
        position: relative;
        height: 30px;
    }
    #inputType1,#inputType2{
        /* background-color:#eee; */
        position: relative;
        width: 200px;
        height: 30px;
    }

    #send1{
        position: relative;
        width:70px;
        font-size: large;
    }
    #send2{
        position: relative;
        width:70px;
        font-size: large;
    }
    .power1, .power2{
        position: block;
        /* justify-content: center; */
        font-size: large;

    }
    #sel{
        height: 30px;
        width:200px;
        font-size: large;
    }
    #returnHome{
        justify-content: center;
    }
    #returnHome>button{
        position: relative;
        width: 200px;
        height: 30px;
        font-size: large;
    }
</style>

<!-- ===================================================================================== -->
<section>
        <div id="test">

        </div>

        <div id="container">

            <form action="#" method="post">
                <div id="main">
                    <div id="other">
                        <div></div>
                    </div>
                    <div id="mainBloack">
                        <div id="block">
                            <!-- <div></div> -->
                            <!-- <div></div> -->
                            <div></div>
                            <div class="form-group email-form">
                                <label for="email">이메일</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" name="userEmail1" id="userEmail1"
                                        placeholder="이메일">
                                    <select class="form-control" name="userEmail2" id="userEmail2">
                                        <option>@naver.com</option>
                                        <option>@daum.net</option>
                                        <option>@gmail.com</option>
                                        <option>@hanmail.com</option>
                                        <option>@yahoo.co.kr</option>
                                    </select>
                                </div>
                                <div class="input-group-addon">
                                    <button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
                                </div>
                                <div class="mail-check-box">
                                    <input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!"
                                        maxlength="6">
                                </div>
                                <span id="mail-check-warn"></span>
                            </div>

                            <hr>

                            <div id="submitResult1"></div>
                            <!-- <div>인증번호를 전송하였습니다./ 인증번호 발송에 실패하였습니다.</div> -->
                            <div class="power2">
                                <form action="#" method="get" id="form2" onsubmit="return false">
                                    <label for="">이메일 인증 번호 확인
                                        <input id="inputType2" class="form-control mail-check-input" type="password"
                                            placeholder="인증번호 6자리를 입력해주세요!" maxlength="6">
                                        <button id="send2">인증</button>
                                        <!-- <input id="inputType2" type="submit" value="인증"> -->
                                    </label>
                                </form>
                            </div>
                            <div id="submitResult2"></div>
                            <!-- <div id="check">인증에 성공하였습니다. / 인증번호가 일치하지 않습니다.</div> -->
                            <div></div>
                            <div></div>
                            <div id="returnHome">
                            	<button  type="button" onclick="location.href=/member/find_email_complete"> 확인</button>
                            </div>
                            <div id="returnHome">
                               <button id="find" type="button">아이디 확인</button>
                            </div>
                                 


                        </div>
                    </div>
                    <div id="other">
                        <div></div>
                    </div>
                </div>
            </form>
        </div>
    </section>

<div>
<script>
$(function(){
    $('#find').click(function(){
        location.href="/member/find_email_complete";
    }); // function change_password;
   
});    // jq

</script>
</div>



<!-- ===================================================================================== -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</body>

</html>