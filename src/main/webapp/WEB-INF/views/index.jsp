<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <style>
        a{text-decoration:none}
    </style>
    <link rel="stylesheet" href="/main.css"/>
    <body style="text-align:center">
         <c:choose>
         <c:when test="${empty loginOkUser}">
            <a href = "login/form.do">로그인</a>
         </c:when>
         <c:otherwise>
               <font style="color:blue">${loginOkUser.name}</font>님..어서오세요<br/>
               <a href="login/logout.do">로그아웃</a>
         </c:otherwise>
         </c:choose>
    </body>
</html>