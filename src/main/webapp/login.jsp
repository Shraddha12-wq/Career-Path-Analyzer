<%@ page contentType="text/html;charset=UTF-8" %>

<%
String user = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
body{
    font-family:'Poppins', sans-serif;
    background: linear-gradient(rgba(0,0,0,0.7), rgba(0,0,0,0.7)),
    url('https://images.unsplash.com/photo-1498050108023-c5249f4df085');
    background-size: cover;
    display:flex;
    justify-content:center;
    align-items:center;
    height:100vh;
}

.box{
    width:350px;
    padding:30px;
    background:rgba(255,255,255,0.1);
    backdrop-filter:blur(10px);
    border-radius:15px;
    color:white;
}
</style>
</head>

<body>


<!-- 🔷 Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">🎯 Career Advisor</a>

        <div class="d-flex align-items-center">

            <a href="index.jsp" class="btn btn-outline-light me-2">Home</a>
            <a href="about.jsp" class="btn btn-outline-light me-2">About</a>
            <a href="assessment.jsp" class="btn btn-outline-light me-2">Start Test</a>
            <a href="contact.jsp" class="btn btn-info">Contact</a>
			<a href="feedback.jsp" class="btn btn-warning">Feedback</a>

            <% if(user != null){ %>

                <!-- 👤 USER NAME -->
                <span class="text-white me-3 fw-bold user-name">
                    👋 Hi, <%= user %>
                </span>

               <a href="<%= request.getContextPath() %>/dashboard" class="btn btn-success me-2">Dashboard</a>
                <a href="logout" class="btn btn-danger">Logout</a>

            <% } else { %>

                <a href="login.jsp" class="btn btn-custom">Login</a>

            <% } %>

        </div>
    </div>
</nav><br/>

<div class="box">

<h3 class="text-center">🔐 Login</h3>

<!-- 🔴 ERROR MESSAGE -->
<%
String error = (String) request.getAttribute("error");
if(error != null){
%>
<div class="alert alert-danger"><%= error %></div>
<% } %>

<form action="login" method="post">

<input type="email" name="email" class="form-control mb-3" placeholder="Email" required>

<input type="password" name="password" class="form-control mb-3" placeholder="Password" required>

<button class="btn btn-primary w-100">Login</button>

</form>

<p class="text-center mt-3">
New user? <a href="register.jsp" style="color:#00c6ff;">Register</a>
</p>

</div>

</body>
</html>