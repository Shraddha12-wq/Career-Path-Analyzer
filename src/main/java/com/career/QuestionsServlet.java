package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/questions")
public class QuestionsServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        // 🔒 ADMIN CHECK
        if(session.getAttribute("role") == null || 
           !session.getAttribute("role").equals("admin")){
            response.sendRedirect("login.jsp");
            return;
        }

        try {
            Connection con = DBConnection.getConnection();

            // 🗑 DELETE
            String deleteId = request.getParameter("delete");
            if(deleteId != null){
                PreparedStatement del = con.prepareStatement(
                    "DELETE FROM questions WHERE id=?"
                );
                del.setInt(1, Integer.parseInt(deleteId));
                del.executeUpdate();

                response.sendRedirect("questions");
                return;
            }

            // ✏ EDIT LOAD
            String editId = request.getParameter("edit");
            if(editId != null){

                PreparedStatement ps = con.prepareStatement(
                    "SELECT * FROM questions WHERE id=?"
                );
                ps.setInt(1, Integer.parseInt(editId));

                ResultSet rs = ps.executeQuery();

                if(rs.next()){
                    request.setAttribute("editData", rs);
                    request.getRequestDispatcher("edit_question.jsp").forward(request, response);
                    return; // IMPORTANT
                }
            }

            // 📥 FETCH ALL
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery("SELECT * FROM questions");

            List<Map<String,String>> list = new ArrayList<>();

            while(rs.next()){
                Map<String,String> q = new HashMap<>();
                q.put("id", rs.getString("id"));
                q.put("question", rs.getString("question"));
                list.add(q);
            }

            request.setAttribute("questions", list);
            request.getRequestDispatcher("admin_questions.jsp").forward(request, response);

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}