<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.ResultSet" %>

<%
ResultSet q = (ResultSet) request.getAttribute("editData");
%>

<!DOCTYPE html>
<html>
<head>
<title>Edit Question</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{background:#0f172a;color:white;font-family:Poppins;}
.form-box{
    background:rgba(255,255,255,0.08);
    padding:25px;
    border-radius:15px;
    margin-top:50px;
}
</style>
</head>

<body>

<div class="container">

<div class="form-box">

<h3>✏ Edit Question</h3>

<form action="updateQuestion" method="post">

<input type="hidden" name="id" value="<%= q.getInt("id") %>">

<input type="text" name="question" value="<%= q.getString("question") %>" class="form-control mb-3">

<input type="text" name="option1" value="<%= q.getString("option1") %>" class="form-control mb-3">
<input type="text" name="option2" value="<%= q.getString("option2") %>" class="form-control mb-3">
<input type="text" name="option3" value="<%= q.getString("option3") %>" class="form-control mb-3">
<input type="text" name="option4" value="<%= q.getString("option4") %>" class="form-control mb-3">

<input type="text" name="correct_answer" value="<%= q.getString("correct_answer") %>" class="form-control mb-3">

<button class="btn btn-warning">Update</button>

</form>

</div>

</div>

</body>
</html>