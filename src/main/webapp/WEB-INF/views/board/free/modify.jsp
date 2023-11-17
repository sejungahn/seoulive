<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>SEOULLIVE</title>
    <!-- layout css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/free/list&write.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">

    <%-- 제이쿼리 --%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>

    <%-- 폰트어썸 --%>
    <script src="https://kit.fontawesome.com/4b84ea08f3.js" crossorigin="anonymous"></script>

    <%-- 자바스크립트 --%>
    <script src="${pageContext.request.contextPath}/resources/static/js/free/write&modify.js"></script>

    <%-- 썸머 노트--%>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">

</head>
<jsp:include page="/WEB-INF/views/layout/header.jsp"/>
<body>
<!-- <%-- header --%> -->

<div id="container">
    <div class="title_box">
        <h2 class="title">자유게시판</h2>이
    </div>
    <div class="board_write_wrap">
        <form id="frm" class="write-form" action="/board/free/modify" method="post">

            <fieldset class="board_write_box">
                <legend class="hide">게시글 수</legend>
                <div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="category">카테고리 선택</label>
                        </div>
                        <div class="input_box col2">
                            <select name="category">
                                <option <c:if test="${dto.category eq 'category1'}">selected</c:if>  value="category1">카테고리1</option>
                                <option <c:if test="${dto.category eq 'category2'}">selected</c:if> value="category2">카테고리2</option>
                                <option <c:if test="${dto.category eq 'category3'}">selected</c:if> value="category3">카테고리3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="seq">번호</label>
                        </div>
                        <div class="input_box col2">
                            <input class="b_input" type="text" name="seq" readonly="readonly" value="${dto.seq}">
                        </div>
                    </div>

                    <div class="row">
                        <div class="title_box col1">
                            <label for="title">제목</label>
                        </div>
                        <div class="input_box col2">
                            <input class="b_input" type="text" name="title" value="${dto.title}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="writer">작성자</label>
                        </div>
                        <div class="input_box col2">
                            <input class="b_input" type="text" name="writer" value="${dto.writer}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="content">내용</label>
                        </div>
                        <div class="input_box col2">
                                <textarea name="content" cols="30" rows="10">${dto.content}</textarea>
                        </div>
                    </div>
                </div>
            </fieldset>
            <div class="button_wrap">
                <ul class="button_box">
                    <li><a href="#a">영구삭제</a></li>
                    <li><a href="#a">삭제</a></li>
                    <li><a href="#" onclick="return chk_form()">수정</a></li>
                    <li><a href="/board/free/list">목록</a></li>
                </ul>
            </div>
        </form>
    </div>






</div>


<%--<!-- &lt;%&ndash; quickmenu footer&ndash;%&gt;--%>
</body>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

</html>