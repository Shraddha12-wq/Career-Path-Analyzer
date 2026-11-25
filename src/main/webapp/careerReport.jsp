<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
String role = (String) session.getAttribute("role");
if(role == null || !role.equals("admin")){
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Career Report</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background:#0f172a;
    color:white;
}
.table{
    background:white;
    color:black;
}
@media print {
    form, button { display:none; }
}
</style>
</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-4">📊 Career Wise Report</h2>

<form action="careerReport" method="get" class="row g-3 mb-4">

<div class="col-md-3">
<select name="career" class="form-control">
<option value="">All Career</option>
<option>Data Scientist</option>
<option>Software Developer</option>
<option>UI/UX</option>
<option>Cyber Security</option>
<option>AI Engineer</option>
</select>
</div>

<div class="col-md-3">
<input type="date" name="from" class="form-control">
</div>

<div class="col-md-3">
<input type="date" name="to" class="form-control">
</div>

<div class="col-md-3">
<button class="btn btn-primary w-100">Filter</button>
</div>

</form>

<table class="table table-bordered text-center">

<tr class="table-dark">
<th>ID</th>
<th>User</th>
<th>Career</th>
<th>Date</th>
</tr>

<%
ArrayList<String[]> list = (ArrayList<String[]>) request.getAttribute("data");

if(list != null){
    for(String[] row : list){
%>

<tr>
<td><%= row[0] %></td>
<td><%= row[1] %></td>
<td><%= row[2] %></td>
<td><%= row[8] %></td>
</tr>

<%
    }
}
%>

</table>

<div class="text-center mt-3">
<button onclick="window.print()" class="btn btn-success">Print</button>
<button onclick="exportPDF()" class="btn btn-danger">PDF</button>
</div>

</div>

<script>
function exportPDF(){
    let career = document.querySelector("[name=career]").value;
    window.open("exportCareerPDF?career=" + career);
}
</script>

</body>
</html>