<%-- 
    Document   : OwnerRegAction
    Created on : 29 Sep, 2020, 5:52:17 PM
    Author     : KishanVenky
--%>

<%@page import="com.key.Key"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
      String id=(String)session.getAttribute("id");
   String username=(String)session.getAttribute("username");
   String email=(String)session.getAttribute("email");
   
   
    String username1=request.getParameter("username");
String key1=Key.randomAlphaNumeric(10);
    
    String query="insert into gkey values(null,'"+id+"','"+username1+"','"+key1+"','waiting')";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
      %>
      <script type='text/javascript'>
          window.alert("Key Generated Successful..!!");
          window.location="GenerateKey.jsp";
      </script>
      <%
    }else{
%>
      <script type='text/javascript'>
          window.alert("Key Generation Failed..!!");
          window.location="GenerateKey.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>