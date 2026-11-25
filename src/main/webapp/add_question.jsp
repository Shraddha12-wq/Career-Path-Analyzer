<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<title>Add Question</title>

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

<h3>Add Question</h3>

<form action="addQuestion" method="post">

<input type="text" name="question" placeholder="Question" class="form-control mb-3" required>

<input type="text" name="option1" placeholder="Option 1" class="form-control mb-3">
<input type="text" name="option2" placeholder="Option 2" class="form-control mb-3">
<input type="text" name="option3" placeholder="Option 3" class="form-control mb-3">
<input type="text" name="option4" placeholder="Option 4" class="form-control mb-3">

<input type="text" name="correct_answer" placeholder="Correct Answer" class="form-control mb-3">

<button class="btn btn-success">Add Question</button>

</form>

</div>

</div>

</body>
</html>