<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String myctx=request.getContextPath(); 
%>       
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${loginMember eq null}">
<a href="<%=myctx%>/login">로그인</a><br>
<a href="<%=myctx%>/join">회원가입</a>
</c:if>
<c:if test="${loginMember ne null}">
<span>${loginMember.id}</span>
<a href="<%=myctx%>/logout">로그아웃</a>
</c:if>
</body>
</html>