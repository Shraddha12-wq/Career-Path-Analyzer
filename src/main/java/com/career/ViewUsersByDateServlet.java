package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/usersByDate")
public class ViewUsersByDateServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String from = request.getParameter("from");
        String to = request.getParameter("to");

        ArrayList<String[]> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE DATE(created_at) BETWEEN ? AND ?"
            );

            ps.setString(1, from);
            ps.setString(2, to);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                list.add(new String[]{
                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("created_at")
                });
            }

            request.setAttribute("data", list);
            RequestDispatcher rd = request.getRequestDispatcher("usersReport.jsp");
            rd.forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}