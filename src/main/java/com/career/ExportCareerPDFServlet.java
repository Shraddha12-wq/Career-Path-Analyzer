package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/exportCareerPDF")
public class ExportCareerPDFServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String career = request.getParameter("career");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=career_report.pdf");

        try {
            Document document = new Document();
            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();
            document.add(new Paragraph("Career Wise Report\n\n"));

            PdfPTable table = new PdfPTable(4);

            table.addCell("ID");
            table.addCell("User");
            table.addCell("Career");
            table.addCell("Date");

            Connection con = DBConnection.getConnection();

            String query = "SELECT r.id, u.name, r.career, r.created_at " +
                           "FROM results r JOIN users u ON r.user_id = u.id ";

            if(career != null && !career.isEmpty()){
                query += "WHERE r.career=?";
            }

            PreparedStatement ps = con.prepareStatement(query);

            if(career != null && !career.isEmpty()){
                ps.setString(1, career);
            }

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                table.addCell(rs.getString("id"));
                table.addCell(rs.getString("name"));
                table.addCell(rs.getString("career"));
                table.addCell(rs.getString("created_at"));
            }

            document.add(table);
            document.close();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}