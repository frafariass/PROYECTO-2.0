<%-- 
    Document   : verocs
    Created on : 19-06-2019, 0:37:52
    Author     : lordp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="master.jsp" %>
<!DOCTYPE html>
<html>
    
    <%
        if(perfil == null)
        {
            response.sendRedirect("index.jsp");
        }else
        {
            if(perfil.getRol_id_rol() != 5)
            {
                response.sendRedirect("index.jsp");
            }
        }
    %>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>