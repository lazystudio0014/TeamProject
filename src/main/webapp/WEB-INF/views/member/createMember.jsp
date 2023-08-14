<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <!--<meta name="viewport" content="width=device-width, initial-scale=1.0">-->

    <!-- CSS -->
    <link rel="stylesheet" href="css/createMember.css">

    <!-- CSS -->
    <link rel="stylesheet" href="css/checkBox.css">

</head>
<body>
<div id="background"></div>
<div id="form-container">
    <div id="form-inner-container">
        <!--회원 가입 폼 -->
        <div id="sign-up-container">
            <h3>회원 가입</h3>
            <form role="form" action="signUp.do" method="post">
                <label for="name">이름</label>
                <input type="text" name="name" id="name" placeholder="이름">
                <div class="error-message" id="nameError" style="color: red;"></div>

                <label for="email">이메일(ID)</label>
                <input type="email" name="email" id="email" placeholder="Email">
                <div class="error-message" id="emailError" style="color: red;"></div>

                <label for="password">비밀번호</label>
                <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요.">
                <div class="error-message" id="passwordError" style="color: red;"></div>

                <label for="phoneNumber">전화번호</label>
                <input type="text" name="phoneNumber" id="phoneNumber" placeholder="전화번호를 입력해주세요">

                <label for="gender">성별</label>
                <input type="hidden" id="gender" name="gender">
                <div class="select">
                    <input type="radio" id="man" name="radioGender" value="남성"><label for="man">남성</label>
                    <input type="radio" id="girl" name="radioGender" value="여성"><label for="girl">여성</label>
                </div>

                <label for="birthdate">생년월일</label>
                <input type="date" id="birthdate" name="birthdate">

                <label for="address">주소</label>
                <input id="address" name="address"  type="text" placeholder="주소" readonly onclick="findAddr()">
                <label for="address_Detail">상세주소</label>
                <input id="address_Detail" name="address_Detail" type="text" placeholder="상세주소">

                <div id="form-controls">
                    <button type="submit">회원가입</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(document).ready(function () {
    let emailTimeout; // 타임아웃 관리 변수

    // radio 버튼 클릭 이벤트
    $("input:radio[name=radioGender]").click(function(){
        const gender = $("input:radio[name=radioGender]:checked").val();
        document.getElementById("gender").value = gender;
    });

    // 이메일 입력 후 focusout 시 중복체크 구현
    $('#email').focusout(() => {
        clearTimeout(emailTimeout); // 이전 타임아웃을 취소

        // 입력된 값이 있는 경우에만 타임아웃 설정
        if ($('#email').val().trim() !== '') {
            emailTimeout = setTimeout(() => { // 새로운 타임아웃 설정
                const email = $('#email').val();
                $.ajax({
                    url: '/checkEmail.do',
                    type: 'POST',
                    data: { email: email },
                    success: function (result) {
                        const emailErrorElement = $('#emailError');
                        if (result === 'true') {
                            emailErrorElement.text('중복된 이메일입니다.').show();
                        } else {
                            emailErrorElement.text('').hide();
                        }
                    },
                    error: function (error) {
                        console.log(error);
                    }
                });
            }, 300); // 예: 300ms 내에 새로운 타임아웃이 설정되지 않으면 AJAX 요청이 실행됨
        }
    });

    //이름 정규식
    const nameRegex = /^[가-힣]{2,4}$/;

    $('#name').blur(function() {
        const name = $(this).val();
        const nameErrorElement = $('#nameError');

        if (!nameRegex.test(name)) {
            nameErrorElement.text('2~4자의 한글만 입력 가능합니다.').show();
        } else {
            nameErrorElement.text('').hide();
        }
    });

    //비밀번호 정규식
    const passwordRegex = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/;

    $('#password').blur(function() {
        const password = $(this).val();
        const passwordErrorElement = $('#passwordError');

        if (!passwordRegex.test(password)) {
            passwordErrorElement.text('소,대문자,숫자,특수문자 포함 8자이상').show();
        } else {
            passwordErrorElement.text('').hide();
        }
    });
});
<!--다음 API 활용 주소 검색-->
function findAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
            document.getElementById("address").value =  data.address;
        }
    }).open();
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>