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
   
   String id1=request.getParameter("id");
   String imageid=request.getParameter("imageid");
   String keyword=request.getParameter("keyword");
   %>
     <center>
          <h2 style="margin-bottom:200px;">Request Status</h2>
          <table>
              <tr>
                  <th>Image</th>
              </tr>
              <%
              try{
                 String query="select * from decryptkey where id='"+id1+"'and decryptkey='"+keyword+"'";
                 ResultSet r=Queries.getExecuteQuery(query);
                 if(r.next()){
                     
                 
              %>
              <tr>
                
                    <td><image src="view.jsp?id=<%=imageid%>" width="200" height="200"/></td>
              </tr>
              <a href="RequestStatus.jsp">Back</a>
              <%
              }else{
%>
<script type="text/javascript">
    window.alert("verification failed..!!");
    window.location="RequestStatus.jsp";
</script>
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