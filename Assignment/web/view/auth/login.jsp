<%-- 
    Document   : login
    Created on : Jun 22, 2024, 4:33:30 PM
    Author     : Vanxuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/file/text/basic.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/file/text/logout.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
        <form action="login" method="POST" class="login-form">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username"/><br/>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password"/> <br/> 
            <% if(request.getAttribute("errorMessage") != null) { %>
            <div style="color: red; margin-top: 10px;">
                <%= request.getAttribute("errorMessage") %>
            </div>
            <% } %>
            <br/> 
            <input type="submit" value="Login"/>           

        </form>

        <a href="${pageContext.request.contextPath}/logout" class="logout-btn">Logout</a>

    </body>
</html>
