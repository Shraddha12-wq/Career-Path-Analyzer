<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
Integer userId = (Integer) session.getAttribute("user_id");

if(userId == null){
    response.sendRedirect("login.jsp");
    return;
}

String career = request.getParameter("career");

// Data from servlet
List<Map<String,String>> courses = 
(List<Map<String,String>>) request.getAttribute("courses");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Courses</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(to right,#020617,#0f172a);
    color:white;
    font-family:'Poppins';
}

.title{
    text-align:center;
    margin-top:40px;
}

.course-card{
    background:#0f172a;
    border-radius:20px;
    overflow:hidden;
    transition:0.4s;
}

.course-card:hover{
    transform:translateY(-10px);
}

.course-card img{
    width:100%;
    height:220px;
    object-fit:cover;
}

.course-content{
    padding:15px;
}

.btn-custom{
    background: linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
    border-radius:25px;
    padding:10px;
    color:white;
}
</style>

</head>

<body>

<div class="container">

<h2 class="title">🎓 <%= career %> Courses</h2>

<div class="text-center mb-4">
<a href="roadmap.jsp?career=<%= career %>" class="btn btn-outline-light">
⬅ Back
</a>
</div>

<div class="row">

<%
if(courses != null && !courses.isEmpty()){

for(Map<String,String> c : courses){
%>

<div class="col-md-4 mb-4">

<div class="course-card">

<img src="<%= (c.get("image")!=null && !c.get("image").isEmpty()) ? c.get("image") : "images/default.jpg" %>">

<div class="course-content">

<h5><%= c.get("title") %></h5>

<p><%= c.get("description") %></p>

<a href="<%= c.get("link") %>" target="_blank" class="btn btn-custom w-100">
▶ Start Course
</a>

</div>

</div>

</div>

<%
}

} else {
%>

<h4 class="text-warning text-center mt-5">
No courses available 😔
</h4>

<%
}
%>

</div>

</div>

</body>
</html>