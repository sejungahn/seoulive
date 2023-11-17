<%--
  Created by IntelliJ IDEA.
  User: nayoung
  Date: 2023/05/10
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>



<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>

    <!-- layout css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/myPage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/4b84ea08f3.js" crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>

    <script src="https://kit.fontawesome.com/7ae3a6a91c.js" crossorigin="anonymous"></script>

	<script>
          console.log("<%= session.getAttribute("__AUTH__") %>");
    </script>
</head>
<body>
<!-- <%-- header --%> -->
<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/layout/header.jsp"/>

<div class="mypage_wrap">

    <h1 class="susb_tit">마이페이지</h1>


    <!-- 프로필/사이드메뉴 -->
    <div class="myCont left_menu clear">
        <!-- 프로필 -->
        <p class="user_box">
            <img src="/resources/static/img/user.png" alt="프로필">
            <span class="user_id">"${__AUTH__.nickName}"</span>
        </p>
        <!-- 사이드메뉴 -->
        <ul class="side_menu">
            <li><a href="#">회원정보 수정</a></li>
            <li><a href="/member/change_password" id="change_password">비밀번호 변경</a></li>
<!--             <li><a href="#">팔로워/팔로잉</a></li> -->
            <li><a href="/board/cs/view">고객센터</a></li>
            <li><a href="/member/remove">회원탈퇴</a></li>
        </ul>
    </div>

    <!-- 찜목록/내리뷰/내코스 -->
    <!-- 찜목록/내리뷰/내코스 -->
    <div class="myCont right_menu">
        <div class="my_box my_like">
            <!-- 찜목록 -->
            <div class="my_cont_box like_cont">
                <h2>찜목록</h2>
                <p class="more_btn"><a href="/board/review/list" id="likeList1">더보기</a><i
                        class="fas fa-chevron-right"></i></p>
                <div class="container">
                    <ul class="list_thumType flnon">

                        <c:forEach var="REVIEW" items="${__LIKE_REVIEW_LIST__}">
                            <li class="thum thum_2">
                                <div class="photo"><a href="/board/review/view?seq=${REVIEW.seq}">

                                    <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=870e2a7c-eb93-4708-83b0-94cd277b6f04"
                                         alt="석촌호수 벚꽃축제"></a>
                                    <!--                                                             <em class="flag type_before">진행전</em></a> -->
                                    <!--                                                         <i class="fas fa-heart on"></i> -->
                                </div>
                                <div class="area_txt">
                                    <div class="tit">
                                        <a
                                                href="/board/review/view?seq=${REVIEW.seq}">${REVIEW.title}</a>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                        <c:forEach var="COURSE" items="${__LIKE_COURSE_LIST__}">
                            <li class="thum thum_2">
                                <div class="photo"><a
                                        href="/board/course/get?seq=${COURSE.seq}"><img
                                        src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=870e2a7c-eb93-4708-83b0-94cd277b6f04"
                                        alt="석촌호수 벚꽃축제"></a>
                                    <!--                                                             <em class="flag type_before">진행전</em></a> -->
                                    <!--                                                         <i class="fas fa-heart on"></i> -->
                                </div>
                                <div class="area_txt">
                                    <div class="tit">
                                        <a
                                                href="/board/course/get?seq=${COURSE.seq}">${COURSE.title}</a>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                        <c:forEach var="TRAVEL" items="${__LIKE_TRAVEL_LIST__}">
                            <li class="thum thum_2">
                                <div class="photo">
                                    <a href="/board/travel/view?seq=${TRAVEL.seq}">
                                        <img src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&amp;id=870e2a7c-eb93-4708-83b0-94cd277b6f04"
                                             alt="석촌호수 벚꽃축제"></a>
                                    <!--                                                             <em class="flag type_before">진행전</em></a> -->
                                    <!--                                                         <i class="fas fa-heart on"></i> -->
                                </div>
                                <div class="area_txt">
                                    <div class="tit">
                                        <a
                                                href="/board/travel/view?seq=${TRAVEL.seq}">${TRAVEL.title}</a>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </div>

            </div>



            <!--              내 리뷰 -->
            <div class="my_cont_box">
                <h2>내 리뷰</h2>
                <p class="more_btn"><a href="/board/review/list" id="likeList2">더보기</a><i
                        class="fas fa-chevron-right"></i></p>

                <c:forEach var="BoardVO" items="${__REVIEW__}">
                    <div class="container my_review">
                        <a href="/board/review/view?seq=${ BoardVO.seq }"><img
                                src="https://cdn.visitkorea.or.kr/img/call?cmd=VIEW&id=1ec32eb6-aac2-4c5a-9e56-9ac1c817afd6"
                                alt="마포 나만의 여행"></a>
                        <div class="desc_wrap">
                            <h4>

                                <a href="/board/review/view?seq=${ BoardVO.seq }">${ BoardVO.title
                                        }</a>
                            </h4>
                            <p class="desc_wrap">

                                <a href="/board/review/view?seq=${ BoardVO.seq }">${ BoardVO.content
                                        }</a>
                            </p>
                        </div>
                    </div>
                </c:forEach>

            </div>
            <!-- 내 코스 -->
            <div class="my_cont_box my_course">
                <h2>내 코스</h2>
                <p class="more_btn"><a href="/board/course/list" id="courseBoard">더보기</a><i
                        class="fas fa-chevron-right"></i></p>
                <div class="container">

                    <ul>
                        <c:forEach var="course" items="${__COURSE__}">


                            <a id="MyCourse" href="/board/course/get?seq=${course.seq}">
                                <li>${course.TITLE}</li>
                            </a>

                        </c:forEach>


                    </ul>



                </div>
            </div>

        </div>
    </div>

</div>


<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

</body>


<script>
    $(function(){
        $('#change_password').click(function(){
            location.href="/member/change_password";
        }); // function change_password;
        $('#likeList1').click(function(){
        	location.href="/board/review/list";
        })	// likeList1
        $('#likeList2').click(function(){
        	location.href="/board/review/list";
        })	// likeList2
        $('#courseBoard').click(function(){
        	location.href="/board/course/list";
        })	// courseBoard
        
        //--------------- page ------------------//
        $('.pageNum').on('click',function(e){
            let selectedPageNum = e.currentTarget.textContent;
            console.log(e.currentTarget.textContent);
            location.href="/mypage/mypage?currPage="+selectedPageNum;
        })  //pageNum
    });    // jq
</script>
</html>


