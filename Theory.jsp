<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>


<html>
<head>

<link rel="stylesheet" href="bootstrap.min.css">


<script src="bootstrap.min.js"></script>

<link rel="stylesheet" href="home.css">


</head>
<body>

<%  
    
    
    if(((session.getAttribute("name"))!=null))
     	{
    
    
          
	     try
             {
             
              
              Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Feedback","root",null);
          

            Statement  st=con.createStatement();
            
PreparedStatement  st1=con.prepareStatement("select * from stu_info");

PreparedStatement  st2=con.prepareStatement("select * from teacher_info");

 ResultSet rs = st.executeQuery("select * from subject "); 

              
 ResultSet rs1=st1.executeQuery();
  ResultSet rs2 = st2.executeQuery(); 
    
  %>


              
              
              
<div class="jumbotron">
<h2><center>AJAY KUMAR GARG ENGINEERING COLLEGE,GHAZIABAD</center></h2>
<h3><center>STUDENT FEEDBACK FORM(FOR THEORY)</center></h3>
</div>


<div class="container" >



<form action="TheoryHandle.jsp" method="post">

</br>

<div class="form-group">
<label for="sname">ROLL_NO:</label>

<select class="form-control" id="sname" name="rno" onchange="My(this.value)" >
<option> Select Roll_no</option>


 <%  while(rs1.next()) { %>
<option><%=rs1.getString(3) %></option>
    
  <%  } %>  
  </select>
</div>

<div class="form-group">
<label for="Date">Date:</label>
<input type="date"  class="form-control" id="Date" name="Date" required >
</div>

<div class="form-group">
<label for="Room_No" Style="margin-left:842px; margin-top:-75px;">Room_No:</label>
<input type="text"  class="form-control" id="Room_No" name="Room_No" required >
</div>

<div class="form-group">
<label for="sel1">student_name:</label>
  <select class="form-control" id="sel1" name="student_name" required>
    <option></option>
   
   
  </select>
  </br>
  </div>


<div class="form-group">
<label for="LANAME">Name OF Faculty:</label>
 

<select class="form-control" id="LANAME" name="Nofm"  required>
<option> Select faclulty name</option>

 <%  while(rs2.next()) { %>
<option><%=rs2.getString(1) %></option>
    
  <%  } %>  
  </select>
</div>




<script>
function show(str) {
  var xhttp;  
  //alert(str);  
  if (str == "") {
    document.getElementById("Sub_Name").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("Sub_Name").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "ajaxSubName.jsp?q="+str, true);
  xhttp.send();
}




function My(str) {
  var xhttp;  
    
  if (str == "") {
    document.getElementById("Branch").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("Branch").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "ajaxBranchName.jsp?q="+str, true);
  xhttp.send();
  name(str);
}


function name(str)
{

//alert(str);

var xhttp;  
    
  if (str == "") {
    document.getElementById("sel1").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("sel1").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "ajaxStudentName.jsp?q="+str, true);
  xhttp.send();
  
Section(str);
Year(str);

}
function Section(str)
{
var xhttp;  
    
  if (str == "") {
    document.getElementById("sel1").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("Section").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "ajaxGetSection.jsp?q="+str, true);
  xhttp.send();

}
function Year(str)
{
var xhttp;  
    
  if (str == "") {
    document.getElementById("sel1").innerHTML = "";
    return;
  }
  xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (xhttp.readyState == 4 && xhttp.status == 200) {
      document.getElementById("Year").innerHTML = xhttp.responseText;
    }
  };
  xhttp.open("GET", "ajaxGetYear.jsp?q="+str, true);
  xhttp.send();



}



function Average1()
{

var a=parseInt(document.getElementById("m001").value);
var b=parseInt(document.getElementById("m002").value);
var c=parseInt(document.getElementById("m003").value);
var d=parseInt(document.getElementById("m004").value);
var e=parseInt(document.getElementById("m005").value);

var total=(a+b+c+d+e)/5;

//alert(total);

document.getElementById("office1").value=total;

}

function Average2()
{
var a=(document.getElementById("m006").value);
var b=(document.getElementById("m007").value);
var c=(document.getElementById("m008").value);
var d=(document.getElementById("m009").value);
var e=(document.getElementById("m0010").value);
var total=0;
if(a.localeCompare("yes"))
{
total=total+1;

}
if(b.localeCompare("yes"))
{
total=total+1;

}
if(c.localeCompare("yes"))
{
total=total+1;

}
if(d.localeCompare("yes"))
{
total=total+1;

}
if(e.localeCompare("yes"))
{
total=total+1;
alert(total);

}



}






</script>


<div class="form-group">
<label for="Sub_Code">Sub_Code:</label>

<select class="form-control" id="Sub_Code" name="SubCode" onchange="show(this.value)"  onfocusout="name()">
<option> Select Sub_Code </option>


 <%  while(rs.next()) { %>
<option><%= rs.getString(1) %></option>
    
  <%  } %>  
  </select>
</div>



<div class="form-group">
<label for="Branch">Branch:</label>
  <select class="form-control" id="Branch" name="Branch"  >
    <option>ME</option>
    <option>CSE</option>
    <option>IT</option>
	<option>CIVIL</option>
    <option>MCA</option>
    <option>MBA</option>
   
  </select>
  </div>



<div class="form-group">
<label for="Year" Style="margin-left:842px; margin-top:-75px;">Year:</label>
  <select class="form-control" id="Year" name="Year" required >
    <option>1</option>
    <option>2</option>
    <option>3</option>
	<option>4</option>
  
  </select>
  </div>

  <div class="form-group">
<label for="Sub_Name">Sub_Name:</label>
<select class="form-control" id="Sub_Name" name="Sub_Name" >
<option> </option>
</select>
</div>





 <div class="form-group">
<label for="Sem" Style="margin-left:842px; margin-top:-75px;" >Sem:</label>
  <select class="form-control" id="Sem" name="Sem" required >
    <option>1</option>
    <option>2</option>
    <option>3</option>
	<option>4</option>
	<option>5</option>
	<option>6</option>
  
  </select>
  </div>





<div class="form-group">
<label for="Section" Style="margin-left:400px; margin-top:-88px;">Section:</label>
<select  class="form-control" id="Section" name="Section" required>
<option>A</option>
<option>B</option>

</select>
</div>

</br>
<h1><center>PART A</center></h1>
<hr style="width:50%">
</br>
<p>Please Indicate your assessment on a scale of 1 to 5.Five being the best</p>


<div class="form-group">
<label for="m001" ><h3> 1. Coverage of subject material specified in the syllabus:</h3></label>
  <select class="form-control" id="m001" name="A" onchange="Average1()" >
    <option>1</option>
    <option>2</option>
    <option>3</option>
	<option>4</option>
	<option>5</option>
  
  </select>
  </div>


  <div class="form-group">
<label for="m002" ><h3> 2.Preparation and organization of lecture :</h3></label>
  <select class="form-control" id="m002" name="B" onchange="Average1()"  >
    <option>1</option>
    <option>2</option>
    <option>3</option>
	<option>4</option>
	<option>5</option>
  
  </select>
  </div>


  
  <div class="form-group">
<label for="m003" ><h3> 3.presentation and communication skills:</h3></label>
  <select class="form-control" id="m003" name="C" onchange="Average1()"  >
    <option>1</option>
    <option>2</option>
    <option>3</option>
	<option>4</option>
	<option>5</option>
  
  </select>
  </div>

   <div class="form-group">
<label for="m004" ><h3> 4.Quality of tutorial assignments:</h3></label>
  <select class="form-control" id="m004" name="D" onchange="Average1()"  >
    <option>1</option>
    <option>2</option>
    <option>3</option>
	<option>4</option>
	<option>5</option>
  
  </select>
  </div>

  <div class="form-group">
<label for="m005" ><h3> 5.Uniformity in pace of teaching during the semester:</h3></label>
  <select class="form-control" id="m005" name="E" onchange="Average1()" >
    <option>1</option>
    <option>2</option>
    <option>3</option>
	<option>4</option> 
	<option>5</option>
  
  </select>
  </div>
  
  <div class="form-group">
<label for="office1"><h3></>For Office use:</h3></label>
<input type="text"  class="form-control" id="office1"  name="Fou1">
</div>
  
  
  
  
  
</br>
<h1><center>PART B</center></h1>
<hr style="width:50%">
</br>


<div class="form-group">
<label for="m001" ><h3> 6. were two class conduct:</h3></label>
  <select class="form-control" id="m006" name="F"  >
    <option>yes</option>
    <option>no</option>
    
  </select>
  </div>


  <div class="form-group">
<label for="m002" ><h3> 7.were the illustration and writing legible:</h3></label>
  <select class="form-control" id="m007" name="G"  >
    <option>yes</option>
    <option>no</option>
    
  
  </select>
  </div>


  
  <div class="form-group">
<label for="m003" ><h3> 8.was the voice clear and audible:</h3></label>
  <select class="form-control" id="m008" name="H"  >
    <option>yes</option>
    <option>no</option>
    
  
  </select>
  </div>

   <div class="form-group">
<label for="m004" ><h3> 9.were faculty accesible for clarification of doubts:</h3></label>
  <select class="form-control" id="m009" name="I"  >
   <option>yes</option>
    <option>no</option>
    
  
  </select>
  </div>

  <div class="form-group">
<label for="m005" ><h3> 10. sessional tests shown and discuss:</h3></label>
  <select class="form-control" id="m0010" name="J"  >
    <option>yes</option>
    <option>no</option>
    
  
  </select>
  </div>
  
  <div class="form-group">
  <label for="office2"><h3></>For Office use:</h3></label>
<input type="text"  class="form-control" id="office2"  name="For_Office_use2">
</div>
  
  </br>
<input type="submit" class="btn btn-primary btn-lg btn-block">
</form>
       
     
 <%              
              st.close();
              rs.close();
              con.close();
             }
             catch(Exception ex)
             {
             ex.printStackTrace();
             }
             }
             else
				{
				response.sendRedirect("Login.jsp");

				}
             
             
              %>
            














</div>
</body>
</html>