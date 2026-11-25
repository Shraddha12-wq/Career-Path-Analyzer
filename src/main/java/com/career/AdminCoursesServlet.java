package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/admin_courses")
public class AdminCoursesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 🔒 ADMIN CHECK
        if(session.getAttribute("role") == null || 
           !session.getAttribute("role").equals("admin")){
            response.sendRedirect("login.jsp");
            return;
        }

        List<Map<String,String>> courses = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            // 🗑 DELETE COURSE
            String deleteId = request.getParameter("delete");
            if(deleteId != null){
                PreparedStatement del = con.prepareStatement(
                    "DELETE FROM courses WHERE id=?"
                );
                del.setInt(1, Integer.parseInt(deleteId));
                del.executeUpdate();
                del.close();

                // redirect to avoid duplicate delete on refresh
                response.sendRedirect("admin_courses");
                return;
            }

            // 📥 FETCH COURSES
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM courses");

            while(rs.next()){
                Map<String,String> row = new HashMap<>();

                row.put("id", rs.getString("id"));
                row.put("title", rs.getString("title"));
                row.put("career", rs.getString("career"));
                row.put("link", rs.getString("link"));

                courses.add(row);
            }

            rs.close();
            st.close();

        } catch(Exception e){
            e.printStackTrace();
        }

        request.setAttribute("courses", courses);
        request.getRequestDispatcher("admin_courses.jsp").forward(request, response);
    }
}