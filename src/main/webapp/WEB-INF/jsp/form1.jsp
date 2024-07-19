<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JK3B05</title>
</head>

<%
ArrayList<String[]> result = (ArrayList<String[]>) request.getAttribute("result");
%>


<body>
<form method="GET" action="./result1">
<select name="ID">
<% for (String[] ss : result) { %>
		<option value="<%=ss[1]%>"> 
		<%=ss[0]%>
		<option/>
		<% } %>
</select>

<input type="submit" value="絞り込む">
</form>
</body>
</html>