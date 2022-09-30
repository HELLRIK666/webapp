<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.util.*,com.example.webapp.HelloServlet"%>
<!DOCTYPE html>
<html>
<head>
    <title>Consid wep app frontend</title>
</head>
<body>
<form method="POST" action="helloServlet">
    Name: <input type="text" name="name" />
    <input type="submit" value="Add" />
</form>


    <%
        HelloServlet.connectionMethod();
        /*
        Class.forName("org.sqlite.JDBC");
        Connection conn =
                DriverManager.getConnection("jdbc:sqlite:c:\\...\\webshop.db");
        Statement stat = conn.createStatement();

        ResultSet rs = stat.executeQuery("select * from products;");

        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getString("id") + "</td>");
            out.println("<td>" + rs.getString("title") + "</td>");
            out.println("<td>" + rs.getString("price") + " kr.</td>");
            out.println("<td>" + rs.getString("description") + "</td>");
            out.println("</tr>");
        }

        rs.close();
        conn.close(); */
    %>






</body>
</html>