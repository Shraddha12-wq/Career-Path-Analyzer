<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
String role =
(String)session.getAttribute("role");

if(role == null ||
   !role.equals("admin")){

    response.sendRedirect("login.jsp");
    return;
}

ArrayList<String[]> reportData =
(ArrayList<String[]>)request.getAttribute("reportData");
%>

<!DOCTYPE html>
<html>
<head>

<title>Aptitude Assessment Report</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{
    background:#0f172a;
    color:white;
}

.report-box{
    background:#1e293b;
    padding:30px;
    border-radius:15px;
    margin-top:30px;
}

.table{
    background:white;
    color:black;
}

@media print{
    .no-print{
        display:none;
    }
}

</style>

</head>

<body>

<div class="container">

<div class="report-box">

<h2 class="text-center mb-4">
🧠 Aptitude Assessment Report
</h2>

<form action="viewAptitudeReport"
method="get"
class="row g-3 mb-4 no-print">

<div class="col-md-3">

<input type="date"
name="startDate"
class="form-control">

</div>

<div class="col-md-3">

<input type="date"
name="endDate"
class="form-control">

</div>

<div class="col-md-2">

<button class="btn btn-primary w-100">
Search
</button>

</div>

<div class="col-md-2">

<button type="button"
onclick="window.print()"
class="btn btn-success w-100">

Print

</button>

</div>

<div class="col-md-2">

<a href="adminReports.jsp"
class="btn btn-warning w-100">

Back

</a>

</div>

</form>

<table class="table table-bordered text-center">

<tr class="table-dark">

<th>Record ID</th>
<th>Student Name</th>
<th>Question No</th>
<th>Selected Option</th>
<th>Submission Date</th>

</tr>

<%
if(reportData != null &&
   !reportData.isEmpty()){

    for(String[] row : reportData){
%>

<tr>

<td><%= row[0] %></td>
<td><%= row[1] %></td>
<td><%= row[2] %></td>
<td><%= row[3] %></td>
<td><%= row[4] %></td>

</tr>

<%
    }
}else{
%>

<tr>

<td colspan="5">
No Records Found
</td>

</tr>

<%
}
%>

</table>

</div>

</div>

</body>
</html>