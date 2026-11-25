package com.career;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/saveAssessment")
public class SaveAssessmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("user_id");

            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            // FORM DATA
            String name = request.getParameter("name");
            int age = Integer.parseInt(request.getParameter("age"));
            String education = request.getParameter("education");

            // INTERESTS
            String[] interestsArr = request.getParameterValues("interest[]");
            String interests = "";

            if (interestsArr != null) {
                interests = String.join(",", interestsArr);
            }

            String otherInterest = request.getParameter("otherInterest");

            // SKILLS
            String tech = request.getParameter("techSkill");
            String comm = request.getParameter("commSkill");
            String logic = request.getParameter("logicSkill");
            String creative = request.getParameter("creativeSkill");
            String lead = request.getParameter("leadSkill");
            String social = request.getParameter("socialSkill");
            String practical = request.getParameter("practicalSkill");

            // WORK
            String work = request.getParameter("work");

            Connection con = DBConnection.getConnection();

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO assessment (user_id,name,age,education,interests,other_interest,tech_skill,comm_skill,logic_skill,creative_skill,lead_skill,social_skill,practical_skill,work_type) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
            );

            ps.setInt(1, userId);
            ps.setString(2, name);
            ps.setInt(3, age);
            ps.setString(4, education);
            ps.setString(5, interests);
            ps.setString(6, otherInterest);
            ps.setString(7, tech);
            ps.setString(8, comm);
            ps.setString(9, logic);
            ps.setString(10, creative);
            ps.setString(11, lead);
            ps.setString(12, social);
            ps.setString(13, practical);
            ps.setString(14, work);

            int i = ps.executeUpdate();

            if (i > 0) {

                // STORE IN SESSION (for result)
                session.setAttribute("assessment_interests", interests);
                session.setAttribute("assessment_education", education);

                session.setAttribute("success", "Assessment saved successfully!");
                
                session.setAttribute("education", education);

                if(education.equals("10th")){

                    response.sendRedirect("basicQuestions");

                }
                else if(education.equals("12th")){

                    response.sendRedirect("intermediateQuestions");

                }
                else if(education.equals("Graduation")){

                    response.sendRedirect("advancedQuestions");

                }
                else if(education.equals("Post Graduation")){

                    response.sendRedirect("expertQuestions");

                }
                else if(education.equals("Other")){

                    response.sendRedirect("aptitude.jsp");

                }

            } else {
                response.getWriter().println("❌ Failed to save");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}