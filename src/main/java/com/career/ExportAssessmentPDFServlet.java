package com.career;

import java.io.IOException;
import java.sql.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

@WebServlet("/exportAssessmentPDF")
public class ExportAssessmentPDFServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String from = request.getParameter("from");
        String to = request.getParameter("to");

        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=assessment_report.pdf");

        try {
            Document document = new Document(PageSize.A4.rotate());
            PdfWriter.getInstance(document, response.getOutputStream());

            document.open();

            Font font = new Font(Font.FontFamily.HELVETICA, 16, Font.BOLD);
            Paragraph title = new Paragraph("Assessment Report\n\n", font);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            PdfPTable table = new PdfPTable(15);

            table.addCell("ID");
            table.addCell("Name");
            table.addCell("Age");
            table.addCell("Education");
            table.addCell("Interests");
            table.addCell("Other");

            table.addCell("Tech");
            table.addCell("Comm");
            table.addCell("Logic");
            table.addCell("Creative");
            table.addCell("Leadership");
            table.addCell("Social");
            table.addCell("Practical");

            table.addCell("Work Type");
            table.addCell("Date");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM assessment WHERE DATE(created_at) BETWEEN ? AND ?"
            );

            ps.setString(1, from);
            ps.setString(2, to);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                table.addCell(rs.getString("id"));
                table.addCell(rs.getString("name"));
                table.addCell(rs.getString("age"));
                table.addCell(rs.getString("education"));
                table.addCell(rs.getString("interests"));
                table.addCell(rs.getString("other_interest"));

                table.addCell(rs.getString("tech_skill"));
                table.addCell(rs.getString("comm_skill"));
                table.addCell(rs.getString("logic_skill"));
                table.addCell(rs.getString("creative_skill"));
                table.addCell(rs.getString("lead_skill"));
                table.addCell(rs.getString("social_skill"));
                table.addCell(rs.getString("practical_skill"));

                table.addCell(rs.getString("work_type"));
                table.addCell(rs.getString("created_at"));
            }

            document.add(table);
            document.close();

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}