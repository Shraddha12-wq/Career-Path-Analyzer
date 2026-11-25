<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
List<Map<String,Object>> reports =
(List<Map<String,Object>>)request.getAttribute("reports");

if(reports==null){
    response.sendRedirect("index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>User Wise Career Report</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{
    background:#f4f6f9;
    font-family:'Poppins',sans-serif;
}

.container{
    margin-top:50px;
}

.title{
    text-align:center;
    color:#0d6efd;
    font-weight:bold;
    margin-bottom:30px;
}

.table-box{

    background:white;
    padding:25px;

    border-radius:20px;

    box-shadow:
    0 5px 20px rgba(0,0,0,0.15);

}

.table th{

    background:#0d6efd;
    color:white;
}

.badge-career{

    background:#198754;
    padding:8px 15px;
    border-radius:20px;
    color:white;
}

</style>

</head>

<body>

<div class="container">

<h2 class="title">
📊 User Wise Career Report
</h2>

<div class="table-box">

<table class="table table-bordered table-hover text-center">

<thead>

<tr>

<th>User Name</th>

<th>Education</th>

<th>Work Type</th>

<th>Total Questions</th>

<th>Correct Answers</th>

<th>Percentage</th>

<th>Recommended Career</th>

</tr>

</thead>

<tbody>

<%
for(Map<String,Object> row : reports){
%>

<tr>

<td>
<%= row.get("name") %>
</td>

<td>
<%= row.get("education") %>
</td>

<td>
<%= row.get("work_type") %>
</td>

<td>
<%= row.get("total_questions") %>
</td>

<td>
<%= row.get("total_score") %>
</td>

<td>

<%= row.get("percentage") %> %

</td>

<td>

<span class="badge-career">

<%= row.get("career") %>

</span>

</td>

</tr>

<%
}
%>

</tbody>

</table>

<div class="text-center mt-4">

<a href="index.jsp"
class="btn btn-primary">

🏠 Back to Home

</a>

</div>

</div>

</div>

</body>
</html>