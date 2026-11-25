package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin_users")
public class UsersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 🔒 ADMIN CHECK
        if(session.getAttribute("role") == null || 
           !session.getAttribute("role").equals("admin")){
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String,String>> users = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            // 🗑 DELETE USER
            String deleteId = request.getParameter("delete");
            if(deleteId != null){
                PreparedStatement ps = con.prepareStatement(
                    "DELETE FROM users WHERE id=?"
                );
                ps.setInt(1, Integer.parseInt(deleteId));
                ps.executeUpdate();
            }

            // 📥 FETCH USERS
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM users");

            while(rs.next()){
                Map<String,String> u = new HashMap<>();
                u.put("id", rs.getString("id"));
                u.put("name", rs.getString("name"));
                u.put("email", rs.getString("email"));
                users.add(u);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        // 📤 SEND TO JSP
        request.setAttribute("users", users);
        request.getRequestDispatcher("admin_users.jsp").forward(request, response);
    }
}