<%-- 
    Document   : OwnerRegAction
    Created on : 29 Sep, 2020, 5:52:17 PM
    Author     : KishanVenky
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.Queries"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{

   
    String uid=request.getParameter("uid");
    String oid=request.getParameter("oid");
    
    System.out.println(uid);
    System.out.println(oid);
    
    ResultSet r=Queries.getExecuteQuery("select * from gkey g , image i where i.owner_id=g.owner_id and g.owner_id='"+oid+"'and g.user_id='"+uid+"'");
    String user_key=null;
    String image=null;
    while(r.next()){
     user_key=r.getString("g.user_key");
     image=r.getString("i.id");
    }
    
    String query="insert into decryptkey value(null,'"+uid+"','"+oid+"','"+image+"','"+user_key+"','waiting')";
    int i=Queries.getExecuteUpdate(query);
    if(i>0){
 response.sendRedirect("ViewUsersReq.jsp?msg=successful..!!");

    }else{
    
response.sendRedirect("ViewUsersReq.jsp?msg=Failed..!!");
}
}catch(Exception e){
    out.println(e);
}



%>