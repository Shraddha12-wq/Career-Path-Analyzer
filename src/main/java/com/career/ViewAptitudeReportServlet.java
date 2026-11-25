package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewAptitudeReport")
public class ViewAptitudeReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");

        ArrayList<String[]> reportData =
                new ArrayList<>();

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
            "SELECT ua.id, u.name, ua.question_id, " +
            "ua.selected_answer, ua.created_at " +
            "FROM user_answers ua " +
            "JOIN users u ON ua.user_id=u.id ";

            PreparedStatement ps;

            if(startDate != null &&
               endDate != null &&
               !startDate.isEmpty() &&
               !endDate.isEmpty()) {

                sql +=
                "WHERE DATE(ua.created_at) " +
                "BETWEEN ? AND ? " +
                "ORDER BY ua.created_at DESC";

                ps = con.prepareStatement(sql);

                ps.setString(1, startDate);
                ps.setString(2, endDate);

            } else {

                sql +=
                "ORDER BY ua.created_at DESC";

                ps = con.prepareStatement(sql);
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                reportData.add(new String[]{

                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("question_id"),
                    rs.getString("selected_answer"),
                    rs.getString("created_at")
                });
            }

            request.setAttribute(
                    "reportData",
                    reportData);

            request.getRequestDispatcher(
                    "aptitudeReport.jsp")
                    .forward(request, response);

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}