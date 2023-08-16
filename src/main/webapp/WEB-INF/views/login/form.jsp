<%@ page contentType="text/html;charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<meta charset="utf-8">
<script src="/js/trim.js"></script>
<script language="javascript">
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
<title>J-Story Login Session</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">

<style>
body,h1 {font-family: "Raleway", sans-serif}
body, html {height: 100%}
.bgimg {
  background-image: url('/night.jpg');
  min-height: 100%;
  background-position: center;
  background-size: cover;
}
</style>
</head>
<body>

<div class="bgimg w3-display-container w3-animate-opacity w3-text-white">
  <div class="w3-display-topleft w3-padding-large w3-">
    KOSMO
  </div>
  <div class="w3-display-middle">
    <div class="flex min-h-full flex-col justify-center px-6 py-50 lg:px-8">
        <div class="sm:mx-auto sm:w-full sm:max-w-sm">

          <h2 class="mt-10 text-center text-2x5 font-bold leading-9 tracking-tight text-gray-900">J-Story Member Login Session</h2>
        </div>

        <div class="mt-10 sm:mx-auto sm:w-full sm:max-w-m">
          <form class="space-y-6" action="login.do" method="POST">
            <div>
              <label for="email" class="block w3-text-light-blue font-medium leading-6 text-gray-900">Email address</label>
              <div class="mt-2">
                <input id="email" name="email" type="email" autocomplete="email" required class="block w3-table-all sm:text-sm sm:leading-6">
              </div>
            </div>
            &nbsp;
            <div>
              <label for="password" class="block w3-text-light-blue font-medium leading-6 text-gray-900">password</label>
              <div class="mt-2">
                <input id="password" name="password" type="password" autocomplete="password" required class="block w3-table-all sm:text-sm sm:leading-6">
              </div>
            </div>
            <!--
            <div>
              <div class="flex items-center justify-between">
                <label for="password" class="block w3-text-light-blue font-medium leading-6 text-gray-900">Password</label>
                <div class="text-sm">

                </div>
              </div>
              <div class="mt-2">
                <input id="password" name="pwd" type="password" autocomplete="current-password" required class="block w3-table-all rounded-md -border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
              </div>
            </div>
            -->
            &nbsp;
            <div>
              &nbsp;&nbsp;&nbsp &nbsp;&nbsp;&nbsp;&nbsp;&nbsp &nbsp;&nbsp;&nbsp;&nbsp;&nbsp
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" class="font-semibold text-indigo-600 hover:text-indigo-500">회원가입</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp &nbsp;&nbsp;&nbsp;&nbsp;&nbsp &nbsp;&nbsp;&nbsp;&nbsp;&nbsp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <button type="submit" class="flex w-full justify-center rounded-md bg-indigo-600 px-3 py-1.5 text-sm font-semibold leading-6 text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">로그인</button>
            </div>
          </form>

          </p>
        </div>
      </div>
    <hr class="w3-border-grey" style="margin:auto;width:100%">

  </div>
  <div class="w3-display-bottomleft w3-padding-Large">

   &nbsp;&nbsp;&nbsp; Powered by <a href="https://naver.com" target="_blank">Triple Jack</a>

  </div>
</div>

</body>
</html>