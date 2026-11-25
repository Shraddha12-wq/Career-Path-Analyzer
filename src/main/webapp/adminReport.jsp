<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Assessment Report</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{
    background:#f4f6f9;
    font-family:Poppins;
}

.container{
    margin-top:50px;
}

.card{
    border:none;
    border-radius:15px;
    box-shadow:0px 2px 10px rgba(0,0,0,0.1);
}

.table th{
    background:#212529;
    color:white;
}

h2{
    font-weight:bold;
}

</style>

</head>

<body>

<div class="container">

<div class="card p-4">

<h2 class="text-center mb-4">
📊 User Wise Assessment Report
</h2>

<table class="table table-bordered table-hover">

<thead>

<tr>
    <th>Name</th>
    <th>Education</th>
    <th>Work Type</th>
    <th>Total Questions</th>
    <th>Score</th>
    <th>Percentage</th>
</tr>

</thead>

<tbody>

<%

try{

    Connection con =
    com.career.DBConnection.getConnection();

    PreparedStatement ps =
    con.prepareStatement(

    "SELECT a.name, " +
    "a.education, " +
    "a.work_type, " +
    "COUNT(ap.id) total_questions, " +
    "SUM(ap.score) total_score, " +
    "ROUND((SUM(ap.score)*100.0)/COUNT(ap.id),2) percentage " +
    "FROM assessment a " +
    "JOIN aptitude_answers ap " +
    "ON a.user_id = ap.user_id " +
    "AND a.education = ap.education " +
    "GROUP BY a.id " +
    "ORDER BY a.name"

    );

    ResultSet rs = ps.executeQuery();

    while(rs.next()){

%>

<tr>

<td>
<%= rs.getString("name") %>
</td>

<td>
<%= rs.getString("education") %>
</td>

<td>
<%= rs.getString("work_type") %>
</td>

<td>
<%= rs.getInt("total_questions") %>
</td>

<td>
<%= rs.getInt("total_score") %>
</td>

<td>
<%= rs.getDouble("percentage") %> %
</td>

</tr>

<%

    }

}
catch(Exception e){

    out.println("<tr><td colspan='6'>Error : "
    + e.getMessage()
    + "</td></tr>");
}

%>

</tbody>

</table>

</div>

</div>

</body>
</html>