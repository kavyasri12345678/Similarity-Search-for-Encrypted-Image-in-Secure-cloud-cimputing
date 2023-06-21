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
        <li><a href="OwnerHome.jsp">Home</a></li>
           <li><a href="GenerateKey.jsp">Generate Key</a></li>
        <li><a href="UploadImage.jsp">Upload Image</a></li>
          <li class="active"><a href="ViewUploads.jsp">View Uploads</a></li>
      
         <li class="last"><a href="ImageOwner.jsp">Logout</a></li>
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
          <h2 style="margin-bottom:200px;">All Uploaded Images</h2>
           
          <table>
              <tr><th>Sr.No</th><th>Image Index</th><th>Cipher Index</th><th>Image Title</th><th>Image Description</th><th>Image</th></tr>
           <%
           try{
           ResultSet r=Queries.getExecuteQuery("select * from image where owner_id='"+id+"'");
           int i=0;
           while(r.next()){
               i=i+1;
               %>
              <tr>
                  <td><%=i%></td>
                  <td><%=r.getString("index_keyword")%></td>
                  <td><%=r.getString("cipher_index")%></td>
                  <td><%=r.getString("title")%></td>
                  <td><%=r.getString("description")%></td>
                  <td><image src="view.jsp?id=<%=r.getString("id")%>" width="100" height="100"/></td>
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