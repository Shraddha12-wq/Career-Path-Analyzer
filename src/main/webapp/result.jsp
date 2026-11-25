<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*" %>

<%
Map<String,Integer> finalRoles =
(Map<String,Integer>) request.getAttribute("finalRoles");

String bestCareer =
(String) request.getAttribute("bestCareer");

String name =
(String) session.getAttribute("user");

if(finalRoles == null){

    response.sendRedirect("index.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Result</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
rel="stylesheet">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;500;700&display=swap"
rel="stylesheet">

<style>

body{

    background:#f4f4f4;
    font-family:'Poppins',sans-serif;
}

.container{

    margin-top:50px;
    text-align:center;
}

.bestCareer{

    font-size:48px;
    font-weight:700;
    color:#0d6efd;
}

.bar{

    background:#e6e6e6;
    border-radius:25px;

    width:80%;

    margin:15px auto;

    overflow:hidden;
}

.fill{

    height:34px;

    background:linear-gradient(
    90deg,
    #00c6ff,
    #0072ff
    );

    color:white;

    font-weight:500;

    padding-left:15px;

    line-height:34px;

    text-align:left;
}

.btn-custom{

    background:
    linear-gradient(
    45deg,
    #00c6ff,
    #0072ff
    );

    color:white;

    border:none;

    border-radius:30px;

    padding:12px 28px;

}

.btn-custom:hover{

    opacity:0.9;
}

</style>

</head>

<body>

<div class="container">


<h2>

👋 Hello <%= name %>

</h2>


<h3 class="mt-3">

🎯 Your Best Career

</h3>


<div class="bestCareer">

<%= bestCareer %>

</div>


<hr class="w-75 mx-auto mt-4">


<%

for(String career : finalRoles.keySet()){

int score = finalRoles.get(career);

%>

<div class="bar">

<div class="fill"

style="width:<%= score %>%">

<%= career %>

(<%= score %>%)

</div>

</div>

<%

}

%>


<p class="mt-4">

<i>

Click below to explore your career roadmap 🚀

</i>

</p>


<a href="roadmap.jsp?career=<%= bestCareer %>"

class="btn btn-custom">

🚀 View Career Roadmap

</a>


<br><br>


<a href="index.jsp"

class="btn btn-secondary">

🏠 Go to Dashboard

</a>


</div>

</body>
</html>