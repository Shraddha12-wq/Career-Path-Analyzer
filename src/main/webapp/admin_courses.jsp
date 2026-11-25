<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
List<Map<String,String>> courses =
(List<Map<String,String>>) request.getAttribute("courses");

if(courses == null) courses = new ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
<title>Courses</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{background:#0f172a;color:white;font-family:Poppins;}
.sidebar{width:230px;height:100vh;position:fixed;background:#020617;}
.sidebar a{display:block;padding:15px;color:white;text-decoration:none;}
.sidebar a:hover{background:#00c6ff;}
.content{margin-left:240px;padding:20px;}
.table{background:#020617;}
.btn{border-radius:20px;}
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

<h2>📚 Courses</h2>

<a href="admin_add_course.jsp" class="btn btn-success mb-3">
➕ Add Course
</a>

<table class="table table-dark table-bordered">

<tr>
<th>ID</th>
<th>Title</th>
<th>Career</th>
<th>Actions</th>
</tr>

<% if(!courses.isEmpty()){ %>

    <% for(Map<String,String> row : courses){ %>

    <tr>
        <td><%= row.get("id") %></td>
        <td><%= row.get("title") %></td>
        <td><%= row.get("career") %></td>

        <td>

        <!-- 👁 VIEW -->
        <a href="<%= row.get("link") %>" target="_blank"
           class="btn btn-info btn-sm">👁 View</a>

        <!-- ✏ EDIT -->
       <a href="edit_course?id=<%= row.get("id") %>" 
   class="btn btn-warning btn-sm">✏ Edit</a>

        <!-- 🗑 DELETE -->
        <a href="admin_courses?delete=<%= row.get("id") %>"
           class="btn btn-danger btn-sm"
           onclick="return confirm('Delete this course?')">
           🗑 Delete
        </a>

        </td>
    </tr>

    <% } %>

<% } else { %>

<tr>
<td colspan="4" class="text-center">No courses found</td>
</tr>

<% } %>

</table>

</div>

</body>
</html>