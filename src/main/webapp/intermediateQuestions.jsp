<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.career.Question" %>

<%
Integer userId = (Integer)session.getAttribute("user_id");

if(userId == null){
    response.sendRedirect("login.jsp");
    return;
}

List<Question> questions =
(List<Question>)request.getAttribute("questions");

if(questions == null || questions.isEmpty()){
    response.sendRedirect("assessment.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Intermediate Assessment Test</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{
    background:linear-gradient(to right,#0f172a,#1e293b);
    color:white;
    font-family:'Poppins',sans-serif;
}

.test-box{
    background:rgba(255,255,255,0.08);
    padding:30px;
    border-radius:15px;
    margin-top:40px;
}

.question-card{
    background:#1e293b;
    padding:20px;
    border-radius:12px;
    margin-bottom:20px;
}

.option{
    margin-top:10px;
    padding:8px;
}

.option:hover{
    background:#334155;
    border-radius:8px;
}

.btn-custom{
    background:linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
    color:white;
    border-radius:25px;
    padding:12px 30px;
}

.btn-custom:hover{
    transform:scale(1.03);
}

</style>

</head>

<body>

<div class="container">

<div class="test-box">

<h2 class="text-center mb-4">
📘 Intermediate Assessment Test
</h2>

<div class="alert alert-info">
Level : 12th Students
</div>

<form action="saveIntermediateAnswers" method="post">

<%
int count = 1;

for(Question q : questions){
%>

<div class="question-card">

<input type="hidden"
name="questionId"
value="<%= q.getId() %>">

<h5>
Q<%= count++ %>.
<%= q.getQuestion() %>
</h5>

<div class="option">
<input type="radio"
name="q<%= q.getId() %>"
value="<%= q.getOption1() %>"
required>

<%= q.getOption1() %>
</div>

<div class="option">
<input type="radio"
name="q<%= q.getId() %>"
value="<%= q.getOption2() %>">

<%= q.getOption2() %>
</div>

<div class="option">
<input type="radio"
name="q<%= q.getId() %>"
value="<%= q.getOption3() %>">

<%= q.getOption3() %>
</div>

<div class="option">
<input type="radio"
name="q<%= q.getId() %>"
value="<%= q.getOption4() %>">

<%= q.getOption4() %>
</div>

</div>

<%
}
%>

<div class="text-center mt-4">

<button type="submit"
class="btn btn-custom">

🚀 Submit Intermediate Test

</button>

</div>

</form>

</div>

</div>

</body>
</html>