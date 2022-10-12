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


  String nameold = request.getParameter("orgcat");
  String namenew = request.getParameter("editedcat");
  System.out.println(nameold);
  System.out.println(namenew);
  HelloServlet.editCategoryFromDatabase(nameold, namenew);


%>
</body>
</html>
