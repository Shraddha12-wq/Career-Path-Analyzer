<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
String role = (String) session.getAttribute("role");

if(role == null || !role.equals("admin")){
    response.sendRedirect("login.jsp");
    return;
}

ArrayList<String[]> list =
(ArrayList<String[]>) request.getAttribute("data");
%>

<!DOCTYPE html>
<html>
<head>

<title>Rating Wise Feedback Report</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{
    background:#071739;
    color:white;
}

.box{
    background:#0b1b45;
    padding:30px;
    border-radius:15px;
    margin-top:30px;
}

table{
    background:white;
}

.btn{
    border-radius:8px;
}

</style>

<script>
function printReport(){
    window.print();
}
</script>

</head>

<body>

<div class="container">

<div class="box">

<h2 class="text-center mb-4">
⭐ Rating Wise Feedback Report
</h2>

<!-- FILTER -->

<form action="viewFeedback"
method="get"
class="row mb-4">

<div class="col-md-4">

<select name="rating"
class="form-select">

<option value="">Select Rating</option>

<option value="5">⭐⭐⭐⭐⭐ 5 Star</option>

<option value="4">⭐⭐⭐⭐ 4 Star</option>

<option value="3">⭐⭐⭐ 3 Star</option>

<option value="2">⭐⭐ 2 Star</option>

<option value="1">⭐ 1 Star</option>

</select>

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

<table class="table table-bordered table-hover text-center">

<tr class="table-dark">

<th>ID</th>
<th>User ID</th>
<th>Rating</th>
<th>Comment</th>
<th>Date</th>

</tr>

<%
if(list != null){

    for(String[] row : list){
%>

<tr>

<td><%= row[0] %></td>

<td><%= row[1] %></td>

<td>

<%
int r = Integer.parseInt(row[2]);

for(int i=1; i<=r; i++){
    out.print("⭐");
}
%>

</td>

<td><%= row[3] %></td>

<td><%= row[4] %></td>

</tr>

<%
    }
}
%>

</table>

</div>

</div>

</body>
</html>