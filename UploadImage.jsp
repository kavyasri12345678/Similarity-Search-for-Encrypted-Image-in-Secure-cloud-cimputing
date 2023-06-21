<%-- 
    Document   : DataOwner
    Created on : 3 Oct, 2020, 8:37:58 AM
    Author     : KishanVenky
--%>

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
        <li class="active"><a href="UploadImage.jsp">Upload Image</a></li>
          <li><a href="ViewUploads.jsp">View Uploads</a></li>
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
          <h2 style="margin-bottom:200px;">Upload Image</h2>
           
          <form action="UploadImage" method="post" enctype="multipart/form-data">
              <table>   
                  <tr><th>Image Index</tH><td><input type="text" name="index" required=""></tD></tr>
                  <tr><th>Image Title</tH><td><input type="text" name="title" required=""></tD></tr>
                  <tr><th>Image Description</tH><td><textarea cols="40" rows="5" name="description" required=""></textarea></tD></tr>
                  <tr><th>Choose Image</tH><td><input type="file" name="image" required=""></tD></tr> 
                   <tr><th></tH><td><input type="submit" name="upload" required=""></tD></tr>
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