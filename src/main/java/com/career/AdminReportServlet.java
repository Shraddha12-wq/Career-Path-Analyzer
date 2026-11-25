package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/adminReport")
public class AdminReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<UserReport> reportList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql =

            "SELECT a.user_id, " +
            "a.name, " +
            "a.education, " +
            "a.work_type, " +
            "COUNT(ap.id) totalQuestions, " +
            "SUM(ap.score) totalScore " +
            "FROM assessment a " +
            "LEFT JOIN aptitude_answers ap " +
            "ON a.user_id = ap.user_id " +
            "GROUP BY a.user_id,a.name,a.education,a.work_type";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            while(rs.next()){

                UserReport report =
                        new UserReport();

                int totalQuestions =
                        rs.getInt("totalQuestions");

                int totalScore =
                        rs.getInt("totalScore");

                int percentage = 0;

                if(totalQuestions > 0){

                    percentage =
                    (totalScore * 100)
                    / totalQuestions;
                }

                report.setName(
                        rs.getString("name"));

                report.setEducation(
                        rs.getString("education"));

                report.setWorkType(
                        rs.getString("work_type"));

                report.setTotalQuestions(
                        totalQuestions);

                report.setScore(
                        totalScore);

                report.setPercentage(
                        percentage);

                reportList.add(report);
            }

            request.setAttribute(
                    "reportList",
                    reportList);

            RequestDispatcher rd =
                    request.getRequestDispatcher(
                    "adminReport.jsp");

            rd.forward(request,response);

        }
        catch(Exception e){

            e.printStackTrace();
        }
    }
}
