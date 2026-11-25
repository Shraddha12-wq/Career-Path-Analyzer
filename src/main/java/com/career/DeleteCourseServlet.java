package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/delete_course")
public class DeleteCourseServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("id");

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM courses WHERE id=?"
            );

            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();

        } catch(Exception e){
            e.printStackTrace();
        }

        response.sendRedirect("admin_courses");
    }
}