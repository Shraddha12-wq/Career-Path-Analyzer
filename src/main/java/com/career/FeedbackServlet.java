package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/feedback")
public class FeedbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if(session.getAttribute("user_id") == null){
            response.sendRedirect("login.jsp");
            return;
        }

        int user_id = (int) session.getAttribute("user_id");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO feedback(user_id,rating,comment) VALUES(?,?,?)"
            );

            ps.setInt(1, user_id);
            ps.setInt(2, rating);
            ps.setString(3, comment);

            ps.executeUpdate();
            ps.close();

            request.setAttribute("success", "Thanks for your feedback!");
            request.getRequestDispatcher("feedback.jsp").forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}