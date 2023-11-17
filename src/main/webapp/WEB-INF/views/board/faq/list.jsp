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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/faq/FAQList.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-migrate/3.4.1/jquery-migrate.min.js"></script>
    <script src="https://kit.fontawesome.com/4b84ea08f3.js" crossorigin="anonymous"></script>

    <script src="${pageContext.request.contextPath}/resources/static/js/faq/faq.js"></script>

    <link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">

    <script>
        $(function(){
          // 등록버튼 클릭시 페이지 이동
            $('#regBtn').click(function(){
                let currPage = "${pageMaker.cri.currPage}";
                console.log(currPage);
                location.href = "/board/faq/write?currPage=" + currPage;
            });
          // 삭제 버튼 클릭 시 삭제
            $(document).on('click', '#removeBtn', function(e) {
                let cnt = $("input[name='article_chk']:checked").length;
                var seq = [];
                $("input[name='article_chk']:checked").each(function() {
                    seq.push($(this).val());
                });

                if(cnt == 0){
                    alert("선택된 글이 없습니다.");
                } else{
                    if(confirm("선택한 글을 삭제하시겠습니까?")){
                        $.ajax ({
                            type: 'POST',
                            url: '/board/faq/remove',
                            traditional: true,
                            data: {
                                seq : seq
                            },
                            success: function(result){
                                console.log('result' + result);
                                alert("선택된 글이 정상적으로 삭제되었습니다.");
                                location.reload();
                            },
                            error: function(xhr, status, error) {
                                alert(error);
                            }
                        });
                    }
                }
            });

            // 페이지 클릭 이벤트 처리
            $(document).on('click', '.paging_box li a', function(e) {
                e.preventDefault();
                var selectedPageNum = $(this).text();
                console.log('selectedPageNum' + selectedPageNum);
                var category = $('.category_box ul li a.active').data('id');
                console.log(category);
                searchByCategory(category, selectedPageNum);
                // location.href="/board/faq/list?currPage=" + selectedPageNum + "&category="+category;
            });

            // 카테고리 검색 기능
            $('.category_box ul li a').click(function(e) {
                e.preventDefault();
                $('.category_box ul li a').removeClass('active');
                $(this).addClass('active');
                var category = $(this).data('id');
                var currPage = "${pageMaker.cri.currPage}";
                if (currPage == 1){
                    searchByCategory(category, currPage);
                } else {
                    searchByCategory(category, 1);
                }
            });

            // 카테고리 검색 및 페이지 로딩
            function searchByCategory(category, page) {
                // 전체를 클릭했을 경우 카테고리 값을 null로 설정
                if (category === "전체") {
                    category = null;
                }
                console.log(category);
                $.ajax({
                    type: 'GET',
                    url: '/board/faq/list',
                    data: {
                        category: category,
                        currPage: page
                    },
                    cache : false,
                    success: function(result) {
                        $('.topic_wrap').html($(result).find('.topic'));
                        $('.paging_wrap').html($(result).find('.paging_box'));
                    },
                    error: function(xhr, status, error) {
                        console.error(error);
                    }
                });
            }
        });
    </script>
</head>
<body>

<%--헤더--%>
<jsp:include page="../../layout/header.jsp"/>

<%-- 본문 --%>
<div class="container">
    <div class="title_box">
        <h2 class="title">FAQ</h2>
    </div>
    <div class="left_container box">
        <div class="menu_box block"> <!-- MENU BOX (LEFT-CONTAINER) -->
            <ul class="menu_box_menu">
                <li>
                    <a class="menu_box_tab" href="#a"><span class="icon fontawesome-envelope scnd-font-color"></span>자주 묻는 질문(FAQ)<div class="menu_box_number"></div></a>
                </li>
                <li>
                    <a class="menu_box_tab" href="#a"><span class="icon entypo-paper-plane scnd-font-color"></span>1:1 문의하기<div class="menu_box_number"></div></a>
                </li>
                <li>
                    <a class="menu_box_tab" href="#a"><span class="icon entypo-calendar scnd-font-color"></span>1:1 문의내역 조회<div class="menu_box_number"></div></a>
                </li>
            </ul>
        </div>
    </div>
    <main>
        <div class="category_wrap">
            <div class="category_box">
                <ul>
                    <li>
                        <a href="#a" data-id="" class="active">전체</a>
                    </li>
                    <li>
                        <a href="#a" data-id="카테고리1">카테고리1</a>
                    </li>
                    <li>
                        <a href="#a" data-id="카테고리2">카테고리2</a>
                    </li>
                    <li>
                        <a href="#a" data-id="카테고리3">카테고리3</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="topic_wrap">
        <input type="hidden" name="category" value="${ __BOARD__.category }">
        <c:forEach var="faqVO" items="${__LIST__}">
            <div class="topic">
                <c:if test="${not empty __AUTH__}">
                    <span class="article_chk" ><input type="checkbox" name="article_chk" value="${faqVO.seq}"></span>
                </c:if>
                <div class="open">
                    <h2 class="question">
                        <span class="cate">[${faqVO.category}]</span> ${faqVO.title}
                    </h2>
                        <c:if test="${not empty __AUTH__}">
                        <div class="modify">
                            <a href="/board/cs/faq/modify?currPage=${pageMaker.cri.currPage}&seq=${faqVO.seq}">수정</a>
                        </div>
                    </c:if>
                    <span class="faq-t"></span>
                </div>
                <p class="answer">
                    ${faqVO.content}
                </p>
            </div>
        </c:forEach>
        </div>
        <div class="paging_wrap">
            <div class="paging_box">
                <ul>
                    <c:if test="${pageMaker.prev}">
                        <li class="prev pager">
                            <a href="?currPage=${pageMaker.startPage -1}>" title="이전 페이지로 이동하기"><i class="fas fa-chevron-left"></i></a></li>
                    </c:if>

                    <c:forEach var="pageNum" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        <li>
                           <a class="${pageMaker.cri.currPage == pageNum ? 'active' : ''}">
                                ${pageNum}
                           </a>
                        </li>
                    </c:forEach>
                    <c:if test="${pageMaker.next}">
                        <li class="next pager">
                            <a href="?currPage=${pageMaker.endPage + 1}" title="다음 페이지로 이동하기"><i class="fas fa-chevron-right"></i></a></li>
                    </c:if>

                </ul>
            </div>
        </div>
        <c:if test="${not empty __AUTH__}">
            <div class="button_wrap">
                <ul class="button_box">
                    <li><button type="button" id="regBtn">등록</button></li>
                    <li><button type="button" id="removeBtn">삭제</button></li>
                </ul>
            </div>
        </c:if>
    </main>



</div>

<jsp:include page="../../layout/footer.jsp"/>
</body>
</html>
