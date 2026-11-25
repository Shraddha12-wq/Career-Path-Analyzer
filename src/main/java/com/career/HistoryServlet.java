package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/history")
public class HistoryServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if(session.getAttribute("user_id") == null){
            response.sendRedirect("login.jsp");
            return;
        }

        int user_id = (int) session.getAttribute("user_id");

        System.out.println("SESSION USER ID = " + user_id);

        List<Map<String,Object>> historyList = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM results WHERE user_id=? ORDER BY created_at DESC"
            );

            ps.setInt(1, user_id);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Map<String,Object> row = new HashMap<>();

                row.put("date", rs.getTimestamp("created_at"));

                row.put("ds", rs.getInt("data_scientist"));
                row.put("dev", rs.getInt("software_developer"));
                row.put("ui", rs.getInt("uiux"));
                row.put("cyber", rs.getInt("cyber_security"));
                row.put("ai", rs.getInt("ai_engineer"));
                row.put("dm", rs.getInt("digital_marketing"));
                row.put("ba", rs.getInt("business_analyst"));
                row.put("hr", rs.getInt("hr_manager"));
                row.put("teacher", rs.getInt("teacher"));
                row.put("sales", rs.getInt("sales_marketing"));
                row.put("ent", rs.getInt("entrepreneur"));

                row.put("career", rs.getString("career"));

                historyList.add(row);
            }

            rs.close();
            ps.close();

        } catch(Exception e){
            e.printStackTrace();
        }

        request.setAttribute("history", historyList);
        request.getRequestDispatcher("history.jsp").forward(request, response);
    }
}