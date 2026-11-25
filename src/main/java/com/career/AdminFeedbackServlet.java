package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin_feedback")
public class AdminFeedbackServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 🔒 ADMIN CHECK
        if(session.getAttribute("role") == null ||
           !session.getAttribute("role").equals("admin")){
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String,String>> feedbacks = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            Statement st = con.createStatement();

            ResultSet rs = st.executeQuery(
                "SELECT f.*, u.name FROM feedback f JOIN users u ON f.user_id=u.id ORDER BY f.id DESC"
            );

            while(rs.next()){
                Map<String,String> row = new HashMap<>();

                row.put("name", rs.getString("name"));

                // ✅ FIXED (column name is comment)
                row.put("message", rs.getString("comment"));

                row.put("rating", rs.getString("rating"));

                // optional (not used in UI but useful)
                row.put("date", rs.getString("created_at"));

                feedbacks.add(row);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        request.setAttribute("feedbacks", feedbacks);

        request.getRequestDispatcher("admin_feedback.jsp")
               .forward(request, response);
    }
}