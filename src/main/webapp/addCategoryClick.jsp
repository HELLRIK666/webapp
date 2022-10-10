<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*,com.example.webapp.HelloServlet"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%


    String name = request.getParameter("category");
    System.out.println(name);
    HelloServlet.addCategoryToDatabase(name);

%>
</body>
</html>
