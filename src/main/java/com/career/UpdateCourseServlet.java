package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/update_course")
public class UpdateCourseServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE courses SET title=?, career=?, description=?, link=?, image=? WHERE id=?"
            );

            ps.setString(1, request.getParameter("title"));
            ps.setString(2, request.getParameter("career"));
            ps.setString(3, request.getParameter("description"));
            ps.setString(4, request.getParameter("link"));
            ps.setString(5, request.getParameter("image"));
            ps.setInt(6, Integer.parseInt(request.getParameter("id")));

            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }

        response.sendRedirect("admin_courses");
    }
}