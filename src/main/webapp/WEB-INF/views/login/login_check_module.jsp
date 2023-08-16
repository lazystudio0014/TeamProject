<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:if test="${empty loginOkUser}">
    <script>
        alert("회원서비스입니다. 먼저 로그인을 하고 이용해 주세요~");
        location.href="../form.do";
    </script>
</c:if>
