<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
List<Map<String,String>> feedbacks =
(List<Map<String,String>>) request.getAttribute("feedbacks");

if(feedbacks == null) feedbacks = new ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Feedback</title>

<meta charset="UTF-8">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{background:#0f172a;color:white;font-family:Poppins;}
.sidebar{width:230px;height:100vh;position:fixed;background:#020617;}
.sidebar a{display:block;padding:15px;color:white;text-decoration:none;}
.sidebar a:hover{background:#00c6ff;}
.content{margin-left:240px;padding:20px;}
.box{background:rgba(255,255,255,0.08);padding:20px;border-radius:15px;margin-top:20px;}
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

<div class="content">

<h2 class="mt-4">&#11088; User Feedback</h2>

<div class="box">

<table class="table table-dark">

<tr>
<th>Name</th>
<th>Feedback</th>
<th>Rating</th>
</tr>

<% if(!feedbacks.isEmpty()){ %>

    <% for(Map<String,String> f : feedbacks){ %>
    <tr>
        <td><%= f.get("name") %></td>
        <td><%= f.get("message") %></td>
        <td>&#11088; <%= f.get("rating") %>/5</td>
    </tr>
    <% } %>

<% } else { %>

<tr>
<td colspan="3" class="text-center">No feedback found</td>
</tr>

<% } %>

</table>

</div>

</div>

</body>
</html>