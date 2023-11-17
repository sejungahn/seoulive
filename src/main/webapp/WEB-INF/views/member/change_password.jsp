<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <!DOCTYPE html>
        <html lang="ko">

        <head>
            <meta charset="UTF-8">
            <meta http-equiv="X-UA-Compatible" content="IE=edge">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">

            <title>change_password</title>

            <link rel="stylesheet" href="css/reset.css">
            <link rel="stylesheet" href="/resources/static/css/layout/reset.css">
            <!-- layout css -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">
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

            <!-- ===================================================================================== -->
            <section>
                <div id="test">

                </div>

                <div id="container">

<style>
    table{
        border: 1px solid ;
    }
    input{
        width:300px;
        height: 30px;
    }
    #buttons{
        width:200px;
        text-align: center;
        align-items: center;
    }
    #submitBtn,#cancle{
        width: 150px;
        height:30px;
        
    }
</style>

                    <table>
                        
                        <form role="form" action="/member/change_password" method="post">
                            <tr>
                            
                                <td>
                                    <p>
                                        
                                        <input type="text" name="email" id="check_pw" placeholder="아이디" >
                                        <!-- value="${param.email }" -->
                                        
                                    </p>
                                    
                                </td>
                                
                            
                            </tr>
                            <tr>
                                <td>
                                    <p>
                                        
                                        <input type="password" name="password" id="new_pw" placeholder="새 비밀번호">
                                        
                                    </p>
                                    
                                </td>
                            </tr>
                            <tr id="buttons">
                            
                                <td >
                                    <button type="button">비밀번호 확인</button>
                                </td>
                                
                            </tr>
                            <tr id="buttons">
                                <td>
                                    <button type="submit" id="submitBtn">저장</button>
                                    <button type="button" id="cancle">취소</button>
                                </td>
                                
                            </tr>
                        </form>
                        
                    </table>
                    
                   
                </div>
            </section>
<script>
    var pass = false;
  $("#new_pw").change(function(){
    checkPassword($('#new_pw').val(),$('check_pw').val());
    });
function checkPassword(password,id){
    
    if(!/^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/.test(password)){            
        
        alert('숫자+영문자+특수문자 조합으로 8자리 이상 사용해야 합니다.');
        
        $('#new_pw').val('').focus();
        return false;
    }    
    var checkNumber = password.search(/[0-9]/g);
    var checkEnglish = password.search(/[a-z]/ig);
    if(checkNumber <0 || checkEnglish <0){
        
        alert("숫자와 영문자를 혼용하여야 합니다.");
        $('#new_pw').val('').focus();
        return false;
    }
    if(/(\w)\1\1\1/.test(password)){
        alert('같은 문자를 4번 이상 사용하실 수 없습니다.');
        $('#new_pw').val('').focus();
        return false;
    }
        
    // if(password.search(id) > -1){
    //     alert("비밀번호에 아이디가 포함되었습니다.");
    //     $('#new_pw').val('').focus();
    //     return false;
    // }
    // document.write("정상적으로 작성되었습니다.");
    alert("정상적으로 작성되었습니다.");
    pass=true;
    return true;
}
    $(function(){
        $('#cancle').click(function(){
            // location.href = "https://www.naver.com";
            location.href = "/board/course/write";
        })  // onclick

        $('#submitBtn').click(function(){
        	if(pass){
        		
        		 alert("저장되었습니다.");
        		 location.href = "/board/course/list";
        	}else{
        		alert("정상적으로 입력하지 않았습니다.");
        	}
          
            
        })  // onclick
    }); // jq
    $(document).ready(function(){
    	var formObj = $("form");
    	$('#submitBtn').on("click",function(e){
    		e.preventDefault();
    		var operation = $(this).data("oper");
    		console.log(operation);
    		formObj.submit();
            location.href = "/mypage/mypage";
    	})
    });

</script>




            <!-- ===================================================================================== -->

  <jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
        </body>

        </html>