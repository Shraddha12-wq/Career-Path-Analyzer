package com.career;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/saveAdvancedAnswers")
public class SaveAdvancedAnswersServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession();

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

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                int questionId =
                        rs.getInt("id");

                String correctAnswer =
                        rs.getString("correct_answer");

                String selectedAnswer =
                        request.getParameter(
                        "q" + questionId);

                int score = 0;

                if(selectedAnswer != null &&
                   selectedAnswer.equals(correctAnswer)){

                    score = 1;
                }

                PreparedStatement insert =
                        con.prepareStatement(

                "INSERT INTO aptitude_answers " +
                "(user_id,education,question_id,selected_answer,score) " +
                "VALUES(?,?,?,?,?)"

                );

                insert.setInt(1,userId);
                insert.setString(2,"Graduation");
                insert.setInt(3,questionId);
                insert.setString(4,selectedAnswer);
                insert.setInt(5,score);

                insert.executeUpdate();
            }

            response.sendRedirect("result");

        }
        catch(Exception e){

            e.printStackTrace();
        }
    }
}