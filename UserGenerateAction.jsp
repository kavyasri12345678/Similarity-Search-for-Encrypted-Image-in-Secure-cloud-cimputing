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
   
   
    String owner=request.getParameter("owner");
    
    System.out.println(owner);
    
String key1=Key.randomAlphaNumeric(10);
    
    String query="update gkey set owner_key='"+key1+"' where owner_id='"+owner+"' and user_id='"+id+"'";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
      %>
      <script type='text/javascript'>
          window.alert("Key Generated Successful..!!");
          window.location="UserGenerateKey.jsp";
      </script>
      <%
    }else{
%>
      <script type='text/javascript'>
          window.alert("Key Generation Failed..!!");
          window.location="UserGenerateKey.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>