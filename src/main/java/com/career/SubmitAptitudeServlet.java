package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/submitAptitude")
public class SubmitAptitudeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("user_id");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            Connection con = DBConnection.getConnection();

            // 🔥 OPTIONAL: Delete old answers (avoid duplicates)
            PreparedStatement del = con.prepareStatement(
                "DELETE FROM user_answers WHERE user_id=?"
            );
            del.setInt(1, userId);
            del.executeUpdate();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions");
            ResultSet rs = ps.executeQuery();

            List<Map<String, String>> resultList = new ArrayList<>();

            int total = 0;
            int score = 0;

            while (rs.next()) {

                int qid = rs.getInt("id");
                String correct = rs.getString("correct_answer");

                String userAns = request.getParameter("q" + qid);

                // ✅ SAVE ANSWER IN DB
                if (userAns != null) {
                    PreparedStatement insert = con.prepareStatement(
                        "INSERT INTO user_answers (user_id, question_id, selected_answer) VALUES (?, ?, ?)"
                    );
                    insert.setInt(1, userId);
                    insert.setInt(2, qid);
                    insert.setString(3, userAns);
                    insert.executeUpdate();
                }

                // (existing logic - unchanged)
                Map<String, String> map = new HashMap<>();
                map.put("user", userAns);
                resultList.add(map);

                total++;

                if (userAns != null && userAns.equals(correct)) {
                    score++;
                }
            }

            // 🎯 KEEP RESULT LOGIC
            double percentage = 0;
            if (total > 0) {
                percentage = (score * 100.0) / total;
            }

            session.setAttribute("aptitude_score", score);
            session.setAttribute("aptitude_total", total);
            session.setAttribute("aptitude_percentage", percentage);

            session.setAttribute("resultList", resultList);

            // 👉 KEEP RESULT PAGE
            response.sendRedirect("result");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}