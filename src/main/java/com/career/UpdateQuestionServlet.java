package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/updateQuestion")
public class UpdateQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "UPDATE questions SET question=?, option1=?, option2=?, option3=?, option4=?, correct_answer=? WHERE id=?"
            );

            ps.setString(1, request.getParameter("question"));
            ps.setString(2, request.getParameter("option1"));
            ps.setString(3, request.getParameter("option2"));
            ps.setString(4, request.getParameter("option3"));
            ps.setString(5, request.getParameter("option4"));
            ps.setString(6, request.getParameter("correct_answer"));
            ps.setInt(7, Integer.parseInt(request.getParameter("id")));

            ps.executeUpdate();

            response.sendRedirect("questions");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}