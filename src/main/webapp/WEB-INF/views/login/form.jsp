<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="utf-8">
<script src="/trim.js"></script>
<script language="javascript">
    function check(){
		var idval = f.email.value;
		idval = trim(idval);
		if(idval.length == 0){
			alert("아이디를 넣어주세요");
			f.email.value = "";
			f.email.focus();
			return false;
		}else{
			pass = checkByteLen(idval, 50);
			if(!pass){
				alert("아이디가 너무 길어요");
				f.email.focus();
				return false;
			}
		}
		var pwdval = f.pwd.value;
		pwdval = trim(pwdval);
		if(pwdval.length == 0){
			alert("비번을 넣어주세요");
			f.pwd.value = "";
			f.pwd.focus();
			return false;
		}else{
			pass = checkByteLen(pwdval, 30);
			if(!pass){
				alert("비번이 너무 길어요");
				f.pwd.focus();
				return false;
			}
		}

		f.submit();
	}

    function checkByteLen(str, size){
        var byteLen = getByteLen(str);
		if(byteLen <= size){
			return true;
		}else{
			return false;
		}
	}
	function getByteLen(str){
	   return str.replace(/[\0-\x7f]|([0-\u07ff]|(.))/g,"$&$1$2").length;
    }

	function enterCheck(elm){
		if(event.keyCode == 13){
			if(elm == f.email){
				f.pwd.focus();
			}else{
				check();
			}
		}
	}
</script>
<!DOCTYPE html>
<html>
<head>
<h3><p style="color:white">KOSMO</p></h3>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
</head>
<style>
    .center-table {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        border: none;
    }

    table, th, td {
       border: 1px solid transparent;
       border-collapse: collapse;
    }
    th, td {
       padding: 5px;
    }
    a { text-decoration:none; }

</style>
<body>
 <body onload="document.f.email.focus()">
<body style="background-image:url('../night.jpg')">
<div class="center-table">

<center>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <form name="f" action="login.do" method="post">
       <table border="hidden" width="300" height="200" "margin-left:auto;margin-right:auto;">
	      <tr>
		     <td width="30%" colspan="2" align="center"><h1><p style="color:white">J-Story Member Login Session</p></h1></td>
		  </tr>
		  <tr>
		     <th width="30%"><p style="color:white">아이디(Email)</p></th>
			 <td><input name="email" align="center" size="20" align="center" onkeydown="enterCheck(this)"></td>
		  </tr>
		  <tr>
		     <th width="30%"><p style="color:white">Password</p></th>
			 <td><input name="pwd" size="20" align="center" type="password" onkeydown="enterCheck(this)"></td>
		  </tr>
		  <tr>
		     <td colspan="2" align="center">
			     <input type="button" value="전송" onclick="check()"/>
				 <input type="reset" value="취소"/>
			 </td>
		  </tr>
	   </table>
   </form>
</center>
</div>
</body>