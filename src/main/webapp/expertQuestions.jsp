<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.career.Question" %>

<%
Integer userId =
(Integer)session.getAttribute("user_id");

if(userId == null){
    response.sendRedirect("login.jsp");
    return;
}

List<Question> questions =
(List<Question>)request.getAttribute("questions");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Expert Assessment Test</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{
    background:#0f172a;
    color:white;
    font-family:'Poppins',sans-serif;
}

.card-box{
    background:#1e293b;
    padding:25px;
    border-radius:15px;
    margin-top:40px;
}

.question-card{
    background:#334155;
    padding:20px;
    border-radius:10px;
    margin-bottom:20px;
}

.option{
    margin-top:10px;
}

.btn-custom{
    background:linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
    color:white;
    padding:12px 30px;
    border-radius:25px;
}

</style>

</head>

<body>

<div class="container">

<div class="card-box">

<h2 class="text-center mb-4">
🎓 Expert Level Aptitude Test
</h2>

<form action="saveExpertAnswers"
method="post">

<%
int count = 1;

for(Question q : questions){
%>

<div class="question-card">

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

<div class="text-center">

<button type="submit"
class="btn btn-custom">

🚀 Submit Expert Test

</button>

</div>

</form>

</div>

</div>

</body>
</html>