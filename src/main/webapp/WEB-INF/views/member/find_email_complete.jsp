
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">

<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>find_id_complete</title>

    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="/resources/static/css/layout/reset.css">
    
    
    
    
    <!-- main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">
    <link rel="stylesheet" href="https://kit.fontawesome.com/889f069cfd.css" crossorigin="anonymous">

    <link rel="stylesheet" href="css/course_write_copy.css">
    

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/889f069cfd.js" crossorigin="anonymous"></script>

  
  
</head>
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/layout/header.jsp"/>
<style>
    #main{
        width: 1200px;
        height: 1px;
        display:flex;
        align-items: center;
    }
    #other{
        width:20%;
    }
 
    #mainBloack{
        height:450px;
        width:70%;
        border:1px solid grey;
        display:flex;
    }

    #block{
        width: 100%;
    }
    #block>#fisrt,#bottom,#top{
        display:flex;
        height: 50px; 
    }
    #left, #right{
        width: 20%;
/*         border:1px purple solid; */
    }
    #SubBox{
        height:50px;
    }
    #MainBox{
        justify-content: center;
        align-items: center;
        display: flex;
        height: 250px;
/*         border:1px solid red; */
    }

    form,input,label{
        height: 30px;
    }
    #FindId{
        font-weight: bolder;
        font-size:larger;
    }
    #buttonBox1{
        display: flex;
        /* justify-content: center; */
        /* width : 200px;  */
        
    }
    #buttonBox1>div{
        /* width:100px; */
        /* height:200px; */
    }
    #buttonblock{
        /* width:100px; */
    }
    #button{
        width:100px;
        height: 100px;
        /* padding:30px 50px; */
    }
	section{
		height:1000px;
		
	}
	#container{
	height: 500px;
    margin: 0 auto;
    padding-top: 500px;
	}
    
</style>

<script>
	$(function(){
		$('#find_password').click(function(){
			location.href = "/member/find_password";
			/* ?email=${__BOARD__.email} */
		}); // onclick
	});	//jq
</script>

<!-- ===================================================================================== -->
<section>
    <div id ="test">
        
    </div>

    <div id="container">
        
        <form action="#" method="get">
            <div id="main">
             <div id="other">
                 <div></div>
             </div>
             <div id="mainBloack">
                <div id="left">

                </div>
                 <div id="block">
                    <div id="top"></div>
                     <div class="pp"></div>
                     <div id="first" class="pp"></div>
                     <div id="FindId" class="pp">이메일 찾기</div>
                     <div><button disabled></button></div>
                     <div>고객님의 정보와 일치하는 이메일입니다.</div>
                     
                     <div id="MainBox">
                        <div id="Box">${__BOARD__.email}</div>
                        <table>
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>
                            </tr>
                            <tr>
                                <td> </td>
                                <td> </td>
                                <td> </td>

                            </tr>
                        </table>
                        <div id="Box">
                        	가입일 <fmt:formatDate value="${__BOARD__.join_date}" pattern="yyyy년MM월dd일"/>
<%--                         	가입일 ${__BOARD__.join_date} --%>
                        </div>
                     </div>
                     <div id="SubBox"></div>
                     <div class="pp"></div>
                     <div id="buttonBox1">
                        <div><button type="button" onclick="location.href='/member/login/email'">로그인</button></div>
                        <div id="buttonblock"><button disabled></button></div>
                        <div><button type="button" id="find_password" >비밀번호 찾기</button></div>
                    </div>
                     <div id="bottom"></div>

                     
                 </div>
                 <div id="right">

                 </div>
             </div>
             <div id="other">
                 <div></div>
             </div>
            </div>
         </form>
    </div>
</section>




<!-- ===================================================================================== -->
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</body>

</html>
