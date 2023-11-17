<%--
  Created by IntelliJ IDEA.
  User: sungjaehyun
  Date: 2023/05/15
  Time: 7:07 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>여행지 modify</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/travel/write.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/static/css/layout/layout.css"/>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">

  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

  <script>
    $(function() {
      $('.cancelBtn').click(function () {

        <%--location.href = "/board/travel/list?currPage=${param.currPage}";--%>
        location.href = "/board/travel/list";

      });
    })

  </script>

  <jsp:include page="../../layout/header.jsp"/>
</head>
<body>
<form action="modify" method="post">
  <input type="hidden" name="seq" value="${ __BOARD__.seq }">
  <!-- 글쓰기 헤더 -->
  <div class="travel_header">
    <h2>여행지 글쓰기</h2>
  </div>
  <hr>
  <!-- 제목 -->
  <div class="travel_title">
    <input type="text" name="title" value="${__BOARD__.title}" placeholder=" 장소명을 입력해 주세요." autofocus required>
  </div>

  <!-- 카테고리 -->
  <div class="travel_category">
    <h3>카테고리</h3>
  </div>
  <hr>
  <div class="travel_thema">

    <label for="travelplace"><input type="radio" id="travelplace" value="야외활동" name="category" onclick="category_val()"><span>야외활동</span></label>
    ｜
    <label for="show"><input type="radio" id="show" value="공연" name="category" onclick="category_val()"><span>공연</span></label>
    ｜
    <label for="exhibition"><input type="radio" id="exhibition" value="전시회" name="category" onclick="category_val()"><span>전시회</span></label>
    ｜
    <label for="popup"><input type="radio" id="popup" value="팝업스토어" name="category" onclick="category_val()"><span>팝업스토어</span></label>
  </div>

  <!-- 캘린더 내용 -->
  <div class="cal">
    <h3>일정</h3>
  </div>
  <hr>
  <div class="cal_input">
    <div class="cal_date_input">
      <label for="start_date_input"> 시작일자 </label>
      <input type=text id="start_date_input" name="start_date" autocomplete="off" value="${__BOARD__.start_date}">
      <br>
      <label for="end_date_input"> 종료일자 </label>
      <input type="text" id="end_date_input" name="end_date" autocomplete="off" value="${__BOARD__.end_date}">
      <br>
    </div>
    <div class="cal_time_input">
      <label> 시작시간 </label>
      <input type="time" id="start_time_input" name="start_time" value="${__BOARD__.start_time}">
      <br>
      <label> 종료시간 </label>
      <input type="time" id="end_time_input" name="end_time" value="${__BOARD__.end_time}">
      <br>
    </div>
  </div>

  <!-- 본문 -->
  <div class="content">
    <textarea name="content" placeholder="내용을 입력해주세요." required>${__BOARD__.content}</textarea>
  </div>

  <!-- 위치 -->
  <div class="loc">
    <h3>위치</h3>
  </div>
  <hr>
  <br>
  <div class="location">
    <input type="text" id="loc_num"  placeholder=" 우편번호">
    <button type="button" class="loc_btn" onclick="loc_btn()">주소 검색</button>
    <br>
    <input type="text" id="loc_road" name="address"  value="${__BOARD__.address}" placeholder=" 도로명 주소" required>
    <input type="text" id="loc_detail" placeholder=" 상세 주소">
  </div>

  <!-- 첨부파일 -->
  <div class="picture">
    <h3>사진</h3>
  </div>
  <hr>
  <br>
  <div class="file_upload">
    <div>
      <button class="upload"></button>
      <input type="file" class="real-upload" accept="image/*" style="display: none;" multiple>
      <ul class="image-preview">
      </ul>
    </div>
  </div>

  <!-- 버튼 -->
  <div class="btn">
    <div class="btn_accent">
      <a href="#" onclick=""><button type="submit" onclick="submitBtn">작성하기</button></a>
    </div>
    <div class="btn_cancel">
      <a href="#" onclick=""><button class="cancelBtn">취소</button></a>
    </div>
  </div>
</form>

<%-- 카테고리 스크립트 --%>
<script>
  function category_val() {
    let radioButtons = document.querySelectorAll('input[type="radio"]');
    let checkedValue;

    radioButtons.forEach(radioButton => {
      if(radioButton.checked) {
        checkedValue = radioButton.value;
      }
    });
    console.log('cheked : ', checkedValue);

  }
</script>

<%-- 캘린더 스크립트 --%>
<script>
  $( function() {
    var dateFormat = "yy-mm-dd",
            from = $("#start_date_input").datepicker({
              defaultDate: "+1w",
              changeMonth: true,
              dayNames: ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
              dayNamesMin: ["월", "화", "수", "목","금", "토", "일"],
              monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
              monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
              dateFormat: "yy/mm/dd",
            })
                    .on( "change", function() {
                      to.datepicker( "option", "minDate", getDate( this ) );
                    }),
            to = $("#end_date_input").datepicker({
              defaultDate: "+1w",
              changeMonth: true,
              dayNames: ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일"],
              dayNamesMin: ["월", "화", "수", "목","금", "토", "일"],
              monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
              monthNamesShort: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
              dateFormat: "yy/mm/dd",
            })
                    .on( "change", function() {
                      from.datepicker( "option", "maxDate", getDate( this ) );
                    });
    $('#start_date_input').datepicker();
    $('#start_date_input').datepicker("option", "maxDate", $("#end_date_input").val());
    $('#start_date_input').datepicker("option", "onClose", function ( selectedDate ) {
      $("#end_date_input").datepicker( "option", "minDate", selectedDate );
    });

    $('#end_date_input').datepicker();
    $('#end_date_input').datepicker("option", "minDate", $("#start_date_input").val());
    $('#end_date_input').datepicker("option", "onClose", function ( selectedDate ) {
      $("#start_date_input").datepicker( "option", "maxDate", selectedDate );
    });

    function getDate( element ) {
      var date;
      try {
        date = $.datepicker.parseDate( dateFormat, element.value );
      } catch( error ) {
        date = null;
      }

      return date;
    }
  } );
</script>

<%--주소 찾기 api 스크립트--%>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
  //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
  function loc_btn() {
    new daum.Postcode({
      oncomplete: function(data) {
        // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

        // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
        var roadAddr = data.roadAddress; // 도로명 주소 변수
        var extraRoadAddr = ''; // 참고 항목 변수

        // 법정동명이 있을 경우 추가한다. (법정리는 제외)
        // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
        if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
          extraRoadAddr += data.bname;
        }
        // 건물명이 있고, 공동주택일 경우 추가한다.
        if(data.buildingName !== '' && data.apartment === 'Y'){
          extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
        }
        // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
        if(extraRoadAddr !== ''){
          extraRoadAddr = ' (' + extraRoadAddr + ')';
        }

        // 우편번호와 주소 정보를 해당 필드에 넣는다.
        document.getElementById('loc_num').value = data.zonecode;
        document.getElementById("loc_road").value = roadAddr;

        // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
        if(roadAddr !== ''){
          document.getElementById("sample4_extraAddress").value = extraRoadAddr;
        } else {
          document.getElementById("sample4_extraAddress").value = '';
        }

        var guideTextBox = document.getElementById("guide");
        // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
        if(data.autoRoadAddress) {
          var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
          guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
          guideTextBox.style.display = 'block';

        } else if(data.autoJibunAddress) {
          var expJibunAddr = data.autoJibunAddress;
          guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
          guideTextBox.style.display = 'block';
        } else {
          guideTextBox.innerHTML = '';
          guideTextBox.style.display = 'none';
        }
      }
    }).open();
  }
</script>

<%--사진 미리보기 및 업로드 스크립트--%>
<script>

  function getImageFiles(e) {
    const uploadFiles = [];
    const files = e.currentTarget.files;
    const imagePreview = document.querySelector('.image-preview');
    const docFrag = new DocumentFragment();


    // 업로드 파일 수가 여러장 이상인 경우 경고 메시지 출력
    if ([...files].length > 1) {
      alert('이미지는 한개씩 업로드 가능합니다.');
      return;
    }

    // 업로드 파일 중 이미지 파일이 아닌 경우 경고 메시지 출력
    for (let i = 0; i < files.length; i++) {
      if (!files[i].type.match("image/.*")) {
        alert('이미지 파일만 업로드 가능합니다.');
        return;
      }
    }

    for (let i = 0; i < files.length; i++) {
      // 업로드 파일 수가 1장 이하인 경우에만 파일 추가
      if (uploadFiles.length < 1) {
        uploadFiles.push(files[i]);
        const reader = new FileReader();
        reader.onload = (e) => {
          const preview = createElement(e, files[i]);
          imagePreview.appendChild(preview);
        };
        reader.readAsDataURL(files[i]);
      }
    }
  }

  function createElement(e, file) {
    const li = document.createElement('li');
    const img = document.createElement('img');
    img.setAttribute('src', e.target.result);
    img.setAttribute('data-file', file.name);
    li.appendChild(img);
    return li;
  }

  const realUpload = document.querySelector('.real-upload');
  const upload = document.querySelector('.upload');



  upload.addEventListener('click', () => realUpload.click());

  realUpload.addEventListener('change', getImageFiles);
</script>



</body>
<jsp:include page="/WEB-INF/views/layout/footer.jsp"/>
</html>