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
    <!-- 커밋하고 푸쉬하기1212 -->
    <title>SEOULLIVE</title>
    <!-- layout css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/free/list&write.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">


    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/4b84ea08f3.js" crossorigin="anonymous"></script>

    <%-- 자바스크립트 --%>
    <script src="${pageContext.request.contextPath}/resources/static/js/free/list.js"></script>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">

</head>
<jsp:include page="../../layout/header.jsp"/>

<body>

<div id="container">
    <div class="title_box">
        <h2 class="title">자유게시판</h2>
    </div>
    <div class="search_wrap">
        <form id="searchForm" method="get" action="/board/free/list">
            <fieldset class="search_box">
                <legend class="hide">게시글 검색</legend>
                <div class="cate_box">
                    <label for="search_category" class="hide"><span>검색분류선택</span></label>
                    <select name="type">
                        <option value=""
                                <c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
                        <option value="T"
                                <c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
                        <option value="C"
                                <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
                        <option value="W"
                                <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
                        <option value="TC"
                                <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목
                            or 내용</option>
                        <option value="TW"
                                <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목
                            or 작성자</option>
                        <option value="TWC"
                                <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목
                            or 내용 or 작성자</option>
                    </select>
                </div>
                <div class="search_input_box">
                    <label for="search_value" class="hide"><span>검색</span></label>
                    <input class="b_input" type="text" id="search_value" name="keyword" placeholder="검색어를 입력해 주세요" value='<c:out value="${pageMaker.cri.keyword}"/>'>
                    <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>'>
                    <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>'>
                    <button class="search_button">검색</button>
                </div>

            </fieldset>
        </form>
    </div>


    <div class="table_wrap">
        <table class="table_free" summary="번호, 카테고리, 제목, 작성자, 등록일, 조회수로 구성된 표">
            <caption class="hide">공지사항</caption>
            <colgroup>
                <col width="10%">
                <col width="*">
                <col width="10%">
                <col width="10%">
                <col width="10%">
            </colgroup>
            <thead>
            <tr>
                <th scope="col">번호</th>
                <th scope="col">제목</th>
                <th scope="col">작성자</th>
                <th scope="col">등록일</th>
                <th scope="col">조회</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="freeDto" items="${list}">
                <tr>
                    <td>${freeDto.seq}</td>
                    <td class="title left"><a href="/board/free/view?seq=${freeDto.seq}">${freeDto.title}</a>
                        <a href="#" title="자세히 보기"></a>
                    </td>
                    <td>${freeDto.writer}</td>
                    <td><fmt:formatDate value="${freeDto.write_date}" pattern="yyyy-MM-dd"/></td>
                    <td>${freeDto.total_count}</td>
                </tr>
            </c:forEach>

            </tbody>
        </table>
    </div>

    <div class="button_wrap">
        <ul class="button_box">
            <li><a href="/board/free/write">등록</a></li>
        </ul>
    </div>



    <div class="paging_wrap">
        <div class="paging_box">
            <ul>
                <c:if test="${pageMaker.prev}">
                    <li class="prev pager">
                        <a href="${pageMaker.startPage -1}" title="이전 페이지로 이동하기"><i class="fas fa-chevron-left"></i></a>
                    </li>
                </c:if>

                <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li>
                        <a class="pageNum ${pageMaker.cri.pageNum ==pageNum? 'active':''}"  href="#a">${pageNum}</a>
                    </li>

                </c:forEach>

                <c:if test="${pageMaker.next}">
                    <li class="prev pager">
                        <a href="${pageMaker.endPage +1}" title="다음 페이지로 이동하기"><i class="fas fa-chevron-right"></i></a>
                    </li>

                </c:if>

            </ul>
        </div>
    </div>

    <form id='actionForm' action="/board/free/list" method='get'>
        <input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
        <input type='hidden' name='amount' value='${pageMaker.cri.amount}'>

        <input type='hidden' name='type'
               value='<c:out value="${ pageMaker.cri.type }"/>'> <input
            type='hidden' name='keyword'
            value='<c:out value="${ pageMaker.cri.keyword }"/>'>


    </form>

</div>




</body>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>

</html>
