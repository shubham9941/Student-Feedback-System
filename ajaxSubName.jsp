<%@ page language="java" import="java.sql.*" pageEncoding="ISO-8859-1"%>
<html>
<head></head>
<body>

<%



try
{

 Class.forName("com.mysql.jdbc.Driver");
 Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Feedback","root",null);
          
String Sub_Code=request.getParameter("q");
PreparedStatement  st=con.prepareStatement("select * from subject where sub_code=?");
	st.setString(1,Sub_Code);
 ResultSet rs = st.executeQuery(); %>
 <select  name="Sub_Name">
 <% 
while(rs.next())
{ %>


<option> <%= rs.getString(2) %>  </option>


<% }





} catch(Exception e)
{


}



 %>




</body>
</html>
