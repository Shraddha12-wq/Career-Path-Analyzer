package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewFeedback")
public class ViewFeedbackServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String rating = request.getParameter("rating");

        ArrayList<String[]> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps;

            // ⭐ RATING FILTER
            if(rating != null && !rating.isEmpty()){

                ps = con.prepareStatement(
                    "SELECT * FROM feedback WHERE rating=? ORDER BY id DESC"
                );

                ps.setString(1, rating);

            } else {

                ps = con.prepareStatement(
                    "SELECT * FROM feedback ORDER BY id DESC"
                );
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                list.add(new String[]{

                    rs.getString("id"),
                    rs.getString("user_id"),
                    rs.getString("rating"),
                    rs.getString("comment"),
                    rs.getString("created_at")

                });
            }

            request.setAttribute("data", list);

            request.getRequestDispatcher("feedbackReport.jsp")
                   .forward(request, response);

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}