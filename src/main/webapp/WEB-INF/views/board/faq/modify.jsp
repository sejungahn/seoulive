<%--
  Created by IntelliJ IDEA.
  User: sejungahn
  Date: 2023/05/15
  Time: 16:42
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>FAQ</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/faq/FAQWrite.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/4b84ea08f3.js" crossorigin="anonymous"></script>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">

    <script>
        $(function(){
            $('#listBtn').click(function(){
                location.href = "/board/cs/faq/list?currPage=${param.currPage}";
            });
        });
    </script>

</head>
<body>

<%--헤더--%>
<jsp:include page="../../layout/header.jsp"/>

<%-- 본문 --%>
<div id="container">
    <div class="title_box">
        <h2 class="title">FAQ</h2>
    </div>
    <div class="board_write_wrap">
        <form action="/board/cs/faq/modify" method="post">
            <fieldset class="board_write_box">
                <legend class="hide">게시글 수정</legend>
                <input type="hidden" name="currPage" value="${ param.currPage }">
                <input type="hidden" name="seq" value="${ __BOARD__.seq }">
                <input type="hidden" name="writer" value="${ __BOARD__.writer }">
                <div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="category">카테고리</label>
                        </div>
                        <div class="input_box col2">
                            <select name="category">
                                <option <c:if test="${__BOARD__.category =='카테고리1'}"> selected </c:if>  value="카테고리1">카테고리1</option>
                                <option <c:if test="${__BOARD__.category =='카테고리2'}"> selected</c:if> value="카테고리2">카테고리2</option>
                                <option <c:if test="${__BOARD__.category =='카테고리3'}"> selected</c:if> value="카테고리3">카테고리3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="title">제목</label>
                        </div>
                        <div class="input_box col2">
                            <input class="b_input" type="text" name="title" value="${__BOARD__.title}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="writer">작성자</label>
                        </div>
                        <div class="input_box col2">
                            ${__BOARD__.writer}
                        </div>
                    </div>

                    <div class="row">
                        <div class="title_box col1">
                            <label for="content">내용</label>
                        </div>
                        <div class="input_box col2">
                                <textarea name="content"  cols="60" rows="10">${__BOARD__.content}</textarea>
                        </div>
                    </div>
                </div>

                <div class="button_wrap">
                    <ul class="button_box">

                        <li><button type="submit" id="submitBtn">등록</button></li>
                        <li><button type="button" id="listBtn">목록</button></li>

                    </ul>
                </div>
            </fieldset>
        </form>


    </div>





</div>

<jsp:include page="../../layout/footer.jsp"/>
</body>