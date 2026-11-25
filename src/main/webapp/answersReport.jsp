<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("admin")){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Question Wise Answers Report</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

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

    form,
    button,
    .no-print{

        display:none;
    }
}

</style>

</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-4">
🧠 Question ID Wise Answers Report
</h2>

<!-- FILTER -->

<form action="viewAnswers"
method="get"
class="row g-3 mb-4">

<div class="col-md-4">

<input type="number"
name="question_id"
class="form-control"
placeholder="Enter Question ID">

</div>

<div class="col-md-2">

<button class="btn btn-primary w-100">
Filter
</button>

</div>

<div class="col-md-2">

<button type="button"
onclick="printReport()"
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

<!-- TABLE -->

<table class="table table-bordered text-center">

<tr class="table-dark">

<th>ID</th>
<th>User</th>
<th>Question ID</th>
<th>Selected Answer</th>
<th>Date</th>

</tr>

<%
ArrayList<String[]> list =
(ArrayList<String[]>) request.getAttribute("data");

if(list != null && list.size() > 0){

    for(String[] row : list){
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

} else {
%>

<tr>

<td colspan="5">
No data found
</td>

</tr>

<%
}
%>

</table>

<div class="text-center mt-4 no-print">

<a href="adminReports.jsp"
class="btn btn-secondary">

⬅ Back

</a>

</div>

</div>

<script>

function printReport(){

    window.print();
}

</script>

</body>
</html>