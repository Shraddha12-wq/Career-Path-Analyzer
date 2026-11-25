package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/exportContactPDF")
public class ExportContactPDFServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String from = request.getParameter("from");
        String to = request.getParameter("to");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=contact_report.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();

            document.add(new Paragraph("Contact Messages Report\n\n"));

            PdfPTable table = new PdfPTable(5);

            table.addCell("ID");
            table.addCell("Name");
            table.addCell("Email");
            table.addCell("Message");
            table.addCell("Date");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps;

            if(from != null && to != null){
                ps = con.prepareStatement(
                    "SELECT * FROM contact_messages WHERE DATE(created_at) BETWEEN ? AND ?"
                );
                ps.setString(1, from);
                ps.setString(2, to);
            } else {
                ps = con.prepareStatement("SELECT * FROM contact_messages");
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                table.addCell(rs.getString("id"));
                table.addCell(rs.getString("name"));
                table.addCell(rs.getString("email"));
                table.addCell(rs.getString("message"));
                table.addCell(rs.getString("created_at"));
            }

            document.add(table);
            document.close();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}