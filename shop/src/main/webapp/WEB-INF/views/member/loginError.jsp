<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<!-- isErrorPage="true" 값을 지정하자. -->

<%
	response.setStatus(response.SC_OK);
%>
<script type="text/javascript">
	alert('<%=exception.getMessage()%>');
	location.href="${pageContext.request.contextPath}/login";	

</script> 