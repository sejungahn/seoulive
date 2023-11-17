
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>find_password</title>

    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="/resources/static/css/layout/reset.css">
    <!-- layout css -->
    <link rel="stylesheet" href="/resources/static/css/layout/header.css">
    <link rel="stylesheet" href="/resources/static/css/layout/footer.css">
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
        /* border:1px solid grey; */
        justify-content: center;
        display:inline-flex;
        background-color: #FFFFFF;

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
        width: 90%;
        height:9.5%;
        /* border:1px solid orange; */
    }
    #block{
        position: relative;
        width: 90%;
        border:1px solid #FFFFFF;
        /* background-color: aliceblue; */
        justify-self: center;
        align-items: center;
    }
    #left, #right{
        width: 5%;
        /* border: 1px solid red; */
    }
    form,input,label{
        position: relative;
        height: 30px;
    }
    #inputType0,#inputType1,#inputType2{
        /* background-color:#eee; */
        position: relative;
        width: 200px;
        height: 30px;
    }

    #send0 , #send1 , #send2{
        position: relative;
        width:70px;
        font-size: large;
    }
    .power0, .power1, .power2{
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
    <div id ="test">
        
    </div>

    <div id="container">
        
        <form action="/change_password" method="get">
            <div id="main">
             <div id="other">
                 <div></div>
             </div>
             <div id="mainBloack">
                <div id="left"></div>
                 <div id="block">
                     <div></div>
                     
                     <div id="submitResult0">

                     </div>
                     
                     
        
                     <div class="form-group email-form">
						 <label for="email">이메일</label>
						 <div class="input-group">
						<input type="text" class="form-control" name="userEmail1" id="userEmail1" placeholder="이메일" >
						<select class="form-control" name="userEmail2" id="userEmail2" >
                        <option>@gmail.com</option>
						<option>@naver.com</option>
						<option>@daum.net</option>
	

						</select>
					</div>   
					<div class="input-group-addon">
						<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
					</div>
						<div class="mail-check-box">
					<input class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					</div>
						<span id="mail-check-warn"></span>
					</div>
                     
                     
                     
                     <div></div>
                     <div id="returnHome" type="submit" href=""><button>확인</button></div>
                     <div><button type="button" class="enter">비밀번호변경 </button></div>
                  
                     
                 </div>
                 <div id="right"></div>
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
    // 아이디 확인
    
    $('#mail-Check-Btn').click(function() {
		const eamil = $('#userEmail1').val() + $('#userEmail2').val(); // 이메일 주소값 얻어오기!
		console.log('완성된 이메일 : ' + eamil); // 이메일 오는지 확인
		const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
		
		
		$.ajax({
			type : 'get',
			url : '<c:url value ="/member/controller/find_password?email="/>'+eamil, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
				alert('인증번호가 전송되었습니다.')
			}			
		}); // end ajax
	}); // end send eamil
	
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail-check-input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#mail-check-warn');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
	         console.log("checkPoint.inputCode");
	         
	         
	         
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
			console.log("checkPoint.inputCode");
		}
	});
	$(function(){
		$('.enter').click(function(){
			console.log("checkPoint.enter");
			/* console.log(document.querySelector("#userEmail1")+document.querySelector("#userEmail2")); */
			
			location.href = "/member/change_password";
			/* ?email=${__EMAIL__.email} */
		}); onlick
	});	// jq
	
    


</script>
</div>



<!-- ===================================================================================== -->

<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</body>

</html>