package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin")
public class AdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 🔒 Admin Check
        if(session.getAttribute("role") == null || 
           !session.getAttribute("role").equals("admin")){
            response.sendRedirect("login.jsp");
            return;
        }

        int userCount = 0, courseCount = 0, resultCount = 0;
        Map<String,Integer> career = new LinkedHashMap<>();
        List<Map<String,String>> users = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            Statement st = con.createStatement();

            // 📊 COUNTS
            ResultSet rs1 = st.executeQuery("SELECT COUNT(*) FROM users");
            if(rs1.next()) userCount = rs1.getInt(1);

            ResultSet rs2 = st.executeQuery("SELECT COUNT(*) FROM courses");
            if(rs2.next()) courseCount = rs2.getInt(1);

            ResultSet rs3 = st.executeQuery("SELECT COUNT(*) FROM results");
            if(rs3.next()) resultCount = rs3.getInt(1);

            // 📊 CAREER DATA
            ResultSet rs4 = st.executeQuery(
                "SELECT " +
                "SUM(data_scientist), SUM(software_developer), SUM(uiux), " +
                "SUM(cyber_security), SUM(ai_engineer), SUM(digital_marketing), " +
                "SUM(business_analyst), SUM(hr_manager), SUM(teacher), " +
                "SUM(sales_marketing), SUM(entrepreneur) FROM results"
            );

            if(rs4.next()){
                career.put("Data Scientist", rs4.getInt(1));
                career.put("Software Dev", rs4.getInt(2));
                career.put("UI/UX", rs4.getInt(3));
                career.put("Cyber Sec", rs4.getInt(4));
                career.put("AI", rs4.getInt(5));
                career.put("Marketing", rs4.getInt(6));
                career.put("Business", rs4.getInt(7));
                career.put("HR", rs4.getInt(8));
                career.put("Teacher", rs4.getInt(9));
                career.put("Sales", rs4.getInt(10));
                career.put("Entrepreneur", rs4.getInt(11));
            }

            // 👤 RECENT USERS
            ResultSet rs5 = st.executeQuery(
                "SELECT name,email FROM users ORDER BY id DESC LIMIT 5"
            );

            while(rs5.next()){
                Map<String,String> u = new HashMap<>();
                u.put("name", rs5.getString("name"));
                u.put("email", rs5.getString("email"));
                users.add(u);
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        // ✅ SEND DATA
        request.setAttribute("userCount", userCount);
        request.setAttribute("courseCount", courseCount);
        request.setAttribute("resultCount", resultCount);
        request.setAttribute("career", career);
        request.setAttribute("users", users);

        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}