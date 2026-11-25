package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/careerReport")
public class ViewCareerReportServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String career = request.getParameter("career");
        String from = request.getParameter("from");
        String to = request.getParameter("to");

        ArrayList<String[]> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            String query = "SELECT r.id, u.name, r.career, r.data_scientist, r.software_developer, " +
                           "r.uiux, r.cyber_security, r.ai_engineer, r.created_at " +
                           "FROM results r JOIN users u ON r.user_id = u.id WHERE 1=1 ";

            if(career != null && !career.isEmpty()){
                query += "AND r.career = ? ";
            }

            if(from != null && to != null && !from.isEmpty() && !to.isEmpty()){
                query += "AND DATE(r.created_at) BETWEEN ? AND ? ";
            }

            PreparedStatement ps = con.prepareStatement(query);

            int i = 1;

            if(career != null && !career.isEmpty()){
                ps.setString(i++, career);
            }

            if(from != null && to != null && !from.isEmpty() && !to.isEmpty()){
                ps.setString(i++, from);
                ps.setString(i++, to);
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                list.add(new String[]{
                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("career"),
                    rs.getString("data_scientist"),
                    rs.getString("software_developer"),
                    rs.getString("uiux"),
                    rs.getString("cyber_security"),
                    rs.getString("ai_engineer"),
                    rs.getString("created_at")
                });
            }

            request.setAttribute("data", list);
            request.getRequestDispatcher("careerReport.jsp").forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}