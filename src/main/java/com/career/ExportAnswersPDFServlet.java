package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/exportAnswersPDF")
public class ExportAnswersPDFServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String from = request.getParameter("from");
        String to = request.getParameter("to");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=answers_report.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();
            document.add(new Paragraph("User Answers Report\n\n"));

            PdfPTable table = new PdfPTable(5);

            table.addCell("ID");
            table.addCell("User");
            table.addCell("Question ID");
            table.addCell("Answer");
            table.addCell("Date");

            Connection con = DBConnection.getConnection();

            String query = "SELECT ua.id, u.name, ua.question_id, ua.selected_answer, ua.created_at " +
                           "FROM user_answers ua " +
                           "JOIN users u ON ua.user_id = u.id ";

            PreparedStatement ps;

            if(from != null && to != null){
                query += "WHERE DATE(ua.created_at) BETWEEN ? AND ?";
                ps = con.prepareStatement(query);
                ps.setString(1, from);
                ps.setString(2, to);
            } else {
                ps = con.prepareStatement(query);
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                table.addCell(rs.getString("id"));
                table.addCell(rs.getString("name"));
                table.addCell(rs.getString("question_id"));
                table.addCell(rs.getString("selected_answer"));
                table.addCell(rs.getString("created_at"));
            }

            document.add(table);
            document.close();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}