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


  int CategoryId = Integer.parseInt(request.getParameter("CategoryId"));
  String Title = request.getParameter("Title");
  String Author = request.getParameter("Author");
  int Pages = Integer.parseInt(request.getParameter("Pages"));
  String Borrower = request.getParameter("Borrower");
  String BorrowDate = request.getParameter("BorrowDate");
  String Type = request.getParameter("Type");
  //System.out.println(name);
  HelloServlet.addBookToDatabase(CategoryId, Title, Author, Pages, 1, Borrower, BorrowDate, "Book");


%>
</body>
</html>
