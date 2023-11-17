<%--
  Created by IntelliJ IDEA.
  User: leedongyoung
  Date: 2023/05/10
  Time: 8:03 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>SEOULLIVE</title>
    <!-- layout css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/free/list&write.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/4b84ea08f3.js" crossorigin="anonymous"></script>
    <script src="${pageContext.request.contextPath}/resources/static/js/free/write&modify.js"></script>
<%--    summernote dependency--%>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">


</head>
<body>

<div id="container">
    <div class="title_box">
        <h2 class="title">자유게시판</h2>
    </div>
    <div class="board_write_wrap">
        <form id="frm" class="write-form" action="/board/free/write" method="post">

            <fieldset class="board_write_box">
                <legend class="hide">게시글 등록</legend>
                <div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="category">카테고리 선택</label>
                        </div>
                        <div class="input_box col2">
                            <select name="category">
                                <option value="category1">카테고리1</option>
                                <option value="category2">카테고리2</option>
                                <option value="category3">카테고리3</option>
                            </select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="title">제목</label>
                        </div>
                        <div class="input_box col2">
                            <input class="b_input" type="text" name="title">
                        </div>
                    </div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="writer">작성자</label>
                        </div>
                        <div class="input_box col2">
                            <input class="b_input" type="text" name="writer">
                        </div>
                    </div>
                    <div class="row">
                        <div class="title_box col1">
                            <label for="content">내용</label>
                        </div>
                        <div class="input_box col2">
                                <textarea name="content" cols="30" rows="10"></textarea>
                        </div>
                    </div>
                </div>
            </fieldset>
            <div class="button_wrap">
                <ul class="button_box">
                    <li><a type="submit">영구삭제</a></li>
                    <li><a href="#a">삭제</a></li>
                    <li><a href="#" onclick="return chk_form()">등록</a></li>
                    <li><a href="/board/free/list">목록</a></li>
                </ul>
            </div>
        </form>
    </div>



</div>


</body>
</html>
