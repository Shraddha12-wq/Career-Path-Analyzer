
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<title>Add Course</title>

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
<a href="courses">Courses</a>
<a href="logout">Logout</a>
</div>

<div class="content">

<h2>➕ Add Course</h2>

<div class="form-box mt-4">

<form action="addCourse" method="post">

<input type="text" name="title" placeholder="Course Title" class="form-control mb-3" required>

<select name="career" class="form-control mb-3">
<option>Data Scientist</option>
<option>Software Developer</option>
<option>UI/UX Designer</option>
<option>Cyber Security Analyst</option>
<option>AI Engineer</option>
<option>Digital Marketer</option>
<option>Business Analyst</option>
<option>HR Manager</option>
<option>Teacher</option>
<option>Sales & Marketing</option>
<option>Entrepreneur</option>
</select>

<textarea name="description" placeholder="Description" class="form-control mb-3"></textarea>

<input type="text" name="link" placeholder="Course Link" class="form-control mb-3">

<input type="text" name="image" placeholder="Image URL" class="form-control mb-3">

<button class="btn btn-success">Add Course</button>

</form>

</div>

</div>

</body>
</html>