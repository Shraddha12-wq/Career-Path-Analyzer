package com.career;

import java.io.IOException;
import java.sql.*;
import java.util.*;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/result")
public class ResultServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session =
                    request.getSession();

            Integer userId =
                    (Integer)session.getAttribute("user_id");

            if(userId == null){

                response.sendRedirect("login.jsp");
                return;
            }


            Connection con =
                    DBConnection.getConnection();


            // Assessment Data

            PreparedStatement aps =
                    con.prepareStatement(

            "SELECT education, work_type " +
            "FROM assessment " +
            "WHERE user_id=? " +
            "ORDER BY id DESC LIMIT 1"

            );

            aps.setInt(1,userId);

            ResultSet ars =
                    aps.executeQuery();

            String education="";
            String work="";

            if(ars.next()){

                education =
                        ars.getString("education");

                work =
                        ars.getString("work_type");
            }



            // Aptitude Score

            PreparedStatement ps =
                    con.prepareStatement(

            "SELECT COUNT(*) totalQuestions,"+
            "SUM(score) totalScore " +
            "FROM aptitude_answers " +
            "WHERE user_id=?"

            );

            ps.setInt(1,userId);

            ResultSet rs =
                    ps.executeQuery();

            int totalQuestions=0;
            int totalScore=0;
            int percentage=0;

            if(rs.next()){

                totalQuestions =
                        rs.getInt("totalQuestions");

                totalScore =
                        rs.getInt("totalScore");

                if(totalQuestions>0){

                    percentage=
                    (totalScore*100)
                    /totalQuestions;
                }
            }



            Map<String,Integer> finalRoles =
                    new LinkedHashMap<>();



            // ==========================
            // 10th
            // ==========================

            if(education.equals("10th")){

                if(work.equals("Technical")){

                    finalRoles.put("Software Developer",90);
                    finalRoles.put("Web Developer",80);
                    finalRoles.put("Computer Technician",70);

                }

                else if(work.equals("NonTechnical")){

                    finalRoles.put("Teacher",85);
                    finalRoles.put("Bank Clerk",75);
                    finalRoles.put("Police Officer",70);

                }

                else{

                    finalRoles.put("Software Developer",85);
                    finalRoles.put("Teacher",80);
                    finalRoles.put("Entrepreneur",75);

                }

            }



            // ==========================
            // 12th
            // ==========================

            else if(education.equals("12th")){

                if(work.equals("Technical")){

                    finalRoles.put("Software Engineer",90);
                    finalRoles.put("AI Engineer",85);
                    finalRoles.put("Data Scientist",80);

                }

                else if(work.equals("NonTechnical")){

                    finalRoles.put("Business Analyst",85);
                    finalRoles.put("Digital Marketer",80);
                    finalRoles.put("Teacher",75);

                }

                else{

                    finalRoles.put("AI Engineer",85);
                    finalRoles.put("Business Analyst",80);
                    finalRoles.put("Entrepreneur",75);

                }

            }



            // ==========================
            // Graduation
            // ==========================

            else if(education.equals("Graduation")){

                if(work.equals("Technical")){

                    finalRoles.put("AI Engineer",95);
                    finalRoles.put("Software Developer",90);
                    finalRoles.put("Cyber Security Analyst",85);
                    finalRoles.put("Data Scientist",80);

                }

                else if(work.equals("NonTechnical")){

                    finalRoles.put("Business Analyst",90);
                    finalRoles.put("HR Manager",85);
                    finalRoles.put("Digital Marketer",80);

                }

                else{

                    finalRoles.put("AI Engineer",90);
                    finalRoles.put("Business Analyst",85);
                    finalRoles.put("Entrepreneur",80);

                }

            }



            // ==========================
            // Post Graduation
            // ==========================

            else if(education.equals("Post Graduation")){

                if(work.equals("Technical")){

                    finalRoles.put("AI Engineer",95);
                    finalRoles.put("Machine Learning Engineer",90);
                    finalRoles.put("Data Scientist",88);
                    finalRoles.put("Cyber Security Analyst",85);

                }

                else if(work.equals("NonTechnical")){

                    finalRoles.put("Business Analyst",90);
                    finalRoles.put("Professor",85);
                    finalRoles.put("HR Manager",80);

                }

                else{

                    finalRoles.put("AI Engineer",90);
                    finalRoles.put("Professor",85);
                    finalRoles.put("Entrepreneur",80);
                    finalRoles.put("Business Analyst",78);

                }

            }



            // ==========================
            // Other
            // ==========================

            else{

                finalRoles.put("Entrepreneur",80);
                finalRoles.put("Digital Marketer",75);
                finalRoles.put("Freelancer",70);
                finalRoles.put("AI Engineer",90);
                finalRoles.put("Professor",85);
                finalRoles.put("Entrepreneur",80);
                finalRoles.put("Business Analyst",78);

            }




            // Best Career

            String bestCareer="";

            int max=-1;

            for(String career :
                    finalRoles.keySet()){

                if(finalRoles.get(career)>max){

                    max=
                    finalRoles.get(career);

                    bestCareer=
                    career;
                }
            }




            request.setAttribute(
                    "bestCareer",
                    bestCareer);

            request.setAttribute(
                    "finalRoles",
                    finalRoles);

            request.setAttribute(
                    "percentage",
                    percentage);

            request.setAttribute(
                    "education",
                    education);

            request.setAttribute(
                    "work",
                    work);



            RequestDispatcher rd=
                    request.getRequestDispatcher(
                    "result.jsp");

            rd.forward(
                    request,
                    response);

        }

        catch(Exception e){

            e.printStackTrace();
        }

    }

}