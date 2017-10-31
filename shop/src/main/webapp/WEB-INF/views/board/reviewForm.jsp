<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
</head>
<body>
	<form method="post" action="reviewInsert" name="rbf"  enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="${loginMember.id}">
		<input type="hidden" id="midx" name="midx" value="${loginMember.midx}">
		<label for="subject">제목</label>
		<input type="text" id="subject" name="subject"><br>
		<textarea id="content" name="content" rows="10" cols="50"></textarea><br>
		<input type="file" id="filename1" name="filename1" accept="image/gif, image/jpeg, image/png" value="첨부파일"><br>
		<input type="file" id="filename2" name="filename2" accept="image/gif, image/jpeg, image/png" value="첨부파일"><br>
		<input type="file" id="filename3" name="filename3" accept="image/gif, image/jpeg, image/png" value="첨부파일"><br>
		<input type="file" id="filename4" name="filename4" accept="image/gif, image/jpeg, image/png" value="첨부파일"><br> 
		<button type="button">작성완료</button>
	</form>
</body>
</html>