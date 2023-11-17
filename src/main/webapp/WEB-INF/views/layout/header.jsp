<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--<% session.removeAttribute("member_mid");--%>
<%--response.sendRedirect("../main/index.jsp"); %>--%>

<script>console.log("<%= session.getAttribute("__AUTH__") %>");</script>

<!-- 헤더 시작 -->
<div id="header">
    <div class="wrap">
        <h1 class="logo">
            <a href="/"><img id="headerLogo" src="${pageContext.request.contextPath}/resources/static/img/layout/img-logo.png" width="240" height="60"></a>
        </h1>
        <ul class="bn">
            <li class="fl"><a href="/board/travel/list">여행지</a></li>
            <li class="fl"><a href="/board/course/list">코스</a></li>
            <li class="fl"><a href="/board/review/list">리뷰</a></li>
            <li class="fl"><a href="/board/free/list">자유게시판</a></li>
        </ul>

        <ul class="bn">
            <c:if test="${sessionScope.__AUTH__ == null}">
                <li class="fr"><a href="/member/join/main">회원가입</a></li>
                <li class="fr"><a href="/member/login/main">로그인</a></li>
            </c:if>

            <c:if test="${sessionScope.__AUTH__ != null}">
                <li class="fr"><a href="/member/logout">로그아웃</a></li>
                <li class="fr"><a href="/mypage/mypage?email=${__AUTH__.email}">마이페이지</a></li>
            </c:if>
        </ul>

    </div>

</div>

<script>
    // To display sign-in result.
    var result = "${param.__RESULT__}";

    if(result != null && result.length > 0) {
        alert(result);
    } // if


</script>

<!-- 헤더 끝 -->