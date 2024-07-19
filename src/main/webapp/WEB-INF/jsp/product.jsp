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
ArrayList<String[]> product = (ArrayList<String[]>) request.getAttribute("product");
%>

<%
ArrayList<String[]> product2 = (ArrayList<String[]>) request.getAttribute("product2");
%>


<body>
<form method="GET" action="./product">
<select name="MAKER_CODE">
<% for (String[] ss : product) { %>
		<option value="<%=ss[0]%>"> 
		<%=ss[1]%>
		<option/>
		<% } %>
</select>

<input type="submit" value="絞り込む">
</form>

<table border=1>
<% for(String[] ss : product2)  {%>	
<tr>
<td><%= ss[0] %></td>
<td><%= ss[1] %></td>
<td><%= ss[2] %></td>
</tr>
<% }  %>
</table>

</body>
</html>