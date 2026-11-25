package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/intermediateQuestions")
public class IntermediateQuestionsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT * FROM intermediate_questions");

            ResultSet rs = ps.executeQuery();

            List<Question> questions =
                    new ArrayList<>();

            while(rs.next()) {

                Question q =
                        new Question();

                q.setId(rs.getInt("id"));
                q.setQuestion(rs.getString("question"));
                q.setOption1(rs.getString("option1"));
                q.setOption2(rs.getString("option2"));
                q.setOption3(rs.getString("option3"));
                q.setOption4(rs.getString("option4"));

                questions.add(q);
            }

            request.setAttribute(
                    "questions",
                    questions);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                    "intermediateQuestions.jsp");

            rd.forward(request,response);

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}