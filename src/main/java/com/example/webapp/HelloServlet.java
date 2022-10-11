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
                                    "    Id INTEGER PRIMARY KEY AUTOINCREMENT,\n" +
                                    "    CategoryName NVARCHAR UNIQUE)\n" );

            statement.close();

            statement.execute(  "insert or ignore into Category (CategoryName) \n" +
                                    "values ('Action'), ('Romance') \n"
                                    );
            statement.close();




            conn.close();



        } catch (SQLException e) {
            System.out.println("Something went wrong: " + e.getMessage());
        }
    }

    public static void addCategoryToDatabase(String newcategory){

        try {
            Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\hellr\\IdeaProjects\\webapp\\identifier.sqlite");
            Statement statement = conn.createStatement();

            statement.execute(  "insert or IGNORE into Category (CategoryName) \n" +
                                    "values ('" + newcategory + "') \n"
                             );
            statement.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println("Something went wrong when adding Category to db: " + e.getMessage());
        }
    }

    public static void deleteCategoryFromDatabase(String oldcategory){

        try {
            Connection conn = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\hellr\\IdeaProjects\\webapp\\identifier.sqlite");
            Statement statement = conn.createStatement();
            String sqlString = "DELETE FROM Category WHERE CategoryName = '\" + oldcategory + \"';";
            statement.execute(sqlString);
            statement.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println("Something went wrong when deleting Category to db: " + e.getMessage());
        }
    }


    public void destroy() {
    }



}