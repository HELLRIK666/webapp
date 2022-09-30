package com.example.webapp;

import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Henriks magiska webapp!!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");


    }

    public static void connectionMethod(){
        try {
            Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\hellr\\IdeaProjects\\webapp\\identifier.sqlite");
            Statement statement = conn.createStatement();
            System.out.println("<html><body>");
            System.out.println("<h1>" + "Connection established!!" + "</h1>");
            System.out.println("</body></html>");

            statement.execute(  "CREATE TABLE Category (\n" +
                                    "    Id INT NOT NULL,\n" +
                                    "    CategoryName NVARCHAR,\n" +
                                    "    PRIMARY KEY (ID)\n" +
                                    ");");

            statement.close();
            conn.close();



        } catch (SQLException e) {
            System.out.println("Something went wrong: " + e.getMessage());
        }
    }




    public void destroy() {
    }



}