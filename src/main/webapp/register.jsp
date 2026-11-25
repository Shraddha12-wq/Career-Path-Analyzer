<%@ page contentType="text/html;charset=UTF-8" %>
<%
String user = (String) session.getAttribute("user");
%>

<!DOCTYPE html>
<html>
<head>
<title>Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="bg-dark d-flex justify-content-center align-items-center" style="height:100vh;">

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

<div class="card p-4" style="width:350px;">
<h3 class="text-center">Register</h3>

<form action="register" method="post">
<input type="text" name="name" class="form-control mb-2" placeholder="Name" required>
<input type="email" name="email" class="form-control mb-2" placeholder="Email" required>
<input type="password" name="password" class="form-control mb-2" placeholder="Password" required>
<button class="btn btn-success w-100">Register</button>
</form>

<p class="text-center mt-3">
<a href="login.jsp">Login</a>
</p>

</div>
</body>
</html>