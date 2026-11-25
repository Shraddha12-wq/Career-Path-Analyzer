<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<%
List<Map<String,String>> contacts =
(List<Map<String,String>>) request.getAttribute("contacts");

if(contacts == null) contacts = new ArrayList<>();
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin - Contact Messages</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

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
}

.table{
    background:#020617;
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

<h2>📩 Contact Messages</h2>

<div class="card-box mt-4">

<table class="table table-dark table-bordered">

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Message</th>
<th>Date</th>
</tr>

<% if(!contacts.isEmpty()){ %>

    <% for(Map<String,String> c : contacts){ %>

    <tr>
        <td><%= c.get("id") %></td>
        <td><%= c.get("name") %></td>
        <td><%= c.get("email") %></td>
        <td><%= c.get("message") %></td>
        <td><%= c.get("date") %></td>
    </tr>

    <% } %>

<% } else { %>

<tr>
<td colspan="5" class="text-center">No messages found</td>
</tr>

<% } %>

</table>

</div>

</div>

</body>
</html>