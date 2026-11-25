<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
Integer userId = (Integer) session.getAttribute("user_id");

if(userId == null){
    response.sendRedirect("login.jsp");
    return;
}

String career = request.getParameter("career");

// 🎯 ALL CAREERS DATA
Map<String, Map<String, Object>> roadmaps = new HashMap<>();

// 1️⃣ DATA SCIENTIST
roadmaps.put("Data Scientist", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "Learn Python Programming",
        "Statistics & Probability",
        "Data Analysis (Pandas, NumPy)",
        "Data Visualization",
        "Machine Learning",
        "Projects (Kaggle)"
    ));
    put("skills", Arrays.asList("Python","SQL","Statistics","ML"));
    put("jobs", Arrays.asList("Data Scientist","Data Analyst","ML Engineer"));
    put("salary", "₹5 LPA – ₹20 LPA+");
}});

// 2️⃣ SOFTWARE DEVELOPER
roadmaps.put("Software Developer", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "Programming (Java/Python)",
        "DSA",
        "Web Development",
        "Backend",
        "Database",
        "Projects + GitHub"
    ));
    put("skills", Arrays.asList("Coding","DSA","Debugging"));
    put("jobs", Arrays.asList("Software Dev","Web Dev","Full Stack"));
    put("salary", "₹4 LPA – ₹18 LPA+");
}});

// 3️⃣ UI/UX
roadmaps.put("UI/UX Designer", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "Design Basics",
        "Figma / Adobe XD",
        "Wireframing",
        "UI Projects",
        "UX Research"
    ));
    put("skills", Arrays.asList("Figma","Creativity","Design"));
    put("jobs", Arrays.asList("UI Designer","UX Designer"));
    put("salary", "₹3 LPA – ₹15 LPA+");
}});

// 4️⃣ CYBER SECURITY
roadmaps.put("Cyber Security Analyst", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "Networking",
        "Linux",
        "Ethical Hacking",
        "Security Tools",
        "Pen Testing"
    ));
    put("skills", Arrays.asList("Networking","Linux","Security"));
    put("jobs", Arrays.asList("Security Analyst","Ethical Hacker"));
    put("salary", "₹4 LPA – ₹18 LPA+");
}});

// 5️⃣ AI ENGINEER
roadmaps.put("AI Engineer", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "Python",
        "ML Basics",
        "Deep Learning",
        "NLP & CV",
        "Projects"
    ));
    put("skills", Arrays.asList("Python","AI","ML"));
    put("jobs", Arrays.asList("AI Engineer","ML Engineer"));
    put("salary", "₹6 LPA – ₹25 LPA+");
}});

// 6️⃣ DIGITAL MARKETER
roadmaps.put("Digital Marketer", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "SEO",
        "Social Media Marketing",
        "Google Ads",
        "Content Marketing",
        "Analytics"
    ));
    put("skills", Arrays.asList("SEO","Marketing","Social Media"));
    put("jobs", Arrays.asList("Digital Marketer","SEO Expert"));
    put("salary", "₹3 LPA – ₹12 LPA+");
}});

// 7️⃣ BUSINESS ANALYST
roadmaps.put("Business Analyst", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "Business Basics",
        "Excel",
        "SQL",
        "Data Analysis",
        "Requirement Gathering"
    ));
    put("skills", Arrays.asList("Excel","SQL","Analysis"));
    put("jobs", Arrays.asList("Business Analyst","Consultant"));
    put("salary", "₹4 LPA – ₹15 LPA+");
}});

// 8️⃣ HR
roadmaps.put("HR Manager", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "HR Basics",
        "Recruitment",
        "Employee Management",
        "Policies"
    ));
    put("skills", Arrays.asList("Communication","Management"));
    put("jobs", Arrays.asList("HR Manager","Recruiter"));
    put("salary", "₹3 LPA – ₹10 LPA+");
}});

// 9️⃣ TEACHER
roadmaps.put("Teacher / Lecturer", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "Subject Knowledge",
        "Teaching Skills",
        "Communication",
        "Class Management"
    ));
    put("skills", Arrays.asList("Teaching","Communication"));
    put("jobs", Arrays.asList("Teacher","Lecturer"));
    put("salary", "₹3 LPA – ₹12 LPA+");
}});

// 🔟 SALES
roadmaps.put("Sales & Marketing", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "Communication",
        "Sales Strategy",
        "Customer Handling",
        "Negotiation"
    ));
    put("skills", Arrays.asList("Sales","Marketing"));
    put("jobs", Arrays.asList("Sales Executive","Marketing Manager"));
    put("salary", "₹2.5 LPA – ₹10 LPA+");
}});

// 1️⃣1️⃣ ENTREPRENEUR
roadmaps.put("Entrepreneur", new HashMap<String, Object>() {{
    put("roadmap", Arrays.asList(
        "Idea Generation",
        "Market Research",
        "Business Plan",
        "Funding",
        "Startup Launch"
    ));
    put("skills", Arrays.asList("Leadership","Innovation"));
    put("jobs", Arrays.asList("Startup Founder"));
    put("salary", "Unlimited 🚀");
}});

Map<String, Object> data = roadmaps.get(career);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Career Roadmap</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: radial-gradient(circle at top, #0f172a, #020617);
    color:white;
    font-family:'Poppins';
}

.container{ margin-top:40px; }

.box{
    background:#111827;
    padding:20px;
    border-radius:15px;
    margin-bottom:20px;
}

.step{
    padding:10px;
    border-left:4px solid #00c6ff;
    margin-bottom:10px;
}

.badge-custom{
    background:#00c6ff;
    color:black;
    padding:8px 12px;
    margin:5px;
    border-radius:20px;
}

.btn-course{
    background: linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
    padding:12px 30px;
    border-radius:30px;
    color:white;
}
</style>
</head>

<body>

<div class="container">

<h2 class="text-center mb-4">🚀 <%= career %> Roadmap</h2>

<% if(data != null){ %>

<!-- ROADMAP -->
<div class="box">
<h4>📌 Roadmap</h4>
<%
for(String step : (List<String>)data.get("roadmap")){
%>
<div class="step"><%= step %></div>
<% } %>
</div>

<!-- SKILLS -->
<div class="box">
<h4>🧠 Skills</h4>
<%
for(String s : (List<String>)data.get("skills")){
%>
<span class="badge-custom"><%= s %></span>
<% } %>
</div>

<!-- JOBS -->
<div class="box">
<h4>💼 Job Roles</h4>
<ul>
<%
for(String j : (List<String>)data.get("jobs")){
%>
<li><%= j %></li>
<% } %>
</ul>
</div>

<!-- SALARY -->
<div class="box">
<h4>💰 Salary</h4>
<p><%= data.get("salary") %></p>
</div>

<% } else { %>

<h4 class="text-warning text-center">No roadmap available</h4>

<% } %>

<!-- 🚀 EXPLORE COURSES -->
<div class="text-center mt-5">

<p>🎓 Want to learn with real courses?</p>

<a href="<%= request.getContextPath() %>/courses?career=<%= career %>">
🚀 Explore Courses
</a>

<br><br>

<a href="<%= request.getContextPath() %>/dashboard">🏠 Back to Dashboard</a>
 
</a>

</div>

</div>

</body>
</html>