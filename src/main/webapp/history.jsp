<%@ page import="java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
List<Map<String,Object>> history = (List<Map<String,Object>>) request.getAttribute("history");
%>

<!DOCTYPE html>
<html>
<head>
<title>Test History</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
    background: linear-gradient(to right,#0f172a,#1e293b);
    color:white;
    font-family:'Poppins';
}

.card-box{
    background: rgba(255,255,255,0.08);
    padding:20px;
    border-radius:15px;
    margin-bottom:20px;
    backdrop-filter: blur(10px);
    box-shadow:0 0 15px rgba(0,198,255,0.2);
    transition:0.3s;
}
.card-box:hover{
    transform:translateY(-5px);
}

.badge-career{
    background: linear-gradient(45deg,#00c6ff,#0072ff);
    padding:6px 12px;
    border-radius:20px;
}

.btn-custom{
    background: linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
    color:white;
    border-radius:20px;
}
</style>
</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-4">📜 Your Test History</h2>

<% if(history == null || history.size() == 0){ %>

<div class="text-center">
    <h5>⚠️ No history found</h5>
    <a href="assessment.jsp" class="btn btn-custom">🚀 Start Test</a>
</div>

<% } else { %>

<% for(Map<String,Object> row : history){ %>

<div class="card-box">

<div class="row">

<div class="col-md-8">



<h5>📅 Test Date: <%= row.get("date") %></h5>

<p class="mt-2">
DS: <%= row.get("ds") %> |
Dev: <%= row.get("dev") %> |
UI: <%= row.get("ui") %> |
Cyber: <%= row.get("cyber") %> |
AI: <%= row.get("ai") %> |
DM: <%= row.get("dm") %>
<br>
BA: <%= row.get("ba") %> |
HR: <%= row.get("hr") %> |
Teacher: <%= row.get("teacher") %> |
Sales: <%= row.get("sales") %> |
Ent: <%= row.get("ent") %>
</p>

<span class="badge-career">
🏆 Best Career: <%= row.get("career") %>
</span>

</div>

<div class="col-md-4 text-end">

<a href="roadmap.jsp?career=<%= row.get("career") %>" 
   class="btn btn-success btn-sm mt-3">
   📌 Roadmap
</a>

<br>

<a href="courses?career=<%= row.get("career") %>" 
   class="btn btn-primary btn-sm mt-2">
   🎓 Courses
</a>

</div>

</div>

</div>

<% } %>
<% } %>

<div class="text-center mt-4">
<a href="index.jsp" class="btn btn-secondary">⬅ Back</a>
</div>

</div>

</body>
</html>