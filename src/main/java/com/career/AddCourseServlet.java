package com.career;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addCourse")
public class AddCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 🔒 SESSION CHECK
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("role") == null ||
            !session.getAttribute("role").equals("admin")) {

            response.sendRedirect("login.jsp");
            return;
        }

        // 📥 GET FORM DATA
        String title = request.getParameter("title");
        String career = request.getParameter("career");
        String description = request.getParameter("description");
        String link = request.getParameter("link");
        String image = request.getParameter("image");

        // ✅ BASIC VALIDATION
        if (title == null || title.trim().isEmpty() ||
            career == null || career.trim().isEmpty()) {

            request.setAttribute("error", "Title and Career are required!");
            request.getRequestDispatcher("admin_add_course.jsp").forward(request, response);
            return;
        }

        try {
            // 🔌 DB CONNECTION
            Connection con = DBConnection.getConnection();

            if (con == null) {
                throw new Exception("Database connection failed!");
            }

            // 📌 INSERT QUERY
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO courses (career, title, description, link, image) VALUES (?, ?, ?, ?, ?)"
            );

            ps.setString(1, career);
            ps.setString(2, title);
            ps.setString(3, description);
            ps.setString(4, link);
            ps.setString(5, image);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            // ✅ SUCCESS
            if (rows > 0) {
                response.sendRedirect("courses?success=1");
            } else {
                request.setAttribute("error", "Failed to add course!");
                request.getRequestDispatcher("admin_add_course.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();

            // ❌ ERROR HANDLING
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("admin_add_course.jsp").forward(request, response);
        }
    }
}