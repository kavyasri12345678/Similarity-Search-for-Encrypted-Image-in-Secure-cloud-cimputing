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
   
   
    String id1=request.getParameter("id");
String key1=Key.randomAlphaNumeric(20);
    
    String query="insert into trapdoor values(null,'"+id+"','"+username+"','"+id1+"','"+key1+"','waiting','waiting')";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
      %>
      <script type='text/javascript'>
          window.alert("Trapdoor Generated &Submitted to Cloud..!!");
          window.location="SearchImage.jsp";
      </script>
      <%
    }else{
%>
      <script type='text/javascript'>
          window.alert("Trapdoor Generation Failed..!!");
          window.location="SearchImage.jsp";
      </script>
      <%
}
}catch(Exception e){
    out.println(e);
}



%>