<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
Integer userId = (Integer) session.getAttribute("user_id");

if(userId == null){
    response.sendRedirect("login.jsp");
    return;
}

String name = (String) session.getAttribute("user");

int totalTests = (int) request.getAttribute("totalTests");

Map<String,Integer> roles = 
(Map<String,Integer>) request.getAttribute("roles");

Map<String,Integer> top3 = 
(Map<String,Integer>) request.getAttribute("top3");

String bestCareer = (String) request.getAttribute("bestCareer");
%>

<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body{
    background: linear-gradient(to right,#0f172a,#1e293b);
    color:white;
    font-family:'Poppins';
}

.card-box{
    background: rgba(255,255,255,0.08);
    padding:25px;
    border-radius:15px;
    text-align:center;
    transition:0.3s;
}
.card-box:hover{
    transform: translateY(-8px);
}

.chart-box{
    background: rgba(255,255,255,0.08);
    padding:25px;
    border-radius:15px;
    margin-top:40px;
}

.btn-custom{
    background: linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
    color:white;
    padding:10px 20px;
    border-radius:25px;
}
</style>
</head>

<body>

<div class="container mt-5">

<h2>👋 Welcome <%= name %></h2>

<div class="row mt-4">

<div class="col-md-4">
<div class="card-box shadow">
<h5>Total Tests</h5>
<h2><%= totalTests %></h2>
</div>
</div>

<div class="col-md-4">
<div class="card-box shadow">
<h5>Best Career</h5>
<h4><%= bestCareer %></h4>
</div>
</div>

<div class="col-md-4">
<div class="card-box shadow">
<h5>Top 3 Careers</h5>
<p>
<%
for(String c : top3.keySet()){
%>
<%= c %> (<%= top3.get(c) %>%)<br>
<% } %>
</p>
</div>
</div>

</div>

<!-- BUTTONS -->
<div class="text-center mt-4">

<a href="assessment.jsp" class="btn btn-custom m-2">🚀 Start Test</a>

<% if(roles != null && !roles.isEmpty()){ %>
<a href="roadmap.jsp?career=<%= bestCareer %>" class="btn btn-success m-2">
📌 View Roadmap
</a>
<% } %>
<a href="aptitude.jsp" class="btn btn-custom m-2">🚀 Aptitude Test</a>
<a href="history" class="btn btn-warning m-2">📜 History</a>
<a href="logout" class="btn btn-danger m-2">🚪 Logout</a>

</div>

<!-- CHART -->
<div class="chart-box text-center">

<h4>📊 Career Analysis</h4>

<% if(roles == null || roles.isEmpty()){ %>

<p>No data available</p>

<% } else { %>

<canvas id="chart"></canvas>

<script>
const labels = [
<%
for(String k : roles.keySet()){
%>"<%= k %>",<% } %>
];

const data = [
<%
for(Integer v : roles.values()){
%><%= v %>,<% } %>
];

new Chart(document.getElementById("chart"), {
    type: 'bar',
    data: {
        labels: labels,
        datasets: [{
            label: 'Career Score',
            data: data
        }]
    }
});
</script>

<% } %>

</div>

</div>

</body>
</html>