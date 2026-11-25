package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/edit_course")
public class EditCourseServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 🔒 Admin Check
        if(session.getAttribute("role") == null || 
           !session.getAttribute("role").equals("admin")){
            response.sendRedirect("login.jsp");
            return;
        }

        String id = request.getParameter("id");

        Map<String,String> course = null;

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM courses WHERE id=?"
            );
            ps.setInt(1, Integer.parseInt(id));

            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                course = new HashMap<>();
                course.put("id", rs.getString("id"));
                course.put("title", rs.getString("title"));
                course.put("career", rs.getString("career"));
                course.put("description", rs.getString("description"));
                course.put("link", rs.getString("link"));
                course.put("image", rs.getString("image"));
            }

        } catch(Exception e){
            e.printStackTrace();
        }

        request.setAttribute("course", course);
        request.getRequestDispatcher("edit_course.jsp").forward(request, response);
    }
}