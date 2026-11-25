<%@ page contentType="text/html;charset=UTF-8" %>
<%
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("admin")){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Reports</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#0f172a;
    color:white;
}
.card{
    border-radius:15px;
    transition:0.3s;
}
.card:hover{
    transform:scale(1.05);
}
</style>
</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-5">📊 Admin Reports Dashboard</h2>

<div class="row text-center">

<!-- Registration Report -->
<div class="col-md-4 mb-4">
    <div class="card p-4 shadow">
        <h4>👤 Registration Report</h4>
        <p>View all registered users</p>
        <a href="usersReport.jsp" class="btn btn-primary">View</a>
    </div>
</div>

<!-- Contact Report -->
<div class="col-md-4 mb-4">
    <div class="card p-4 shadow">
        <h4>📞 Contact Report</h4>
        <p>User contact messages</p>
        <a href="contactReport.jsp" class="btn btn-info">View</a>
    </div>
</div>

<!-- Feedback Report -->
<div class="col-md-4 mb-4">
    <div class="card p-4 shadow">
        <h4>💬 Feedback Report</h4>
        <p>User feedback & reviews</p>
        <a href="feedbackReport.jsp" class="btn btn-success">View</a>
    </div>
</div>

<!-- Assessment Report -->
<div class="col-md-4 mb-4">
    <div class="card p-4 shadow">
        <h4>📝 Assessment Report</h4>
        <p>User assessment answers</p>
        <a href="assessmentReport.jsp" class="btn btn-warning">View</a>
    </div>
</div>

<!-- Aptitude Report -->
<div class="col-md-4 mb-4">
    <div class="card p-4 shadow">
        <h4>🧠 Aptitude Report</h4>
        <p>User aptitude scores</p>
        <a href="answersReport.jsp" class="btn btn-danger">View</a>
    </div>
</div>

<div class="col-md-4 mb-4">
    <div class="card p-4 shadow">
        <h4>📝 user Report</h4>
        <p>User Report</p>
        <a href="adminReport.jsp" class="btn btn-warning">View</a>
    </div>
</div>

<div class="col-md-4 mb-4">
    <div class="card p-4 shadow">
        <h4>📅 Aptitude Date Wise Report</h4>
        <p>View aptitude answers by date range</p>
        <a href="viewAptitudeReport" class="btn btn-danger">
            View
        </a>
    </div>
</div>

<!-- 🚀 NEW: Career Report -->
<div class="col-md-4 mb-4">
    <div class="card p-4 shadow">
        <h4>📊 Career Report</h4>
        <p>View career-wise results</p>
        <a href="careerReport" class="btn btn-dark">View</a>
    </div>
</div>

</div>

<div class="text-center mt-4">
    <a href="index.jsp" class="btn btn-light">Back</a>
</div>

</div>

</body>
</html>