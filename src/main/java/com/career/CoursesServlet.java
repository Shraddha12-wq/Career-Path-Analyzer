package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/courses")
public class CoursesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("user_id");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            String career = request.getParameter("career");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM courses WHERE career=?"
            );
            ps.setString(1, career);

            ResultSet rs = ps.executeQuery();

            List<Map<String,String>> list = new ArrayList<>();

            while(rs.next()){
                Map<String,String> map = new HashMap<>();

                map.put("title", rs.getString("title"));
                map.put("description", rs.getString("description"));
                map.put("link", rs.getString("link"));
                map.put("image", rs.getString("image"));

                list.add(map);
            }

            request.setAttribute("courses", list);

            RequestDispatcher rd = request.getRequestDispatcher("courses.jsp");
            rd.forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}