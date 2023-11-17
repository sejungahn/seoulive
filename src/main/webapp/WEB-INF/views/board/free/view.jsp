<%--
  Created by IntelliJ IDEA.
  User: leedongyoung
  Date: 2023/05/10
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/free/view.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">




    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/6ba5041685.js" crossorigin="anonymous"></script>

    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<%--    <script src="../../../../resources/static/js/free/view.js"></script>--%>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">

    <script>

        $(function (){
            //summernote 생성
            $(".comment-write-form").find("[name=content]").summernote({
                height:100, //기본 높이
                minHeight:100, //최소 높이
            });
        });

        function chk_form() {
            document.getElementById('frm').submit();
            document.getElementById('commentFrm').submit();
        }

        $(document).ready(function (){
            loadList();
        });
        console.log("${dto.seq}");

        var commentSeq = "${dto.seq}";

        const loadList = () => {
            //서버와 통신: 게시판 리스트 가져오기
            $.ajax({
                url : "comment/"+commentSeq,
                type : "get",
                dataType : "json",
                success : commentView,
                error : function () {alert("error");}
            })
        }

        const commentView = (data) => {
            var listHtml = "";
            $.each(data,function (index,obj) {
                listHtml+= "<div id='commnetSeq"+obj.seq+"' class='board-view'>";
                listHtml+="<div id='commentContent"+obj.seq+"' class='board-comment-title'>"+obj.content+"</div>";
                listHtml+="<div class='board-info'>";
                listHtml+="<div class='board-info-lists'>";
                listHtml+="<div class='board-info-num'>댓글번호 : "+obj.seq+"</div>";
                listHtml+="<div class='board-info-list'>작성자 : "+obj.writer+"</div>";
                listHtml+="</div>";
                listHtml+="<div class='board-info-lists'>";
                if(obj.modify_date == null){
                    listHtml+="<div class='board-info-list'>작성일 :</div>";
                    listHtml+="<div class='board-info-num'>"+obj.write_date+"</div>";
                }else {
                    listHtml+="<div class='board-info-list'>수정일 :</div>";
                    listHtml+="<div class='board-info-num'>"+obj.modify_date+"</div>";
                }

                listHtml+="</div>";
                listHtml+="</div>";
                listHtml+="<div class='board-comment-info'>";
                listHtml+="<div class='button_wrap'>";
                listHtml+="<ul class='button_box'>";
                listHtml+="<li><a href='javascript:goDelete("+obj.seq+")'>삭제</a></li>";
                listHtml+="<li><a href='javascript:goUpdateForm("+obj.seq+")'>수정</a></li>";
                listHtml+="</ul>";
                listHtml+="</div>";
                listHtml+="</div>";
                listHtml+="</div>";
            });
            $("#comment_area").html(listHtml);
        }

        const goCommentPostDelete = (seq) => {
            $.ajax({
                url : "comment/post/"+seq,
                type : "delete",
                success : loadList,
                error : function () {alert("error")}
            });
        }

        const goInsert = () => {
            var fData = $("#frm").serialize();
            // alert(fData);

            $.ajax({
                url : "/board/free/comment/write",
                type : "post",
                data : fData,
                success : loadList,
                error : function () {alert("error");}

            });

        }

        const goDelete = (seq) => {
            $.ajax({
                url : "comment/"+seq,
                type : "delete",
                success : loadList,
                error : function () {alert("error")}
            });
        }

        const goUpdateForm = (seq) => {

            var commentHtml = "";
            var commentContent = $("#commentContent"+seq).text();

            $(function (){
                //summernote 생성
                $(".comment-write-form").find("[name=content]").summernote({
                    height:100, //기본 높이
                    minHeight:100, //최소 높이
                });
            });

            commentHtml+= ' <form class="comment-write-form">';
            commentHtml+= '<div class="comment_form">';
            commentHtml+= '<div class="commentguid">'+seq+'번 댓글 수정</div>';
            commentHtml+= '<textarea name="content" id="commentVal'+seq+'" cols="118" rows="10">'+commentContent+'</textarea>';
            commentHtml+= '<div class="button_wrap">';
            commentHtml+= '<ul class="button_box">';
            commentHtml+= '<li><a href="javascript:onclick=goUpdate('+seq+')">댓글수정</a></li>';
            commentHtml+= '</ul>';
            commentHtml+= '</div>';
            commentHtml+= '</div>';
            commentHtml+= '</form>';



            $("#commnetSeq" + seq).html(commentHtml);


        }

        const goUpdate = (seq) => {

            var content = $("#commentVal"+seq).val();
            var post_seq = "${dto.seq}"
            var board_name = "freeboard";


            $.ajax({
                url : "/board/free/comment/commentModify",
                type : "put",
                contentType: 'application/json;charset=utf-8',
                data : JSON.stringify({"seq":seq,"content":content,"board_name":board_name,"post_seq":post_seq}),
                success : loadList,
                error : function () {alert("error");}
            });
        }


    </script>
<jsp:include page="../../layout/header.jsp"/>



<div class="main-container">

    <%--자유게시판--%>
    <div class="main-title">
        <h1>자유게시판</h1>
        <p>서울라이브 게시판</p>
    </div>
    <div class="board-view-container">
        <div  class="board-view" id="board-view-content">
            <div class="board-title">${dto.title}</div>
            <div class="board-info">
                <div class="board-info-lists">
                    <div class="board-info-list">번호</div>
                    <div class="board-info-num">${dto.seq}</div>
                </div>
                <div class="board-info-lists">
                    <div class="board-info-list">글쓴이</div>
                    <div class="board-info-writer">${dto.writer}</div>
                </div>
                <c:if test="${empty dto.modify_date}">
                <div class="board-info-lists">
                    <div class="board-info-list">작성일</div>
                    <div class="board-info-date"><fmt:formatDate value="${dto.write_date}" pattern="yyyy-MM-dd"/></div>
                </div>
                </c:if>
                <c:if test="${!empty dto.modify_date}">
                    <div class="board-info-lists">
                        <div class="board-info-list">수정일</div>
                        <div class="board-info-date"><fmt:formatDate value="${dto.write_date}" pattern="yyyy-MM-dd"/></div>
                    </div>
                </c:if>
                <div class="board-info-lists">
                    <div class="board-info-list">조회</div>
                    <div class="board-info-views">${dto.total_count}</div>
                </div>
            </div>
            <div class="board-content">${dto.content}</div>
        </div>

        <div class="button_wrap">
            <ul class="button_box">
                <li><a id="commentDelete" onclick="goCommentPostDelete(${dto.seq})" href="/board/free/remove?seq=${dto.seq}">삭제</a></li>
                <li><a href="/board/free/modify?seq=${dto.seq}">수정</a></li>
                <li><a href="/board/free/list">목록</a></li>
            </ul>
        </div>



    <%--댓글--%>

            <div class="comment_wrap">
                <div class="main-comment-title">
                    <h1>댓글</h1>
                </div>
                <div id="comment_area">


                </div>




<%--댓글 작성 폼--%>
            <form id="frm" class="comment-write-form" method="post">
                <div class="comment_form">
                    <div class="commentguid">댓글 작성</div>
                    <input type="hidden" name="post_seq" value="${dto.seq}">
                    <input type="hidden" name="board_name" value="freeboard">
                   <input type="text" name="writer" placeholder="닉네임을 입력해주세요" style="border: 1px solid black; height: 30px; width: 200px">
                    <textarea name="content" id="" cols="118" rows="10"></textarea>
                    <div class="button_wrap">
                        <ul class="button_box">
                            <li><a href="" onclick="goInsert()">댓글작성</a></li>
                        </ul>
                    </div>
                </div>
            </form>


        </div>







    </div>









</div>



</main>


</body>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>


</html>

