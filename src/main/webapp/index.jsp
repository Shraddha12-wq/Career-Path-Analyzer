<%@ page contentType="text/html;charset=UTF-8" %>
<%
String user = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Smart Career Path Analyzer</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
body {
    font-family: 'Poppins', sans-serif;
}

.navbar {
    backdrop-filter: blur(10px);
}

.navbar .btn {
    border-radius: 20px;
    padding: 6px 15px;
}

.hero {
    height: 100vh;
    background: linear-gradient(rgba(0,0,50,0.7), rgba(0,0,50,0.7)),
    url('https://images.unsplash.com/photo-1504384308090-c894fdcc538d');
    background-size: cover;
    background-position: center;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.hero h1 {
    font-size: 55px;
    font-weight: 700;
}

.hero p {
    font-size: 20px;
}

.btn-custom {
    background: linear-gradient(45deg, #00c6ff, #0072ff);
    border: none;
    padding: 12px 30px;
    font-size: 18px;
    border-radius: 30px;
    color: white;
}

.card {
    border: none;
    border-radius: 15px;
    transition: 0.4s;
}

.card:hover {
    transform: translateY(-10px);
}

.icon {
    font-size: 45px;
}

.features {
    margin-top: -80px;
}

.user-name {
    background: rgba(255,255,255,0.2);
    padding: 6px 15px;
    border-radius: 20px;
}

footer {
    background: #111;
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
</nav>

<!-- 🔷 Hero -->
<div class="hero">
    <div>
        <h1>Find Your Perfect Career Path</h1>
        <p>Smart analysis of your skills, interests &amp; aptitude</p>

        <div class="mt-4">
            <a href="#" onclick="checkLogin()" class="btn btn-custom me-2">
                🚀 Start Test
            </a>
        </div>
    </div>
</div>

<!-- 🔷 Features -->
<div class="container features text-center">

<div class="row">

<div class="col-md-4">
<div class="card shadow p-4">
<i class="fas fa-brain icon text-primary"></i>
<h5 class="mt-3">Aptitude Test</h5>
<p>Analyze your logical and problem-solving skills</p>
</div>
</div>

<div class="col-md-4">
<div class="card shadow p-4">
<i class="fas fa-user icon text-success"></i>
<h5 class="mt-3">Assessment</h5>
<p>Understand your interests and personality</p>
</div>
</div>

<div class="col-md-4">
<div class="card shadow p-4">
<i class="fas fa-chart-line icon text-danger"></i>
<h5 class="mt-3">Career Result</h5>
<p>Get smart career suggestions instantly</p>
</div>
</div>

</div>

</div>

<!-- 🔷 Footer -->
<footer class="text-white text-center p-3 mt-5">
    <p>© 2026 Smart Career Analyzer | MCA Project</p>
</footer>

<!-- 🔷 LOGIN CHECK -->
<script>
function checkLogin(){
    <% if(session.getAttribute("user") == null){ %>
        alert("⚠ Please login first!");
        window.location.href = "login.jsp";
    <% } else { %>
        window.location.href = "assessment.jsp";
    <% } %>
}
</script>

</body>

</html>