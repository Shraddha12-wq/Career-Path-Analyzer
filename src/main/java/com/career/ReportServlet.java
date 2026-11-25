package com.career;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.LinkedHashMap;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/report")
public class ReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
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

            // Get latest assessment

            PreparedStatement aps =
                    con.prepareStatement(

            "SELECT name,education,interests,work_type " +
            "FROM assessment " +
            "WHERE user_id=? " +
            "ORDER BY id DESC LIMIT 1"

            );

            aps.setInt(1, userId);

            ResultSet ars = aps.executeQuery();

            String name = "";
            String education = "";
            String interests = "";
            String work = "";

            if (ars.next()) {

                name = ars.getString("name");

                education =
                        ars.getString("education");

                interests =
                        ars.getString("interests");

                work =
                        ars.getString("work_type");
            }


            // Aptitude score

            PreparedStatement ps =
                    con.prepareStatement(

            "SELECT COUNT(*) totalQuestions," +
            "SUM(score) totalScore " +
            "FROM aptitude_answers " +
            "WHERE user_id=?"

            );

            ps.setInt(1, userId);

            ResultSet rs = ps.executeQuery();

            int totalQuestions = 0;
            int totalScore = 0;
            int percentage = 0;

            if (rs.next()) {

                totalQuestions =
                        rs.getInt("totalQuestions");

                totalScore =
                        rs.getInt("totalScore");

                if (totalQuestions > 0) {

                    percentage =
                            (totalScore * 100)
                            / totalQuestions;
                }
            }


            // Career Suggestions

            Map<String,Integer> finalRoles =
                    new LinkedHashMap<>();


            if(work.equalsIgnoreCase("Technical")
                    || work.equalsIgnoreCase("Both")){

                finalRoles.put(
                        "AI Engineer",
                        percentage + 10);

                finalRoles.put(
                        "Software Developer",
                        percentage + 8);

                finalRoles.put(
                        "Data Scientist",
                        percentage + 5);

                finalRoles.put(
                        "Cyber Security Analyst",
                        percentage);
            }


            if(work.equalsIgnoreCase("NonTechnical")
                    || work.equalsIgnoreCase("Both")){

                finalRoles.put(
                        "Business Analyst",
                        percentage);

                finalRoles.put(
                        "Digital Marketer",
                        percentage - 5);

                finalRoles.put(
                        "HR Manager",
                        percentage - 10);

                finalRoles.put(
                        "Teacher / Lecturer",
                        percentage - 8);

                finalRoles.put(
                        "Entrepreneur",
                        percentage - 6);
            }


            // Find best career

            String bestCareer = "";

            int max = -1;

            for(String career : finalRoles.keySet()){

                int score =
                        finalRoles.get(career);

                if(score > max){

                    max = score;

                    bestCareer = career;
                }
            }


            // Send to JSP

            request.setAttribute(
                    "name",
                    name);

            request.setAttribute(
                    "education",
                    education);

            request.setAttribute(
                    "interests",
                    interests);

            request.setAttribute(
                    "work",
                    work);

            request.setAttribute(
                    "totalQuestions",
                    totalQuestions);

            request.setAttribute(
                    "totalScore",
                    totalScore);

            request.setAttribute(
                    "percentage",
                    percentage);

            request.setAttribute(
                    "bestCareer",
                    bestCareer);

            request.setAttribute(
                    "finalRoles",
                    finalRoles);


            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "report.jsp");

            rd.forward(request,response);

        }

        catch(Exception e){

            e.printStackTrace();
        }

    }

}