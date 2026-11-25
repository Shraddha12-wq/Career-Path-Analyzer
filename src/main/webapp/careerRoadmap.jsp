<%@ page contentType="text/html;charset=UTF-8" %>

<%
String career = request.getParameter("career");

if(career == null){
    career = "Software Developer";
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Career Roadmap</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{
    background:#0f172a;
    color:white;
    font-family:'Poppins',sans-serif;
}

.roadmap-box{
    background:#1e293b;
    padding:40px;
    border-radius:15px;
    margin-top:50px;
}

.step{
    background:#334155;
    padding:20px;
    margin:15px 0;
    border-radius:10px;
}

.title{
    color:#38bdf8;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<div class="roadmap-box">

<h2 class="text-center">
🚀 Career Roadmap
</h2>

<hr>

<h3 class="text-warning text-center">
<%= career %>
</h3>

<br>

<%
if(career.equalsIgnoreCase("Software Developer")){
%>

<div class="step">
Step 1: Learn Programming (Java, Python, C++)
</div>

<div class="step">
Step 2: Learn Data Structures & Algorithms
</div>

<div class="step">
Step 3: Learn Database (MySQL)
</div>

<div class="step">
Step 4: Build Projects
</div>

<div class="step">
Step 5: Apply for Software Developer Jobs
</div>

<%
}
else if(career.equalsIgnoreCase("AI Engineer")){
%>

<div class="step">
Step 1: Learn Python
</div>

<div class="step">
Step 2: Learn Machine Learning
</div>

<div class="step">
Step 3: Learn Deep Learning
</div>

<div class="step">
Step 4: Build AI Projects
</div>

<div class="step">
Step 5: Become AI Engineer
</div>

<%
}
else if(career.equalsIgnoreCase("Data Analyst")){
%>

<div class="step">
Step 1: Learn Excel
</div>

<div class="step">
Step 2: Learn SQL
</div>

<div class="step">
Step 3: Learn Power BI
</div>

<div class="step">
Step 4: Learn Python for Analytics
</div>

<div class="step">
Step 5: Become Data Analyst
</div>

<%
}
else if(career.equalsIgnoreCase("Business Analyst")){
%>

<div class="step">
Step 1: Learn Business Concepts
</div>

<div class="step">
Step 2: Learn Excel & Power BI
</div>

<div class="step">
Step 3: Learn SQL
</div>

<div class="step">
Step 4: Learn Requirement Gathering
</div>

<div class="step">
Step 5: Become Business Analyst
</div>

<%
}
else if(career.equalsIgnoreCase("Digital Marketer")){
%>

<div class="step">
Step 1: Learn SEO
</div>

<div class="step">
Step 2: Learn Social Media Marketing
</div>

<div class="step">
Step 3: Learn Google Ads
</div>

<div class="step">
Step 4: Learn Content Marketing
</div>

<div class="step">
Step 5: Become Digital Marketer
</div>

<%
}
else{
%>

<div class="step">
Explore your interests and skills.
</div>

<div class="step">
Complete certification courses.
</div>

<div class="step">
Develop communication skills.
</div>

<div class="step">
Build practical projects.
</div>

<div class="step">
Choose the best career path.
</div>

<%
}
%>

<br>

<div class="text-center">

<a href="index.jsp"
class="btn btn-primary">

🏠 Home

</a>

</div>

</div>

</div>

</body>
</html>