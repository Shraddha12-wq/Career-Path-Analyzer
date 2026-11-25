package com.career;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/saveBasicAnswers")
public class SaveBasicAnswersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // TEST METHOD
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        response.getWriter().println(
                "SaveBasicAnswersServlet Working Successfully");
    }

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();

            Integer userId =
                    (Integer) session.getAttribute("user_id");

            if (userId == null) {

                response.sendRedirect("login.jsp");
                return;
            }

            Connection con =
                    DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement(
                    "SELECT * FROM basic_questions");

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                int qid = rs.getInt("id");

                String selected =
                        request.getParameter("q" + qid);

                String correct =
                        rs.getString("correct_answer");

                int score = 0;

                if (selected != null &&
                        selected.equals(correct)) {

                    score = 1;
                }

                PreparedStatement insert =
                        con.prepareStatement(

                        "INSERT INTO aptitude_answers(user_id,education,question_id,selected_answer,score) VALUES(?,?,?,?,?)"

                        );

                insert.setInt(1, userId);
                insert.setString(2, "10th");
                insert.setInt(3, qid);
                insert.setString(4, selected);
                insert.setInt(5, score);

                insert.executeUpdate();

                insert.close();
            }

            rs.close();
            ps.close();
            con.close();

            response.sendRedirect(
                    request.getContextPath()
                    + "/result");

        }

        catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h2>Error:</h2>" +
                    e.getMessage());
        }
    }
}