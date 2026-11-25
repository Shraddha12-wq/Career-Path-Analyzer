<%@ page contentType="text/html;charset=UTF-8" %>

<%
Integer userId = (Integer) session.getAttribute("user_id");

if(userId == null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Assessment</title>

<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Font -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap" rel="stylesheet">

<style>
body{
    background: linear-gradient(to right,#0f172a,#1e293b);
    font-family: 'Poppins', sans-serif;
    color:white;
}

/* Card */
.card-box{
    background: rgba(255,255,255,0.08);
    padding:25px;
    border-radius:15px;
    margin-bottom:20px;
}

/* Inputs */
input, select{
    border-radius:10px !important;
}

/* Button */
.btn-custom{
    background: linear-gradient(45deg,#00c6ff,#0072ff);
    border:none;
    padding:12px;
    border-radius:25px;
    color:white;
    font-size:18px;
    transition:0.3s;
}

.btn-custom:hover{
    transform:scale(1.05);
}

/* Checkbox spacing */
.form-check{
    margin-bottom:6px;
}
</style>

</head>

<body>

<div class="container mt-5">

<h2 class="text-center mb-4">🎯 Skills & Interest Assessment</h2>

<form action="<%= request.getContextPath() %>/saveAssessment" method="post">

<!-- 🔷 BASIC INFO -->
<div class="card-box">
<h5>📌 Basic Information</h5>

<input type="text" name="name" class="form-control mb-2" placeholder="Name" required>

<input type="number" name="age" class="form-control mb-2" placeholder="Age" required>

<select name="education" class="form-control" required>
<option value="">Select Education</option>
<option>10th</option>
<option>12th</option>
<option>Graduation</option>
<option>Post Graduation</option>
<option>Other</option>
</select>
</div>

<!-- 🔷 INTEREST -->
<div class="card-box">
<h5>💡 Interests</h5>

<div class="row">

<div class="col-md-6">

<div class="form-check">
<input type="checkbox" name="interest" value="Technical" class="form-check-input">
<label class="form-check-label">Technical / IT</label>
</div>

<div class="form-check">
<input type="checkbox" name="interest" value="Creative" class="form-check-input">
<label class="form-check-label">Creativity & Design</label>
</div>

<div class="form-check">
<input type="checkbox" name="interest" value="Analytical" class="form-check-input">
<label class="form-check-label">Analytical & Logical</label>
</div>

</div>

<div class="col-md-6">

<div class="form-check">
<input type="checkbox" name="interest" value="Business" class="form-check-input">
<label class="form-check-label">Business & Management</label>
</div>

<div class="form-check">
<input type="checkbox" name="interest" value="Social" class="form-check-input">
<label class="form-check-label">Social & Helping</label>
</div>

<div class="form-check">
<input type="checkbox" name="interest" value="Science" class="form-check-input">
<label class="form-check-label">Science & Medical</label>
</div>

</div>

</div>

<input type="text" name="otherInterest" class="form-control mt-2" placeholder="Other Interest (optional)">
</div>

<!-- 🔷 SKILLS -->
<div class="card-box">
<h5>🧠 Skills</h5>

<div class="row">

<%
String[][] skills = {
{"techSkill","Technical Skills"},
{"commSkill","Communication"},
{"logicSkill","Analytical"},
{"creativeSkill","Creativity"},
{"leadSkill","Leadership"},
{"socialSkill","Interpersonal"},
{"practicalSkill","Practical"}
};

for(int i=0;i<skills.length;i++){
%>

<div class="col-md-4 mb-2">
<select name="<%= skills[i][0] %>" class="form-control" required>
<option value=""><%= skills[i][1] %></option>
<option>Beginner</option>
<option>Intermediate</option>
<option>Advanced</option>
</select>
</div>

<% } %>

</div>
</div>

<!-- 🔷 WORK TYPE -->
<div class="card-box">
<h5>💼 Preferred Work Type</h5>

<div class="form-check">
<input type="radio" name="work" value="Technical" class="form-check-input" required>
<label class="form-check-label">Technical</label>
</div>

<div class="form-check">
<input type="radio" name="work" value="NonTechnical" class="form-check-input">
<label class="form-check-label">Non-Technical</label>
</div>

<div class="form-check">
<input type="radio" name="work" value="Both" class="form-check-input">
<label class="form-check-label">Both</label>
</div>

</div>

<!-- 🔷 SUBMIT -->
<button type="submit" class="btn btn-custom w-100">
🚀 Continue to Aptitude Test
</button>

</form>

</div>

</body>
</html>