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

    <%
        HelloServlet.connectionMethod();
    %>
<br><br>
Here come the list of current categories:
<br><br>
    <%
        Connection conn =
                DriverManager.getConnection("jdbc:sqlite:C:\\Users\\hellr\\IdeaProjects\\webapp\\identifier.sqlite");
        Statement stat = conn.createStatement();
        ResultSet rs = stat.executeQuery("select distinct CategoryName from Category;");


        while (rs.next()) {
            out.println("<tr>");
            //out.println("<td>" + rs.getString("Id") + "</td>");
            out.println("<td>" + rs.getString("CategoryName") + "</td>");
            out.println("<br>");
            out.println("</tr>");
        }

        rs.close();
        conn.close();
    %>






</body>
</html>