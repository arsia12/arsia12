<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Review</title>
</head>
<body>
	<table>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>글쓴이</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="item" items="${list}">
		<tr>
			<td>${item.idx}</td>
			<td>${item.subject}</td>
			<td>${item.id}</td>
			<td>${item.wdate}</td>
			<td>${item.readnum}</td>
		</tr>
		</c:forEach>
	</table>
	<a href="">글쓰기</a>
</body>
</html>