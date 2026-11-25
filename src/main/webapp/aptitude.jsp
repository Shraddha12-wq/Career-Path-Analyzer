<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.sql.*" %>

<%
Integer userId = (Integer) session.getAttribute("user_id");

if(userId == null){
    response.sendRedirect("login.jsp");
    return;
}

// 🔗 DB Connection
Connection con = com.career.DBConnection.getConnection();

// Fetch questions
PreparedStatement ps = con.prepareStatement("SELECT * FROM questions");
ResultSet rs = ps.executeQuery();

// Count total questions
int total = 0;
ResultSet countRs = con.createStatement().executeQuery("SELECT COUNT(*) FROM questions");
if(countRs.next()){
    total = countRs.getInt(1);
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Aptitude Test</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: radial-gradient(circle at top, #0f172a, #020617);
    color:white;
    font-family: 'Poppins', sans-serif;
}

.quiz-box{
    max-width:800px;
    margin:80px auto;
}

.title{
    text-align:center;
    font-size:32px;
    margin-bottom:10px;
}

.progress-text{
    text-align:center;
    margin-bottom:20px;
    color:#94a3b8;
}

.card-box{
    background: rgba(255,255,255,0.05);
    padding:40px;
    border-radius:20px;
    backdrop-filter: blur(15px);
    box-shadow: 0 0 25px rgba(0, 200, 255, 0.3);
}

.question{
    font-size:20px;
    margin-bottom:20px;
}

.option{
    display:block;
    padding:12px 15px;
    margin:10px 0;
    border-radius:10px;
    cursor:pointer;
    transition:0.3s;
    border:1px solid transparent;
}

.option:hover{
    background: rgba(0,198,255,0.2);
    border:1px solid #00c6ff;
}

.btn-nav{
    padding:10px 25px;
    border-radius:10px;
}

.next{
    background: linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
}

.prev{
    background:#6c757d;
    border:none;
}

.hidden{
    display:none;
}
</style>

</head>

<body>

<div class="quiz-box">

<h2 class="title">✨ Aptitude Test</h2>
<p class="progress-text" id="progress">Question 1 of <%= total %></p>

<form action="<%= request.getContextPath() %>/submitAptitude" method="post">

<%
int i = 0;
while(rs.next()){
%>

<div class="card-box question-box <%= (i==0) ? "" : "hidden" %>">

<div class="question">
Q<%= i+1 %>. <%= rs.getString("question") %>
</div>

<label class="option">
<input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option1") %>" required>
<%= rs.getString("option1") %>
</label>

<label class="option">
<input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option2") %>">
<%= rs.getString("option2") %>
</label>

<label class="option">
<input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option3") %>">
<%= rs.getString("option3") %>
</label>

<label class="option">
<input type="radio" name="q<%= rs.getInt("id") %>" value="<%= rs.getString("option4") %>">
<%= rs.getString("option4") %>
</label>

</div>

<%
i++;
}
%>

<div class="d-flex justify-content-between mt-4">

<button type="button" id="prevBtn" class="btn btn-nav prev" onclick="prevQ()">⬅ Previous</button>

<button type="button" class="btn btn-nav next" onclick="nextQ()">Next ➡</button>

<button type="submit" id="submitBtn" class="btn btn-success hidden">Submit</button>

</div>

</form>

</div>

<script>
let current = 0;
let questions = document.querySelectorAll(".question-box");
let total = questions.length;

function showQ(index){
    questions.forEach((q,i)=>{
        q.classList.toggle("hidden", i !== index);
    });

    document.getElementById("progress").innerText = 
        "Question " + (index+1) + " of " + total;

    if(index === total-1){
        document.getElementById("submitBtn").classList.remove("hidden");
    } else {
        document.getElementById("submitBtn").classList.add("hidden");
    }

    document.getElementById("prevBtn").disabled = (index === 0);
}

function nextQ(){
    let selected = questions[current].querySelector("input[type='radio']:checked");

    if(!selected){
        alert("⚠ Please select an option!");
        return;
    }

    if(current < total-1){
        current++;
        showQ(current);
    }
}

function prevQ(){
    if(current > 0){
        current--;
        showQ(current);
    }
}

showQ(0);
</script>

</body>
</html>