<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
Map<String,String> c = (Map<String,String>) request.getAttribute("course");
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Course</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{background:#0f172a;color:white;font-family:Poppins;}
.sidebar{width:230px;height:100vh;position:fixed;background:#020617;}
.sidebar a{display:block;padding:15px;color:white;text-decoration:none;}
.sidebar a:hover{background:#00c6ff;}
.content{margin-left:240px;padding:20px;}
.form-box{background:rgba(255,255,255,0.08);padding:25px;border-radius:15px;}
</style>
</head>

<body>

<div class="sidebar">
<h4 class="text-center mt-3">Admin Panel</h4>
<a href="admin">Dashboard</a>
<a href="admin_courses">Courses</a>
<a href="logout">Logout</a>
</div>

<div class="content">

<h2>✏ Edit Course</h2>

<div class="form-box mt-4">

<% if(c != null){ %>

<form action="update_course" method="post">

<input type="hidden" name="id" value="<%= c.get("id") %>">

<input type="text" name="title" 
value="<%= c.get("title") %>" 
class="form-control mb-3" placeholder="Title">

<input type="text" name="career" 
value="<%= c.get("career") %>" 
class="form-control mb-3" placeholder="Career">

<textarea name="description" class="form-control mb-3">
<%= c.get("description") %>
</textarea>

<input type="text" name="link" 
value="<%= c.get("link") %>" 
class="form-control mb-3" placeholder="Video Link">

<input type="text" name="image" 
value="<%= c.get("image") %>" 
class="form-control mb-3" placeholder="Image URL">

<button class="btn btn-warning">Update Course</button>

</form>

<% } else { %>

<h4 class="text-danger">❌ Course not found!</h4>

<% } %>

</div>

</div>

</body>
</html>