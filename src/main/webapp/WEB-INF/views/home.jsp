<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Home</title>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/home.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>

	<link rel="shortcut icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">
	<link rel="icon" href="${pageContext.request.contextPath}/resources/static/img/logo_ico.png" type="image/x-icon">

	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
</head>


<body>
<%-- 헤더 --%>
<jsp:include page="layout/header.jsp" />

<%-- 본문 --%>
<main>
	<input type="hidden" name="user" value="${__AUTH__.email}">

	<div class="travel_list">
		<h3><strong>여행지게시판</strong></h3>
		<div class="swiper_box">
			<div class="swiper">
				<div class="swiper-wrapper">
					<c:forEach var="travel" items="${__TRAVEL_LIST__}" varStatus="status">
						<c:choose>
							<c:when test="${status.index < 10}">
								<div class="swiper-slide">
									<div class="img_box">
										<a href="#">
											<img src="${pageContext.request.contextPath}/resources/static/img/IMG_1001.JPG" alt="" class="top_img">
										</a>
									</div>
									<div class="title_box">
										<p class="title">
											<a href="#a">
												${travel.title}
											</a>
										</p>
										<p class="category">카테고리 : ${travel.category}</p>
										<p class="hit">조회수 : ${travel.total}</p>
									</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>

				</div>
			</div>
			<div class="swiper_button">
				<a href="#a" class="travel_button_prev"><i class="fas fa-chevron-left"></i></a>
				<a href="#a" class="travel_button_next"><i class="fas fa-chevron-right"></i></a>
			</div>
		</div>
		<br>
		<br>
	</div>

	<div class="review_list">
		<h3><strong>리뷰게시판</strong></h3>
		<div class="swiper_box">
			<div class="swiper">
				<div class="swiper-wrapper">
					<c:forEach var="review" items="${__REVIEW_LIST__}" varStatus="status">
						<c:choose>
							<c:when test="${status.index < 10}">
								<div class="swiper-slide">
									<div class="img_box">
										<a href="#a">
											<img src="${pageContext.request.contextPath}/resources/static/img/IMG_1000.JPG" alt="" class="top_img">
										</a>
									</div>
									<div class="title_box">
										<p class="title">
											<a href="#a">
												${review.title}
											</a>
										</p>
										<p class="category">리뷰 : ${review.content}</p>
										<p class="hit">조회수 : ${review.total}</p>
									</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>
			<div class="swiper_button">
				<a href="#a" class="review_button_prev"><i class="fas fa-chevron-left"></i></a>
				<a href="#a" class="review_button_next"><i class="fas fa-chevron-right"></i></a>
			</div>
		</div>
	</div>

	<div class="course_list">
		<h3><strong>코스게시판</strong></h3>
		<div class="swiper_box">
			<div class="swiper">
				<div class="swiper-wrapper">
					<c:forEach var="course" items="${__COURSE_LIST__}" varStatus="status">
						<c:choose>
							<c:when test="${status.index < 10}">
								<div class="swiper-slide">
									<div class="img_box">
										<a href="#a">
											<img src="${pageContext.request.contextPath}/resources/static/img/seoul_forest.png" alt="" class="top_img">
										</a>
									</div>
									<div class="title_box">
										<p class="title">
											<a href="#a">
												${course.TITLE}
											</a>
										</p>
										<p class="category">내용 : ${course.REVIEW}</p>
										<p class="hit">조회수 : ${course.TOTAL}</p>
									</div>
								</div>
							</c:when>
						</c:choose>
					</c:forEach>
				</div>
			</div>
			<div class="swiper_button">
				<a href="#a" class="course_button_prev"><i class="fas fa-chevron-left"></i></a>
				<a href="#a" class="course_button_next"><i class="fas fa-chevron-right"></i></a>
			</div>
		</div>

	</div>

</main>



<%--	<c:forEach var="course" items="${__LIST__}">--%>
<%--	<div class="course_object_size">--%>
<%--		<div class="course_object">--%>

<%--			<img src="${pageContext.request.contextPath}/resources/static/img/seoul_forest.png" alt="" class="top_img">--%>
<%--			<div class="course_top">--%>
<%--				<a href="/board/course/get?seq=${course.seq}">--%>
<%--					<strong>${course.TITLE}</strong><p> 조회수: ${course.TOTAL}</p>--%>
<%--					<ul><li>${course.REVIEW}</li></ul>--%>
<%--					<span class="user_info">--%>
<%--	                        <span class="user_img">--%>
<%--	                            <img src="${pageContext.request.contextPath}/resources/static/img/img_profile.png" alt="${course.WRITER}">--%>
<%--	                        </span>--%>
<%--	                        <em>${course.WRITER}</em>--%>
<%--	                    </span>--%>
<%--				</a>--%>
<%--				<div class="area_txt">--%>
<%--					<i class="fas fa-heart off">--%>

<%--						<input type="hidden" name="board" value="course">--%>
<%--						<input type="hidden" name="board_seq" value="${course.seq}">--%>
<%--					</i>--%>
<%--				</div>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--	</c:forEach>--%>


<%--푸터--%>
<jsp:include page="layout/footer.jsp" />
<script>
	$(document).ready(function(){
		const travelSwiper = new Swiper('.travel_list .swiper', {
			loop: false,
			slidesPerView :4,
			spaceBetween: 20,
			navigation: {
				nextEl: '.travel_button_next',
				prevEl: '.travel_button_prev',
			},
		});

		const reviewSwiper = new Swiper('.review_list .swiper', {
			loop: false,
			slidesPerView :3,
			spaceBetween: 20,
			navigation: {
				nextEl: '.course_button_next',
				prevEl: '.course_button_prev',
			},
		});

		const courseSwiper = new Swiper('.course_list .swiper', {
			loop: false,
			slidesPerView :4,
			spaceBetween: 20,
			navigation: {
				nextEl: '.course_button_next',
				prevEl: '.course_button_prev',
			},
		});
	});


</script>
</body>


</html>