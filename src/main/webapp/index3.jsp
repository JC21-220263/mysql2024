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
<select name="ITEM_NO">
<% for (String[] ss : result) { %>
		<option value="<%=ss[1]%>"> 
		<%=ss[0]%>
		<option/>     							<%--　　<% %>はJavaの世界	　	配列resultの数分ssに格納 　　--%>
<% } %>
</select>

</body>
</html>