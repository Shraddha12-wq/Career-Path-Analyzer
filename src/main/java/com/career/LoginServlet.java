package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email").trim();
        String password = request.getParameter("password").trim();

        // 🔴 ADMIN LOGIN
        if(email.equals("admin@gmail.com") && password.equals("admin123")){
            HttpSession session = request.getSession();
            session.setAttribute("user", "Admin");
            session.setAttribute("role", "admin");

            response.sendRedirect("admin");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=?"
            );
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                String dbPassword = rs.getString("password");

                if(password.equals(dbPassword)){

                    HttpSession session = request.getSession();
                    session.setAttribute("user", rs.getString("name"));
                    session.setAttribute("user_id", rs.getInt("id"));

                    System.out.println("✅ Login user_id: " + rs.getInt("id"));

                    response.sendRedirect("index.jsp");
                } else {
                    request.setAttribute("error", "Invalid Password!");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("error", "User not found!");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}