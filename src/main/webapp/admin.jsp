<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
Map<String,Integer> career = (Map<String,Integer>) request.getAttribute("career");
List<Map<String,String>> users = (List<Map<String,String>>) request.getAttribute("users");

Integer userCount = (Integer) request.getAttribute("userCount");
Integer courseCount = (Integer) request.getAttribute("courseCount");
Integer resultCount = (Integer) request.getAttribute("resultCount");

if(career == null) career = new LinkedHashMap<>();
if(users == null) users = new ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
body{
    background:#0f172a;
    color:white;
    font-family:Poppins;
}

.sidebar{
    width:230px;
    height:100vh;
    position:fixed;
    background:#020617;
}

.sidebar a{
    display:block;
    padding:15px;
    color:white;
    text-decoration:none;
}

.sidebar a:hover{
    background:#00c6ff;
}

.content{
    margin-left:240px;
    padding:20px;
}

.card-box{
    background:rgba(255,255,255,0.08);
    padding:20px;
    border-radius:15px;
    text-align:center;
    transition:0.3s;
}

.card-box:hover{
    transform: translateY(-5px);
}

.chart-box{
    background:rgba(255,255,255,0.08);
    padding:20px;
    border-radius:15px;
    margin-top:30px;
}
</style>
</head>

<body>

<!-- SIDEBAR -->
<div class="sidebar">
<h4 class="text-center mt-3">Admin Panel</h4>


<a href="admin">Dashboard</a>
<a href="admin_users">Users</a>
<a href="admin_courses">Courses</a>
<a href="questions">Questions</a>
<a href="admin_feedback">Feedback</a>
<a href="admin_contact">Contact us</a>
<a href="adminReports.jsp">Report</a>
<a href="logout">Logout</a>
</div>

<!-- CONTENT -->
<div class="content">

<h2>Dashboard</h2>

<div class="row mt-4">

<div class="col-md-4">
<div class="card-box">
<h5>Total Users</h5>
<h2><%= userCount != null ? userCount : 0 %></h2>
</div>
</div>

<div class="col-md-4">
<div class="card-box">
<h5>Total Courses</h5>
<h2><%= courseCount != null ? courseCount : 0 %></h2>
</div>
</div>

<div class="col-md-4">
<div class="card-box">
<h5>Total Results</h5>
<h2><%= resultCount != null ? resultCount : 0 %></h2>
</div>
</div>

</div>

<!-- 🔥 CHART -->
<div class="chart-box">
<h4>📊 Career Analytics</h4>
<canvas id="chart"></canvas>
</div>

<!-- 👤 USERS -->
<div class="chart-box">
<h4>Recent Users</h4>

<table class="table table-dark">
<tr><th>Name</th><th>Email</th></tr>

<% if(!users.isEmpty()){ %>

    <% for(Map<String,String> u : users){ %>
    <tr>
        <td><%= u.get("name") %></td>
        <td><%= u.get("email") %></td>
    </tr>
    <% } %>

<% } else { %>

<tr>
<td colspan="2" class="text-center">No users found</td>
</tr>

<% } %>

</table>

</div>

</div>

<!-- 🔥 CHART SCRIPT -->
<script>

new Chart(document.getElementById('chart'),{
type:'bar',
data:{
labels:[
'Data Scientist',
'Software Dev',
'UI/UX',
'Cyber Sec',
'AI',
'Marketing',
'Business',
'HR',
'Teacher',
'Sales',
'Entrepreneur'
],
datasets:[{
label:'Career Popularity',
data:[
<%= career.getOrDefault("Data Scientist",0) %>,
<%= career.getOrDefault("Software Dev",0) %>,
<%= career.getOrDefault("UI/UX",0) %>,
<%= career.getOrDefault("Cyber Sec",0) %>,
<%= career.getOrDefault("AI",0) %>,
<%= career.getOrDefault("Marketing",0) %>,
<%= career.getOrDefault("Business",0) %>,
<%= career.getOrDefault("HR",0) %>,
<%= career.getOrDefault("Teacher",0) %>,
<%= career.getOrDefault("Sales",0) %>,
<%= career.getOrDefault("Entrepreneur",0) %>
],
backgroundColor:[
'#00c6ff','#0072ff','#ff9800','#dc3545','#6f42c1',
'#20c997','#17a2b8','#ffc107','#6c757d','#fd7e14','#198754'
]
}]
}
});
</script>

</body>
</html>