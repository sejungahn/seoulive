<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SEOULLIVE_get.jsp</title>


    <link rel="stylesheet" href="../../../../resources/static/css/course/courseView.css">
    <link rel="stylesheet" href="../../../../resources/static/css/layout/layout.css">


    <script type="text/javascript" src="../../../../resources/static/js/courseComm.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/4b84ea08f3.js" crossorigin="anonymous"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.4/jquery.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js" ></script>



</head>
<body>
<jsp:include page="../../layout/header.jsp"/>



<section>
    <div class="plan_page">
        <div class="plan_cover">
            <div class="cover_img"><img src="https://picsum.photos/id/1081/600/400"></div>
            <div class="cover_bottom">
                <div class="cover_bleft">
                    <div class="plan_title">${__BOARD__.TITLE}</div>
                    <div class="plan_datetheme">
                        <div class="plan_user">${__BOARD__.WRITER}</div>
                        <div class="plan_date">${__BOARD__.DURATION_START.toLocaleString()}-${__BOARD__.DURATION_END.toLocaleString()}</div>
                    </div>
                </div>

                <div class="title_function">
                    <div class="url_setClipboard">
                        <a href="#" id="copyBtn" title="" style="cursor:pointer;">
                            <i class="fas fa-share-nodes"></i>URL 복사
                        </a>
                    </div>
                    <div class="buddyBtn">
                        <a href="#"><i class="fas fa-user"></i></a>팔로우
                    </div>

                </div>

                <div class="cover_bright">
                    <span>${__BOARD__.REVIEW}</span>
                </div>
            </div>
        </div>


        <%--탭--%>
        <div class="plan_mnu_box">
            <div class="plan_mnu">일정표</div>
            <div class="plan_mnu_line"></div>
            <div class="plan_mnu">댓글</div>
        </div>




        <%--   본문    --%>
        <div class="container">

            <!-- Schedule: Day 1 -->
            <c:set var="lastIndex" value="${__COURSETRAVELBOARD__.size() -1 }" />
            <c:set var="travelId" value="${__COURSETRAVELBOARD__[lastIndex].TRAVEL_ID}" />
            <c:set var="underscoreIndex" value="${travelId.indexOf('_')}" />
            <c:set var="extractedValue" value="${travelId.substring(0, underscoreIndex)}" />

            <div class="container">

                <!-- Schedule: Day 1 -->


                <c:forEach begin="0" end="${__DAY_COUNT__}" varStatus="loop">
                    <%-- 반복문 내에서 loop.index 또는 loop.count 등을 사용하여 반복 처리 --%>
                    <%-- <p>반복 인덱스: ${loop.index}</p> --%>

                    <%--    day 박스, duration_start(title), travel_title, review(여행지당) --%>
                <div class="tab-content col-lg-9">
                    <div id="Day${loop.count}" class="tab-pane fade in active">
                        <div class="row schedule-item">

                            <div class="time-box"> Day${loop.count}</div>
                            <div class="col-md-10">

                                <h4>${__BOARD__.DURATION_START}</h4>

                                <c:forEach var="courseTravelVO" items = "${__COURSETRAVELBOARD__}">
                                    <c:choose>
                                        <c:when test="${courseTravelVO.TRAVEL_ID.substring(0, 1) == loop.count}">


                                            <div class="travel-info">

                                                <div class="travel_title"> ${courseTravelVO.TITLE} / ${courseTravelVO.CATEGORY}</div>
                                                <div class="reviewpertravel">${courseTravelVO.USER_REVIEW}</div>
                                            </div>
                                        </c:when>

                                    </c:choose>

                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>

        </div>

</section>







<%-- 댓글    --%>
<div class="card my-4">
    <h5 class="card-header" style="position: relative; left: 25%; top: -100px ">Leave a Comment:</h5>
    <div class="card-body">
        <form name="comment-form" action="/board/course/comm_write" method="post" autocomplete="off">
            <div class="form-group">
                <input type="hidden" name="POST_SEQ" value="${__BOARD__.seq}" >
                <input type="hidden" name="WRITER" value="${__AUTH__.nickName}" >
                <textarea name="CONTENT" class="form-control" rows="3"
                          style="width: 800px; resize: none; position:relative; left:25%; top: -80px; border-bottom: 1px solid darkgray" ></textarea>
            </div>
            <button type="submit" class="btn btn-primary"
                    style="position: relative; left: 80%; top:-120px;">Submit</button>


        </form>
    </div>
</div>

<c:forEach var="commVO" items = "${__COMMENT_LIST__}">
<div class="comm_user_info">
    <div class="comm_usercomminfo">
        <div class="comm_username">${commVO.WRITER}</div>
        <div class="comm_usercommtime">${commVO.WRITE_DATE.toLocaleString()}</div>
        <div class="comm_usercommtxt">${commVO.CONTENT}</div>
        <div class="viewdelete1">
            <c:choose>
                <c:when test = "${__AUTH__.nickName == commVO.WRITER}">
                    <button type="submit" class="deleteBTN" value="${commVO.SEQ}" style="width: 50px; height: 20px;">delete</button>
                </c:when>
            </c:choose>
        </div>
    </div>
    </c:forEach>
</div>


<div class="getContainer">
    <div class="boardList"><button type="button" class="boardList">list</button></div>
    <c:choose>
        <c:when test = "${__AUTH__.nickName == __BOARD__.WRITER}">
            <div class="boardDelete"><button type="button" class="boardDelete">delete</button></div>
        </c:when>
    </c:choose>
    <c:choose>
        <c:when test = "${__AUTH__.nickName == __BOARD__.WRITER}">
            <div class="viewModify"><button type="button" class="viewModify">modify</button></div>
        </c:when>
    </c:choose>
</div>



<jsp:include page="../../layout/footer.jsp"/>
</body>
<script type="text/javascript">



    $(function () {
        $('.boardList').click(function() {
            console.clear();
            location = "/board/course/list"
            console.log('List Button Clicked ..')
        })

        $('.viewModify').click(function() {
            console.clear();
            location = "/board/course/modify?seq=${__BOARD__.seq}"
            console.log('modify Button Clicked ..')
        }); //.jq
    });

    $(function () {
        $('.deleteBTN').click(function() {
            var commentSeq = $(this).val();
            console.log("deleteComment function ...")
            alert(commentSeq);
            $.ajax({
                type: "post",
                url: "/board/course/comm_delete",
                data: { seq: commentSeq },
                success: function (result) {
                    if (result == "success") {
                        alert("삭제되었습니다.");
                    }
                }
            });
        });
    });

</script>


</html>