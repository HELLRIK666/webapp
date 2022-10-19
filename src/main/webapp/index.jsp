<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*,com.example.webapp.HelloServlet"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.sqlite.*" %>
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
<form method="POST" action="addCategoryClick.jsp">
    Add category: <input type="text" name="category" />
    <input type="submit" value="Add" />
</form>
<br>
<form method="POST" action="deleteCategoryClick.jsp">
    Delete category: <input type="text" name="delete" />
    <input type="submit" value="Delete" />
</form>
<br>
<p>Here you can edit an already existing category: </p>
<br>
<form method="POST" action="editCategoryClick.jsp">
    <label for="old">Category up for editing: </label>
    <input type="text" id="old" name="orgcat" >
    <label for="new">New value for that category: </label>
    <input type="text" id="new" name="editedcat" >
    <input type="submit" value="Edit">
</form>

<br>
<p>Here you can add a book to the library items: </p>
<br>
<form method="POST" action="addBookClick.jsp">
    <label for="Categoryid">Category number: </label>
    <input type="number" id="Categoryid" name="CategoryId" >

    <label for="titel">Title : </label>
    <input type="text" id="titel" name="Title" >

    <label for="pages">Pages : </label>
    <input type="number" id="pages" name="Pages" >

    <input type="submit" value="addBook">
</form>






    <%
        HelloServlet.connectionMethod();
    %>
<br><br>
Here comes the list of current categories:
<br><br>
    <%
        Connection conn =
                DriverManager.getConnection("jdbc:sqlite:C:\\Users\\hellr\\IdeaProjects\\webapp\\identifier.sqlite");
        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery("select distinct CategoryName from Category ORDER BY Id;");


        while (rs.next()) {
            out.println("<tr>");
            //out.println("<td>" + rs.getString("Id") + "</td>");
            out.println("<td>" + rs.getString("CategoryName") + "</td>");
            out.println("<br>");
            out.println("</tr>");
        }

        rs.close();

    %>

<br><br>
Here comes the list of library items:
<br><br>
    <%

        ResultSet rsl = stat.executeQuery("select * from LibraryItem;");


        while (rsl.next()) {
            out.println("<tr>");
            out.println("<td>" + rsl.getString("Id") + "</td>");
            out.println("<td>" + rsl.getString("Title") + "</td>");
            out.println("<br>");
            out.println("</tr>");
        }

        rsl.close();
        conn.close();
    %>







</body>
</html>