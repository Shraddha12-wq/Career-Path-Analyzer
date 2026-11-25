package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/viewContacts")
public class ViewContactsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String from = request.getParameter("from");
        String to = request.getParameter("to");

        ArrayList<String[]> list = new ArrayList<>();

        try {
            Connection con = DBConnection.getConnection();

            PreparedStatement ps;

            if(from != null && to != null && !from.isEmpty() && !to.isEmpty()){
                ps = con.prepareStatement(
                    "SELECT * FROM contact_messages WHERE DATE(created_at) BETWEEN ? AND ?"
                );
                ps.setString(1, from);
                ps.setString(2, to);
            } else {
                ps = con.prepareStatement("SELECT * FROM contact_messages ORDER BY id DESC");
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                list.add(new String[]{
                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("message"),
                    rs.getString("created_at")
                });
            }

            request.setAttribute("data", list);
            request.getRequestDispatcher("contactReport.jsp").forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}