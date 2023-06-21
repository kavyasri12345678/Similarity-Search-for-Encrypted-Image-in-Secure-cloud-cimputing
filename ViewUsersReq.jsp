<%-- 
    Document   : DataOwner
    Created on : 3 Oct, 2020, 8:37:58 AM
    Author     : KishanVenky
--%>

<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
<head>
<title>Similarity Search for Encrypted</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link rel="stylesheet" href="layout/styles/layout.css" type="text/css" />
</head>
<body id="top">
<div class="wrapper col1">
  <div id="header">
    <div id="logo" style="width:auto;">
         <h1><a href="#">Similarity Search for Encrypted</a></h1>
      <p><strong>Images inSecure Cloud Computing</strong></p>
  </div>
    
    <br class="clear" />
  </div>
</div>
<div class="wrapper col2">
  <div id="topbar">
    <div id="topnav">
      <ul>
        <li><a href="CloudHome.jsp">Home</a></li>
        <li><a href="ViewAllImages.jsp">View All Images</a></li>
        <li class="active"><a href="ViewUsersReq.jsp">View Users Request</a></li>
          
         <li class="last"><a href="Cloud.jsp">Logout</a></li>
      </ul>
    </div>
   
    <br class="clear" />
  </div>
</div>


<div class="wrapper col5">
  <div id="container">
    <div id="content">
  
     <center>
          <h2 style="margin-bottom:200px;">View All Users Requests</h2>
           
          <table>
              <tr><th>Sr.No</th><th>UserName</th><th>Image ID</th><th>Trapdoor</th><th>Get decriptKey</th></tr>
           <%
           try{
           ResultSet r=Queries.getExecuteQuery("select * from trapdoor t, image i where t.image_id=i.id");
           int i=0;
           while(r.next()){
               i=i+1;
               %>
              <tr>
                  <td><%=i%></td>
                   <td><%=r.getString("t.username")%></td>
                  <td><%=r.getString("t.image_id")%></td>
                  <td><%=r.getString("t.trapdoor")%></td>
           
                  <td><a href="GetDecryptKey.jsp?uid=<%=r.getString("t.user_id")%>&oid=<%=r.getString("i.owner_id")%>">Get Decrypt key</a></td>
                  
                 
              </tr>
              
              <%
           }
           
           }catch(Exception e){
       out.println(e);        
}%>
          </table>
           
        </center>

    </div>
    <div id="column">
     
    </div>
    <br class="clear" />
  </div>
</div>
<div class="wrapper col6">
  <div id="footer">
    
  
  </div>
</div>
<div class="wrapper col7">
  <div id="copyright">
    <p class="fl_left">Similarity Search for Encrypted Images inSecure Cloud Computing</p>
     <br class="clear" />
  </div>
</div>
</body>
</html>