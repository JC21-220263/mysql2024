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
	ArrayList<String[]> result=
		(ArrayList<String[]>) request.getAttribute("result");
%>


<body>
<table border=1>
<% for(String[] ss : result)  {%>
<tr>
<td><%= ss[1] %></td>
<td><%= ss[0] %></td>
<td><%= ss[2] %></td>
</tr>
<% }  %>
</table>


</body>
</html>