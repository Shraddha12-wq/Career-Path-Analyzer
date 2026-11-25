<%@ page contentType="text/html;charset=UTF-8" %>
<%
String user = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>About Us - Career Analyzer</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<!-- Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
body{
    font-family:'Poppins',sans-serif;
    background:#020617;
    color:white;
}

/* Navbar */
.navbar{
    backdrop-filter: blur(10px);
}

/* Hero */
.hero{
    height:60vh;
    background:linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
    url('https://images.unsplash.com/photo-1522202176988-66273c2fd55f');
    background-size:cover;
    background-position:center;
    display:flex;
    align-items:center;
    justify-content:center;
    text-align:center;
}

.hero h1{
    font-size:50px;
    font-weight:700;
}

/* Section */
.section{
    padding:70px 0;
}

/* Glass Card */
.card-glass{
    background:rgba(255,255,255,0.05);
    border-radius:20px;
    padding:30px;
    backdrop-filter:blur(12px);
    box-shadow:0 0 20px rgba(0,198,255,0.2);
    transition:0.3s;
}

.card-glass:hover{
    transform:translateY(-10px);
}

/* Icons */
.icon{
    font-size:40px;
}

/* Button */
.btn-custom{
    background: linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
    color:white;
    padding:10px 25px;
    border-radius:25px;
}

/* Footer */
footer{
    background:#111;
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

<!-- 🔷 Hero -->
<div class="hero">
<div>
<h1>About Us</h1>
<p class="lead">Discover who we are & what we do</p>
</div>
</div>

<!-- 🔷 About Website --> 
<div class="container section">
<div class="row align-items-center"> 

<div class="col-md-6"> 
<h2>🌐 About Our Website</h2> 

<p>
Welcome to <b>Career Analyzer</b>, a smart online platform designed to help 
students and individuals discover the most suitable career paths based on their skills, interests, and aptitude.
</p>

<p>
Our website provides an easy and interactive way to analyze your strengths through a simple assessment and aptitude test. 
Based on your inputs, we generate personalized career suggestions.
</p>

<p>
Whether you are a student confused about your career or exploring new opportunities, 
our platform helps you choose the right path with confidence.
</p>

</div>

<div class="col-md-6">
<img src="https://images.unsplash.com/photo-1498050108023-c5249f4df085"
class="img-fluid rounded shadow">
</div>

</div>
</div>

<!-- 🔷 Mission Vision -->
<div class="container text-center section">
<h2>Our Mission & Vision</h2>

<div class="row mt-4">

<div class="col-md-6">
<div class="card-glass">
<i class="fas fa-bullseye icon text-primary"></i>
<h4 class="mt-3">Mission</h4>
<p>Help users choose the right career using smart analysis</p>
</div>
</div>

<div class="col-md-6">
<div class="card-glass">
<i class="fas fa-eye icon text-success"></i>
<h4 class="mt-3">Vision</h4>
<p>Become India's leading career guidance platform</p>
</div>
</div>

</div>
</div>

<!-- 🔷 Features -->
<div class="container text-center section">
<h2>Why Choose Us?</h2>

<div class="row mt-4">

<div class="col-md-3">
<div class="card-glass">
<i class="fas fa-brain icon text-info"></i>
<p class="mt-2">Smart AI Analysis</p>
</div>
</div>

<div class="col-md-3">
<div class="card-glass">
<i class="fas fa-clock icon text-warning"></i>
<p class="mt-2">Instant Results</p>
</div>
</div>

<div class="col-md-3">
<div class="card-glass">
<i class="fas fa-user icon text-success"></i>
<p class="mt-2">Personalized Career</p>
</div>
</div>

<div class="col-md-3">
<div class="card-glass">
<i class="fas fa-globe icon text-danger"></i>
<p class="mt-2">Accessible Anywhere</p>
</div>
</div>

</div>
</div>

<!-- 🔷 Footer -->
<footer class="text-center text-white p-3">
<p>© 2026 Career Analyzer | MCA Project</p>
</footer>

</body>
</html>