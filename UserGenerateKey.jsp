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
        <li><a href="UserHome.jsp">Home</a></li>
        <li class="active"><a href="UserGenerateKey.jsp">Generate Key</a></li>
        <li><a href="SearchImage.jsp">Search Image</a></li>
          <li><a href="RequestStatus.jsp">Request Status</a></li>
          
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

            <h2 style="margin-bottom:200px;">Select Owner And Generate Key</h2>
           
          <form action="UserGenerateAction.jsp" method="post">
              <table>
                  <tR><th>Select User</th><td><select name="owner">
                              <option></option>
                              <%try{
                              ResultSet r=Queries.getExecuteQuery("select * from owner");
                              while(r.next()){
                                  %>
                                  <option value="<%=r.getString("id")%>"><%=r.getString("name")%></option>    
                                  
                                  <%
                              }
                              
                              
                              %>
                          </select></td></tr>
                  
                  <tr><th></th><td><input type="submit" value="Generate Key"></tD></tr>   
                  
                  
                               <%}catch(Exception e){
out.println(e);
}%>
                          </select></tD></tr>
              </table>
          </form>
          
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