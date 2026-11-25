package com.career;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/advancedQuestions")
public class AdvancedQuestionsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();

            Integer userId =
                    (Integer)session.getAttribute("user_id");

            if(userId == null){

                response.sendRedirect("login.jsp");
                return;
            }

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT * FROM advanced_questions");

            ResultSet rs = ps.executeQuery();

            List<Question> questions =
                    new ArrayList<Question>();

            while(rs.next()){

                Question q = new Question();

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

            request.getRequestDispatcher(
                    "advancedQuestions.jsp")
                    .forward(request,response);

        } catch(Exception e){

            e.printStackTrace();
        }
    }
}