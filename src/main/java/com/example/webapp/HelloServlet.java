package com.example.webapp;

import java.io.*;
import java.sql.*;
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

            statement.execute(  "CREATE TABLE IF NOT EXISTS Category (\n" +
                                    "    Id INT NOT NULL,\n" +
                                    "    CategoryName NVARCHAR,\n" +
                                    "    PRIMARY KEY (Id))\n" );
            statement.close();

            statement.execute(  "insert into Category (Id, CategoryName) \n" +
                                    "values (1,'Action'), (2, 'Romance') \n"
                                    );
            statement.close();




            conn.close();



        } catch (SQLException e) {
            System.out.println("Something went wrong: " + e.getMessage());
        }
    }

    public static <statement> void addCategoryToDatabase(String newcategory){

        try {
            Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\hellr\\IdeaProjects\\webapp\\identifier.sqlite");
            Statement statement = conn.createStatement();

            statement.execute(  "insert into Category (Id, CategoryName) \n" +
                                    "values (3," + newcategory + "); \n"
                             );
            statement.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println("Something went wrong when adding Category to db: " + e.getMessage());
        }
    }


    public void destroy() {
    }



}