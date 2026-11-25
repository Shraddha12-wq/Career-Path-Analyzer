<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
List<Map<String,String>> questions = 
(List<Map<String,String>>) request.getAttribute("questions");
%>

<!DOCTYPE html>
<html>
<head>
<title>Questions</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{background:#0f172a;color:white;font-family:Poppins;}
.container{margin-top:50px;}
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
<div class="container">

<h2>Questions</h2>

<a href="add_question.jsp" class="btn btn-success mb-3">Add Question</a>

<table class="table table-dark table-bordered">

<tr>
<th>ID</th>
<th>Question</th>
<th>Action</th>
</tr>

<% if(questions != null){ 
   for(Map<String,String> q : questions){ %>

<tr>
<td><%= q.get("id") %></td>
<td><%= q.get("question") %></td>

<td>
<a href="questions?edit=<%= q.get("id") %>" 
   class="btn btn-warning btn-sm">Edit</a>

<a href="questions?delete=<%= q.get("id") %>" 
   class="btn btn-danger btn-sm"
   onclick="return confirm('Delete this question?')">
   Delete
</a>
</td>

</tr>

<% } } %>

</table>

</div>

</body>
</html>