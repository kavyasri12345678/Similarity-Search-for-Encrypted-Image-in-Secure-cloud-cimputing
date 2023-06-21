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
        <li  class="active"><a href="SearchImage.jsp">Search Image</a></li>
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
   
   String keyword=request.getParameter("keyword");
   %>
     <center>
          <h2 style="margin-bottom:200px;">Search Result</h2>
           
          
          <table>
              <tr><th>Sr.No</th><th>Image Owner</th><th>Search Index</th><th>Similar Index</th><th>Trapdoor</th></tr> 
              <%
              try{
             String query="select * from image where index_keyword like '%"+keyword+"%' or title like '%"+keyword+"%'";
              ResultSet r=Queries.getExecuteQuery(query);
              int i=0;
              while(r.next()){
                  i=i+1;
                  %>
              <tr>
                        <th><%=i%></th>
                  <td><%=r.getString("owner_name")%></td>
                   <td><%=keyword%></td>
                    <td><%=r.getString("index_keyword")%></td>
                    <td><a href="GenerateTrapdoor.jsp?id=<%=r.getString("id")%>">Generate Trapdoor</a></td>
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