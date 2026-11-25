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
<title>Assessment Report</title>

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
    form, button, .no-print {
        display: none;
    }
}
</style>

</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-4">📊 Assessment Report</h2>

<!-- FILTER -->
<form action="assessmentByDate" method="get" class="row g-3 mb-4">

<div class="col-md-2">
    <input type="date" name="from" id="from" class="form-control" required>
</div>

<div class="col-md-2">
    <input type="date" name="to" id="to" class="form-control" required>
</div>

<div class="col-md-3">

<select name="education" class="form-select">

<option value="">All Education</option>
<option>10th</option>
<option>12th</option>
<option>Graduation</option>
<option>Post Graduation</option>

</select>

</div>

<div class="col-md-2">
    <button class="btn btn-primary w-100">
        Filter
    </button>
</div>

<div class="col-md-1">
    <button type="button"
    onclick="exportPDF()"
    class="btn btn-danger w-100">
        PDF
    </button>
</div>

<div class="col-md-2">
    <button type="button"
    onclick="printReport()"
    class="btn btn-success w-100">
        Print
    </button>
</div>

</form>

<!-- TABLE -->
<div class="table-responsive">

<table class="table table-bordered table-striped text-center">

<tr class="table-dark">
    <th>ID</th>
    <th>Name</th>
    <th>Age</th>
    <th>Education</th>
    <th>Interests</th>
    <th>Other</th>

    <th>Tech</th>
    <th>Comm</th>
    <th>Logic</th>
    <th>Creative</th>
    <th>Leadership</th>
    <th>Social</th>
    <th>Practical</th>

    <th>Work Type</th>
    <th>Date</th>
</tr>

<%
ArrayList<String[]> list = (ArrayList<String[]>) request.getAttribute("data");

if(list != null && list.size() > 0){
    for(String[] row : list){
%>

<tr>
    <td><%= row[0] %></td>
    <td><%= row[1] %></td>
    <td><%= row[2] %></td>
    <td><%= row[3] %></td>
    <td><%= row[4] %></td>
    <td><%= row[5] %></td>

    <td><%= row[6] %></td>
    <td><%= row[7] %></td>
    <td><%= row[8] %></td>
    <td><%= row[9] %></td>
    <td><%= row[10] %></td>
    <td><%= row[11] %></td>
    <td><%= row[12] %></td>

    <td><%= row[13] %></td>
    <td><%= row[14] %></td>
</tr>

<%
    }
} else {
%>

<tr>
    <td colspan="15">No records found</td>
</tr>

<%
}
%>

</table>

</div>

<div class="text-center mt-4 no-print">
    <a href="adminReports.jsp" class="btn btn-warning">⬅ Back</a>
</div>

</div>

<script>
function exportPDF(){
    let from = document.getElementById("from").value;
    let to = document.getElementById("to").value;

    if(from && to){
        window.open("exportAssessmentPDF?from=" + from + "&to=" + to, "_blank");
    } else {
        alert("Select date range first!");
    }
}

function printReport(){
    window.print();
}
</script>

</body>
</html>