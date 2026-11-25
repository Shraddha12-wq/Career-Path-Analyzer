package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/assessmentByDate")
public class ViewAssessmentByDateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String education = request.getParameter("education");

        ArrayList<String[]> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM assessment WHERE DATE(created_at) BETWEEN ? AND ?";

            if(education != null && !education.isEmpty()){
                sql += " AND education=?";
            }

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, from);
            ps.setString(2, to);

            if(education != null && !education.isEmpty()){
                ps.setString(3, education);
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                list.add(new String[]{

                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("age"),
                    rs.getString("education"),
                    rs.getString("interests"),
                    rs.getString("other_interest"),

                    rs.getString("tech_skill"),
                    rs.getString("comm_skill"),
                    rs.getString("logic_skill"),
                    rs.getString("creative_skill"),
                    rs.getString("lead_skill"),
                    rs.getString("social_skill"),
                    rs.getString("practical_skill"),

                    rs.getString("work_type"),
                    rs.getString("created_at")
                });
            }
            request.setAttribute("data", list);

            RequestDispatcher rd =
                    request.getRequestDispatcher("assessmentReport.jsp");

            rd.forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
