<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Insert title here</title>
</head>
<body>
	<form method="POST" action="loginEnd" name="lf">
		<input type="text" id="id" name="id" placeholder="아이디"><br>
		<input type="password" id="pwd" name="pwd" placeholder="비밀번호"><br>
		<input type="button" id="loginBtn" onclick="login()" value="로그인">
	</form>
<script type="text/javascript">
	var login=function(){
		if(!lf.id.value){
			alert('아이디를 입력해주세요');
			lf.id.foucs();
			return;
		}
		if(!lf.pwd.value){
			alert('비밀번호를 입력해주세요');
			lf.pwd.focus();
			return; 
		}
		lf.submit();
	}
</script>
</body>
</html>