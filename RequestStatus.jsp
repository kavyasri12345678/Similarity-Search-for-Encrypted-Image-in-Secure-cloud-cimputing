<%-- 
    Document   : DataOwner
    Created on : 3 Oct, 2020, 8:37:58 AM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
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
        <li><a href="UserHome.jsp">Home</a></li>
        <li><a href="UserGenerateKey.jsp">Generate Key</a></li>
        <li><a href="SearchImage.jsp">Search Image</a></li>
          <li  class="active"><a href="RequestStatus.jsp">Request Status</a></li>
          
         <li class="last"><a href="ImageUser.jsp">Logout</a></li>
      </ul>
    </div>
   
    <br class="clear" />
  </div>
</div>


<div class="wrapper col5">
  <div id="container">
    <div id="content">
   <%
   String id=(String)session.getAttribute("id");
   String username=(String)session.getAttribute("username");
   String email=(String)session.getAttribute("email");
   
   
   %>
     <center>
          <h2 style="margin-bottom:200px;">Request Status</h2>
          <table>
              <tr>
                  <th>user id</th><th>decrypt key</th><th>View Image </th>
              </tr>
              <%
              try{
                 String query="select * from decryptkey where uid='"+id+"'";
                 ResultSet r=Queries.getExecuteQuery(query);
                 while(r.next()){
                     
                 
              %>
              <tr>
                  <td><%=r.getString("uid")%></td>
                    <td><%=r.getString("decryptkey")%></td>
                    <td><a href="viewimage.jsp?id=<%=r.getString("id")%>&imgid=<%=r.getString("image_id")%>">View Image</a></td>
              </tr>
              <%
              }
                  }catch(Exception e){
                   out.println(e);   
  }
              %>
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