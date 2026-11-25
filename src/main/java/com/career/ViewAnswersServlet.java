package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewAnswers")
public class ViewAnswersServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String questionId = request.getParameter("question_id");

        ArrayList<String[]> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps;

            String query =
                "SELECT ua.id, u.name, ua.question_id, " +
                "ua.selected_answer, ua.created_at " +
                "FROM user_answers ua " +
                "JOIN users u ON ua.user_id=u.id ";

            // QUESTION ID FILTER
            if(questionId != null &&
               !questionId.isEmpty()){

                query += "WHERE ua.question_id=? " +
                         "ORDER BY ua.id DESC";

                ps = con.prepareStatement(query);

                ps.setString(1, questionId);

            } else {

                query += "ORDER BY ua.id DESC";

                ps = con.prepareStatement(query);
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                list.add(new String[]{

                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("question_id"),
                    rs.getString("selected_answer"),
                    rs.getString("created_at")

                });
            }

            request.setAttribute("data", list);

            request.getRequestDispatcher("answersReport.jsp")
                   .forward(request, response);

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}