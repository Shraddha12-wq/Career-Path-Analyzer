package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("user_id");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            Connection con = DBConnection.getConnection();

            // 🔷 TOTAL TESTS
            PreparedStatement ps1 = con.prepareStatement(
                "SELECT COUNT(*) FROM results WHERE user_id=?"
            );
            ps1.setInt(1, userId);
            ResultSet rs1 = ps1.executeQuery();

            int totalTests = 0;
            if (rs1.next()) {
                totalTests = rs1.getInt(1);
            }

            // 🔷 LATEST RESULT
            PreparedStatement ps2 = con.prepareStatement(
                "SELECT * FROM results WHERE user_id=? ORDER BY id DESC LIMIT 1"
            );
            ps2.setInt(1, userId);
            ResultSet rs2 = ps2.executeQuery();

            Map<String, Integer> roles = new LinkedHashMap<>();

            if (rs2.next()) {

                roles.put("Data Scientist", rs2.getInt("data_scientist"));
                roles.put("Software Developer", rs2.getInt("software_developer"));
                roles.put("UI/UX Designer", rs2.getInt("uiux"));
                roles.put("Cyber Security", rs2.getInt("cyber_security"));
                roles.put("AI Engineer", rs2.getInt("ai_engineer"));
                roles.put("Digital Marketing", rs2.getInt("digital_marketing"));
                roles.put("Business Analyst", rs2.getInt("business_analyst"));
                roles.put("HR Manager", rs2.getInt("hr_manager"));
                roles.put("Teacher", rs2.getInt("teacher"));
                roles.put("Sales & Marketing", rs2.getInt("sales_marketing"));
                roles.put("Entrepreneur", rs2.getInt("entrepreneur"));

            }

            // 🔷 SORT
            List<Map.Entry<String,Integer>> list = new ArrayList<>(roles.entrySet());
            list.sort((a,b) -> b.getValue() - a.getValue());

            Map<String,Integer> sortedRoles = new LinkedHashMap<>();
            for(Map.Entry<String,Integer> e : list){
                sortedRoles.put(e.getKey(), e.getValue());
            }

            // 🔷 TOP 3
            Map<String,Integer> top3 = new LinkedHashMap<>();
            int count = 0;
            for(Map.Entry<String,Integer> e : sortedRoles.entrySet()){
                if(count++ < 3){
                    top3.put(e.getKey(), e.getValue());
                }
            }

            // 🔷 BEST CAREER
            String bestCareer = sortedRoles.keySet().stream().findFirst().orElse("No Test Yet");

            // 📦 Send to JSP
            request.setAttribute("totalTests", totalTests);
            request.setAttribute("roles", sortedRoles);
            request.setAttribute("top3", top3);
            request.setAttribute("bestCareer", bestCareer);

            RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
            rd.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}