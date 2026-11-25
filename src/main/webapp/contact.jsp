<%@ page contentType="text/html;charset=UTF-8" %>

<%
String user = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<title>Contact Us</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{background:#0f172a;color:white;font-family:Poppins;}
.card-box{
    background:rgba(255,255,255,0.08);
    padding:30px;
    border-radius:15px;
}
.btn-custom{
    background:linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
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
<div class="container mt-5">

<h2 class="text-center mb-4">📩 Contact Us</h2>

<div class="card-box col-md-6 mx-auto">

<% if(request.getAttribute("success") != null){ %>
<div class="alert alert-success">
<%= request.getAttribute("success") %>
</div>
<% } %>

<form action="contact" method="post">

<input type="text" name="name" class="form-control mb-3" placeholder="Your Name" required>

<input type="email" name="email" class="form-control mb-3" placeholder="Your Email" required>

<textarea name="message" class="form-control mb-3" placeholder="Your Message" required></textarea>

<button class="btn btn-custom w-100">Send Message</button>

</form>

</div>

</div>

</body>
</html>