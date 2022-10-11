<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*,com.example.webapp.HelloServlet"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>

<html>
<head>
  <title>Title</title>
  <meta http-equiv="refresh" content="0; URL=index.jsp" />
</head>
<body>
<%


  String name = request.getParameter("delete");
  //System.out.println(name);
  HelloServlet.deleteCategoryFromDatabase(name);


%>
</body>
</html>