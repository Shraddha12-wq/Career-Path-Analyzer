<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
List<Map<String,String>> users =
(List<Map<String,String>>) request.getAttribute("users");
%>

<!DOCTYPE html>
<html>
<head>
<title>Users</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{background:#0f172a;color:white;}
.content{margin-left:240px;padding:20px;}
.sidebar{width:230px;height:100vh;position:fixed;background:#020617;}
.sidebar a{display:block;padding:15px;color:white;text-decoration:none;}
.sidebar a:hover{background:#00c6ff;}
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

<h2>Users</h2>

<table class="table table-dark">
<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Action</th>
</tr>

<% if(users != null && !users.isEmpty()){ %>

    <% for(Map<String,String> u : users){ %>
    <tr>
        <td><%= u.get("id") %></td>
        <td><%= u.get("name") %></td>
        <td><%= u.get("email") %></td>
        <td>
            <a href="admin_users?delete=<%= u.get("id") %>"
               onclick="return confirm('Delete user?')"
               class="btn btn-danger btn-sm">
               Delete
            </a>
        </td>
    </tr>
    <% } %>

<% } else { %>

<tr>
<td colspan="4" class="text-center">No users found</td>
</tr>

<% } %>

</table>

</div>

</body>
</html>