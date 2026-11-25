package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin_contact")
public class AdminContactServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 🔒 ADMIN CHECK
        if(session.getAttribute("role") == null || 
           !session.getAttribute("role").equals("admin")){
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String,String>> contacts = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(
                "SELECT * FROM contact_messages ORDER BY id DESC"
            );

            while(rs.next()){
                Map<String,String> row = new HashMap<>();
                row.put("id", rs.getString("id"));
                row.put("name", rs.getString("name"));
                row.put("email", rs.getString("email"));
                row.put("message", rs.getString("message"));
                row.put("date", rs.getString("created_at"));

                contacts.add(row);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        request.setAttribute("contacts", contacts);
        request.getRequestDispatcher("admin_contact.jsp").forward(request, response);
    }
}