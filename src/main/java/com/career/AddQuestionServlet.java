package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/addQuestion")
public class AddQuestionServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if(session.getAttribute("role") == null || 
           !session.getAttribute("role").equals("admin")){
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO questions(question, option1, option2, option3, option4, correct_answer) VALUES(?,?,?,?,?,?)"
            );

            ps.setString(1, request.getParameter("question"));
            ps.setString(2, request.getParameter("option1"));
            ps.setString(3, request.getParameter("option2"));
            ps.setString(4, request.getParameter("option3"));
            ps.setString(5, request.getParameter("option4"));
            ps.setString(6, request.getParameter("correct_answer"));

            ps.executeUpdate();

            response.sendRedirect("questions");

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}