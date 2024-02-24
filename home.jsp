<%@ page import="java.sql.SQLException"%>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="net.gym.database.DbConn" %>
<%@ page import="net.gym.model.User" %>
<%
Connection con=null;
con=DbConn.connect();
PreparedStatement pst=con.prepareStatement("select * from user where uname=? and password=?");
String pass=String.valueOf(session.getAttribute("pass"));
String name=String.valueOf(session.getAttribute("uname"));
pst.setString(1,name);
pst.setString(2,pass);
ResultSet num=pst.executeQuery();
boolean fg=num.next();
if(fg)
{
	session.setAttribute("userid",num.getInt(1));
}
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Trirong">
<link rel="stylesheet" href="css/slideshow.css">
<link rel="stylesheet" href="css/navbar.css">
<title>Home page</title>
<style>
html{
	  scroll-behavior: smooth;
    }
body {
	  font-family: "Trirong", serif;
	 }
.logo {
	    width: 150px;
	    height: 100px;
}
</style>
</head>
<body>

<!-- sql checking -->
<%  if(session.getAttribute("user")=="user"){
if(fg)
    {
	out.println("query Ok!"+num.getInt(1));
	}
}
%>
<%=session.getAttribute("userid")%>

<input type="hidden" id="status" value="<%=request.getAttribute("status")%>">
<%  if(session.getAttribute("uname")!=null){
	%>
 <font style="cursive"> <p align="right">welcome  <%=name%></p></font>
  <% } %>
<div > <img class="logo" src="logo.png"> </div>
<ul>
</li>
<jsp:include page="logoutv.jsp"/>  <!-- login and logout logic -->
</li>
  <li><a href="comm.jsp">News</a></li>

  <%if(session.getAttribute("admin")!="admin")
  {%>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">About us</a>
    <div class="dropdown-content">
      <a href="#">Our Approach</a>
      <a href="#">Contact</a>
      <a href="#">Our trainers</a>
    </div>
    <%} %>
  <li><a href="sales.jsp">Shop</a></li>


</li>
<jsp:include page="profilev.jsp"/>  <!-- login and logout logic -->
</li>
  <li><a href="#home">Home</a></li>

</ul>
<br>
<div class="slideshow-container">
  <div class="mySlides1">
    <img src="https://goldsgym.in/uploads/slider/compress-compress-GGAppdownloadebbanner-01.jpeg" style="width:100%">
  </div>

  <div class="mySlides1">
    <img src="https://goldsgym.in/uploads/slider/compress-GGFI%20Loan%20web%20banner.jpg" style="width:100%">
  </div>

  <a class="prev" onclick="plusSlides(-1, 0)">&#10094;</a>
  <a class="next" onclick="plusSlides(1, 0)">&#10095;</a>
</div><br>
<h2 align="center"> We can give you </h2> <h1 align="center" style="color: #ffc800;margin-top: -25px;"> Much more than others </h1>

    
    <section class="services">
        <div class="services-box">
            <i class="fas fa-shipping-fast"></i>
            <span>Free Shipping</span>
            <p>Free Shipping for all US order</p>
        </div>
        <div class="services-box">
            <i class="fas fa-headphones-alt"></i>
            <span>Support 24/7</span>
            <p>We support 24h a day</p>
        </div>
        <div class="services-box">
            <i class="fas fa-sync"></i>
            <span>100% Money Back</span>
            <p>You have 30 days to Return</p>
        </div>   
    </section>
    <footer>
        <span class="copyright" align="center">Copyright 2022 - Gympact</span>
    </footer>
    
<script type="text/javascript">
var slideIndex = [1,1];
var slideId = ["mySlides1", "mySlides2"]
showSlides(1, 0);
showSlides(1, 1);

function plusSlides(n, no) {
  showSlides(slideIndex[no] += n, no);
}

function showSlides(n, no) {
  var i;
  var x = document.getElementsByClassName(slideId[no]);
  if (n > x.length) {slideIndex[no] = 1}
  if (n < 1) {slideIndex[no] = x.length}
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";
  }
  x[slideIndex[no]-1].style.display = "block";
  setTimeout(showSlides, 2000);
}
</script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<link rel="stylesheet" href="alert/dist/sweetalert.css">
<script type="text/javascript">

   var status=document.getElementById("status").value;
	 if(status=="failled")
		{
		swal("sorry","account problem","failled");
		}
	 else if(status=="success") {
		 swal("OK!","successfully logged","success");
	 }

</script>
</body>
</html>
