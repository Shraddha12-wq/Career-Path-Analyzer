<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.career.Question" %>

<%
List<Question> questions =
(List<Question>) request.getAttribute("questions");

if(questions == null){
    response.sendRedirect("assessment.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Basic Aptitude Test</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap"
rel="stylesheet">

<style>

body{
    background:linear-gradient(to right,#0f172a,#1e293b);
    font-family:'Poppins',sans-serif;
    color:white;
}

.test-box{
    background:rgba(255,255,255,0.08);
    padding:30px;
    border-radius:15px;
    margin-top:40px;
    margin-bottom:40px;
}

.question-card{
    background:#1e293b;
    padding:20px;
    border-radius:12px;
    margin-bottom:20px;
    box-shadow:0 0 10px rgba(0,0,0,0.3);
}

.question-title{
    color:#38bdf8;
    font-weight:600;
}

.option{
    margin-top:10px;
    padding:8px;
}

.option:hover{
    background:#334155;
    border-radius:8px;
}

.btn-submit{
    background:linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
    padding:12px 30px;
    color:white;
    border-radius:25px;
    font-size:18px;
}

.btn-submit:hover{
    transform:scale(1.05);
}

</style>

</head>

<body>

<div class="container">

<div class="test-box">

<h2 class="text-center mb-4">
📝 Basic Aptitude Assessment
</h2>

<form action="<%=request.getContextPath()%>/saveBasicAnswers"
method="post">

<%
for(Question q : questions){
%>

<div class="question-card">

<h5 class="question-title">
Q<%= q.getId() %>. <%= q.getQuestion() %>
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
class="btn btn-submit">

🚀 Submit Test

</button>

</div>

</form>

</div>

</div>

</body>
</html>