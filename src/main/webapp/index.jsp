<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*,com.example.webapp.HelloServlet"%>
<!DOCTYPE html>
<html>
<head>
    <title>Consid wep app frontend</title>
</head>
<body>
<br>
Welcome to the Consid backend library webapp
<br>
<br>
<br>
<form method="POST" action="helloServlet">
    Add category: <input type="text" name="category" />
    <input type="submit" value="Add" />
</form>
<br>
<form method="POST" action="helloServlet">
    Delete category: <input type="text" name="category" />
    <input type="submit" value="Delete" />
</form>
<br>

    <%
        HelloServlet.connectionMethod();

        String name = request.getParameter("category");
    %>






</body>
</html>