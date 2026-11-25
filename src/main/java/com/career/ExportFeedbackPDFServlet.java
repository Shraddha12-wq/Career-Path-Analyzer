package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/exportFeedbackPDF")
public class ExportFeedbackPDFServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String from = request.getParameter("from");
        String to = request.getParameter("to");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=feedback_report.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();
            document.add(new Paragraph("Feedback Report\n\n"));

            PdfPTable table = new PdfPTable(5);

            table.addCell("ID");
            table.addCell("User ID");
            table.addCell("Rating");
            table.addCell("Comment");
            table.addCell("Date");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps;

            if(from != null && to != null){
                ps = con.prepareStatement(
                    "SELECT * FROM feedback WHERE DATE(created_at) BETWEEN ? AND ?"
                );
                ps.setString(1, from);
                ps.setString(2, to);
            } else {
                ps = con.prepareStatement("SELECT * FROM feedback");
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                table.addCell(rs.getString("id"));
                table.addCell(rs.getString("user_id"));
                table.addCell(rs.getString("rating"));
                table.addCell(rs.getString("comment"));
                table.addCell(rs.getString("created_at"));
            }

            document.add(table);
            document.close();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}