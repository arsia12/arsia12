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
		<input type="text" id="id" name="id" placeholder="���̵�"><br>
		<input type="password" id="pwd" name="pwd" placeholder="��й�ȣ"><br>
		<input type="button" id="loginBtn" onclick="login()" value="�α���">
	</form>
<script type="text/javascript">
	var login=function(){
		if(!lf.id.value){
			alert('���̵� �Է����ּ���');
			lf.id.foucs();
			return;
		}
		if(!lf.pwd.value){
			alert('��й�ȣ�� �Է����ּ���');
			lf.pwd.focus();
			return; 
		}
		lf.submit();
	}
</script>
</body>
</html>