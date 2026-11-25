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
<title>Contact Report</title>

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
        display:none;
    }
}
</style>
</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-4">📞 Contact Messages Report</h2>

<form action="viewContacts" method="get" class="row g-3 mb-4">

<div class="col-md-3">
<input type="date" name="from" id="from" class="form-control">
</div>

<div class="col-md-3">
<input type="date" name="to" id="to" class="form-control">
</div>

<div class="col-md-2">
<button class="btn btn-primary w-100">Filter</button>
</div>

<div class="col-md-2">
<button type="button" onclick="exportPDF()" class="btn btn-danger w-100">
PDF
</button>
</div>

<div class="col-md-2">
<button type="button" onclick="printReport()" class="btn btn-success w-100">
Print
</button>
</div>

</form>

<table class="table table-bordered text-center">

<tr class="table-dark">
<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Message</th>
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
</tr>

<%
    }
} else {
%>

<tr>
<td colspan="5">No data found</td>
</tr>

<%
}
%>

</table>

<div class="text-center mt-4 no-print">
<a href="adminReports.jsp" class="btn btn-warning">⬅ Back</a>
</div>

</div>

<script>
function exportPDF(){
    let from = document.getElementById("from").value;
    let to = document.getElementById("to").value;

    window.open("exportContactPDF?from=" + from + "&to=" + to);
}

function printReport(){
    window.print();
}
</script>

</body>
</html>