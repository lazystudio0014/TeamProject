<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html xmlns:th="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- CSS -->
    <link rel="stylesheet" href="css/createMember.css">

    <!-- CSS -->
    <link rel="stylesheet" href="css/checkBox.css">

</head>
<body>

<div id="form-container">
    <div id="form-inner-container">
        <!--회원 가입 폼 -->
        <div id="sign-up-container">
            <h3>회원 가입</h3>
            <form role="form" action="../members/signUp" method="post">
                <label for="name">이름</label>
                <input type="text" name="name" id="name" placeholder="이름">

                <label for="email">이메일(ID)</label>
                <input type="email" name="email" id="email" placeholder="Email">

                <label for="password">비밀번호</label>
                <input type="password" name="password" id="password" placeholder="비밀번호를 입력해주세요.">

                <label for="phoneNumber">전화번호</label>
                <input type="text" name="phoneNumber" id="phoneNumber" placeholder="전화번호를 입력해주세요">

                <label for="address">주소</label>
                <input id="address" name="address"  type="text" placeholder="주소" readonly onclick="findAddr()">
                <label for="address_Detail">상세주소</label>
                <input id="address_Detail" name="address_Detail" type="text" placeholder="상세주소">

                <label for="gender">성별</label>
                <input type="hidden" id="gender" name="gender">
                <div class="select">
                    <input type="radio" id="man" name="radioGender" value="남성"><label for="man">남성</label>
                    <input type="radio" id="girl" name="radioGender" value="여성"><label for="girl">여성</label>
                </div>

                <label for="birthdate">생년월일</label>
                <input type="date" id="birthdate" name="birthdate">

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
    //radio 버튼 클릭 이벤트
    $("input:radio[name=radioGender]").click(function(){
        const gender = $("input:radio[name=radioGender]:checked").val();
        document.getElementById("gender").value =  gender;
    });
});
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